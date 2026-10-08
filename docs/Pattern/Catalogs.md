# Catalogs

This section provides architectural options for realizing dataset publication and discovery in a data space. For the underlying metadata model and discovery requirements, see the [IDSA Rulebook](https://kb.internationaldataspaces.org/external/rulebook/120_DataDiscoveryServices)'s data discovery guidance and the [Dataspace Protocol Catalog Protocol](https://eclipse-dataspace-protocol-base.github.io/DataspaceProtocol/2025-1-err1/#catalog-protocol). This section does not repeat them but focuses on the architecture patterns and their trade-offs.

Some aspects of discovery are the same in every pattern and are treated here as a shared baseline. Metadata is expressed with DCAT: a Catalog contains Datasets, each with one or more Distributions and an associated DataService describing where and how the dataset can be obtained, and each Dataset carries one or more ODRL offers stating the policies under which it may be used. A catalog holds these descriptions and offers only — never the data itself.

Data discovery is a control-plane activity, separate from the Transfer Process. A catalog is served through the Dataspace Protocol Catalog Protocol: a Catalog Request returns a Catalog, and a Dataset Request returns a single Dataset. Catalog views are credential-scoped: a requester sees only the datasets and offers that its presented claims and the datasets' access policies permit, with identities and credentials conveyed through the Decentralized Claims Protocol. The provider of a dataset is the authoritative source of the DCAT metadata describing it.

Connectors are also often not reachable from the public Internet, as they typically accept connections only from allowlisted, authenticated peers. Consequently, the required network reachability between parties and endpoints depends on the chosen pattern and is described for each pattern below.

What the patterns below change is where the catalog index lives and who operates it, how metadata from many providers is brought together (if at all), the network reachability each pattern requires, and the resulting freshness, availability, trust, and search experience. As with the other capabilities, the options form a spectrum from a single central index to purely peer-to-peer discovery.

## Central and federated catalogs

In the central variant a single Catalog Service aggregates metadata from all participants into one authoritative index that consumers query. In the federated variant several catalog services, typically per domain or sub-community, are aggregated or cross-queried so consumers obtain a combined view without a single global operator. Either way, consumers get one place (or a few) to search and rely at query time on an index that someone operates. The index may be operated by the Data Space Governance Authority (DSGA) itself, by an operator acting under the DSGA's authority (such as an operations company), or by an intermediary offering the catalog as a value-added service. In the first two cases the index is a governance-provided service for which the DSGA remains accountable. Instead, in the third case the intermediary operates in its own right and, following the Rulebook, is not itself the DSGA. An operations company thus operates governance services under the DSGA's authority, whereas an intermediary provides a value-added service independently.

A central or federated catalog may also provide metadata that is not included in DCAT. For example, participants may be able to add organizational metadata or branding information that is available only through the portal. Such information is specific to the data space and portal implementation and is therefore considered an optional extension.

### Collecting metadata centrally: push versus pull

A central or federated index has to be populated from the providers. There are two basic approaches, which can also be combined: push and pull.

#### Push (publication)

Each participant actively publishes its dataset descriptions and offers to the catalog through a publication interface and sends updates whenever its offerings change; the catalog is a mostly passive recipient. This gives near-real-time freshness at the moment of change, lets each provider control exactly what it exposes and when, and does not require the provider's catalog endpoint to be continuously reachable. The costs are that providers must implement publication and reliably send updates and deregistrations — otherwise entries go stale — and that the catalog must authenticate publishers and validate submitted metadata, since it now persists a copy that can drift from the source.

#### Pull (harvesting)

The catalog periodically queries each participant's catalog endpoint over the Catalog Protocol and harvests their DCAT catalogs into the index — the approach taken by a federated-catalog crawler. Providers then need only expose the standard catalog endpoint they already offer for direct discovery, with no separate publication logic, and the catalog fetches from the authoritative source and can normalize and validate centrally. The costs are that freshness is bounded by the crawl interval, each provider's endpoint must be reachable when crawled, and crawling scales with the number of participants.

#### Reachability

The two approaches also differ in which side opens the connection, which matters because connectors may not be publicly reachable. With push, each participant connects outbound to one well-known catalog endpoint, usually requiring no new inbound exposure on the participant's side. With pull, the catalog connects inbound to each participant, so every participant must allowlist the operator's source addresses. This stays manageable precisely because the operator set is small and fixed: the governance framework can name the DSGA or the few permitted catalog operators, and each participant allowlists only those. Either way, the set of parties that must reach a given connector stays small and governable.

#### Authorization

Since catalog views are credential-scoped, a crawler cannot simply fetch one global view and serve it to everyone. It must either crawl under a service identity and then re-apply each dataset's access policy against the requesting consumer's claims at query time, or crawl on behalf of individual consumers. For example, the catalog operator may hold a credential granting a harvesting permission that participants recognize through the applicable Dataspace Trust Framework (DTF), so that providers return their full catalogs to it. Note that this concentrates all restricted metadata at the operator, whereas crawling per consumer does not. A central index that ignores the access policies will either expose the existence of restricted datasets or hide datasets a consumer is entitled to see.

Push-based collection faces the same requirement from the other side: the catalog must store each dataset's access policy alongside its metadata so it can scope what each consumer sees. In practice the two approaches are often combined — for example, providers push change notifications while the catalog pulls a full synchronization on a schedule — to balance freshness against load.

### Trade-offs for central and federated catalogs

A central or federated catalog gives the best discovery experience: a single, consistent place to search across many providers, with server-side query, ranking, and normalization.

The trade-offs are that the index is a runtime dependency and a potential single point of failure for discovery (though not for data transfer, which remains peer-to-peer), its contents can be stale relative to the source, and whoever operates it can see the aggregate of what participants offer. This is a confidentiality and neutrality consideration, since the full catalog can reveal competitive information or let the operator favour or hide offerings. As with any central component, the centralization should be justified and mitigated — for example through replication or high availability, consumer-side caching, credential-scoped visibility so that no single view exposes everything, and federation so that no single operator holds the whole index.

## Decentral catalogs

Here there is no aggregated central index. Each participant exposes its own catalog through its connector's Catalog Service endpoint, and consumers discover offerings by querying providers directly over the Catalog Protocol. Metadata stays at its source, so it is always authoritative and current, and each provider enforces credential-scoped visibility at its own endpoint using the requester's claims. No operator sees the whole space, and there is no shared component whose failure stops discovery.

The open question in this pattern is how a consumer finds the providers worth querying. One option is consumer-side aggregation where a participant queries the endpoints relevant to it and builds its own local index. Another option is a decentralized or replicated directory of catalog endpoints which provides a lightweight shared list of participants and their connector endpoints. This approach is far smaller and less sensitive than a full metadata catalog, and can itself be anchored in the manner described for the registry in the DSGA pattern. A third option is federated-catalog components that any participant may run for its own use, harvesting from others as above. These blur the line with the central pattern, the difference being that any such index is optional, participant-operated, and not a shared dependency.

### Trade-offs for decentral catalogs

Decentral discovery maximizes autonomy, keeps metadata authoritative and fresh, removes the single point of failure, and prevents any operator from seeing the whole catalog.

The costs are the absence of a single searchable view: consumers must know or discover where to look, queries fan out across many endpoints, and building a global or ranked search is harder and pushed to the consumer side. Discovering endpoints in the first place needs at least a minimal shared directory or out-of-band knowledge, and consistency across independently served catalogs cannot be assumed. This pattern fits data spaces that prioritize autonomy, confidentiality of who offers what, and resilience over the convenience of centralized search.

A further constraint is network reachability. Because connectors may not be publicly reachable, full peer-to-peer discovery requires all-to-all connectivity. In practice this means that every provider must accept inbound discovery queries from every other participant — not only from the few it ends up transacting with. This is an allowlisting burden that grows with the square of the number of participants, enlarges each connector's attack surface, and must be reconfigured as the participant set changes. Mitigations exist — a shared relay or gateway that connectors reach outbound-only, or a governance-defined connectivity fabric (for example a shared mTLS trust domain or network overlay) where reachability follows from membership rather than per-peer allowlisting — but each of these reintroduces a shared component. Network reachability therefore pushes the decentral pattern back toward a federated or central arrangement — the mirror image of the caching argument in the DSGA pattern, where distributing governance data to participants pushes a central arrangement toward the decentral end of the spectrum.
