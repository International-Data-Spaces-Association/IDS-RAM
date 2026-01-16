# Value-Adding Services in Decentralized Dataspaces

While decentralized dataspaces fundamentally rely on autonomous participants interacting through standardized protocols such as DSP and DCP, many real-world ecosystems require additional value-adding services to support discovery, coordination, trust, and economic processes. Rather than introducing centralized platform components, these services must be implemented in a way that preserves the core principles of decentralization, sovereignty, and participant autonomy. In this section, we describing an architectural pattern for integrating value-adding services as specialized participants within the dataspace itself. We use a matchmaking service and a billing service as concrete examples and show how they can be realized using standard dataspace interactions.

Each service operates under the governance rules of the Dataspace Governance Authority (DSGA) and the accepted Dataspace Trust Framework(s) (DTFs). Credential issuance and verification follow those DTFs and are exchanged using DCP, while contract negotiation and data exchange are governed by DSP. This keeps the services interoperable and avoids creating privileged, centralized control points.

## Matchmaking Service

The matchmaking service is realized as a dedicated dataspace participant operated by an independent service provider organization. Data-holding participants that wish to make their assets discoverable provide structured metadata about their data offerings to the matchmaking participant via event-based metadata feeds. This metadata includes references to the corresponding DSP contract offers through which consumers can later negotiate access to the actual data. The event-driven approach allows the matchmaking service to efficiently integrate updates, additions, and removals into its continuously maintained search index.

![Figure 1-Matchmaking Service](../media/matchmaking_service.jpg)

Based on the aggregated metadata, the matchmaking service builds and operates a searchable index and exposes a contract-governed search API within the dataspace. Any participant seeking data can establish a DSP contract with the matchmaking service to use this search interface. In addition to synchronous search, asynchronous interaction patterns can be supported: consumer participants may register data needs at the matchmaking service and are notified when matching metadata becomes available.

Search results returned to consumers contain metadata and references to the actual DSP offers of the respective data providers. The subsequent negotiation, contracting, and exchange of the actual data remain strictly peer-to-peer between the consumer and the data-providing participants and are fully governed by DSP. The provision of metadata to the matchmaking service and the use of the search API are also all consistently governed by DSP contracts for interoperable and standardized integration.

Metadata visibility can be scoped by policy. Providers may publish public metadata, or restrict metadata feeds and search access using DSP contracts and DCP claims (e.g., membership or role-based credentials). Update and removal events are authorized by the original publisher, preserving data sovereignty while still enabling efficient discovery.

## Billing Service

The billing service is implemented as a dedicated dataspace participant operated by a billing service provider organization. Both data providers and data consumers that wish to use this billing infrastructure are onboarded as customers to the billing provider. Onboarding establishes the roles and credentials: providers are registered and authorized to report usage for billable exchanges, while consumers receive a trust credential that verifies their eligibility to be billed through this specific billing provider.

![Figure 2-Billing Service](../media/billing_service.jpg)

After onboarding, a data provider may offer data under the explicit condition that consumption of the corresponding DSP contract offer is billed via the selected billing provider. To enforce this, the provider requires that only consumers presenting a valid billing trust credential issued by the billing provider are allowed to contract the offer. These trust credentials are issued and presented using DCP.

Once a consumer contracts a billable offer, the data exchange itself remains peer-to-peer between provider and consumer and is governed by DSP. In parallel, the provider transmits usage data for all transfers to the billing service provider. The billing provider performs invoicing and payment processing directly with the consumer organization and sends operational notifications, such as payment and settlement status, back to the data provider. Trust credential exchange is governed by DCP, while usage data, notifications, and contractual data exchange are consistently governed by DSP, preserving the decentralized control model.