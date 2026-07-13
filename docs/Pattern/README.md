# Architecture Pattern and Guidelines

*This chapter provides more concrete architecture guidelines on how to design different architecture patterns within a dataspace. Beside the introduction and explanation, trade-offs are highlighted.*

*Please note the content on this page does not reflect the current developments yet, instead a preview of the upcoming release and an outline of what to expect is provided.*

## Data Space Governance Authority (DSGA)

This section defines different architectural options for realizing a Data Space 
Governance Authority (DSGA). Please also refer to the IDSA Rulebook page [DSGA](https://kb.internationaldataspaces.org/external/rulebook/006_DSGA).

The Rulebook defines the DSGA as a functional role and distinguishes it from the
Data Space Governance Framework it establishes and enforces. It also defines the
decentralization principle that guides the architectural realization of the DSGA.
This section does not repeat those definitions, but focuses on the architectural
options for realizing the DSGA and their trade-offs.

From an architectural perspective, the governance framework itself can remain
the same across all options. What varies is how the DSGA function is realized
and where responsibility for implementing and enforcing the Governance Framework
resides. Those choices affect participant autonomy, resilience, accountability,
operational cost, and neutrality. The patterns can be compared along four
dimensions:

1. Governance authority – who establishes and changes the Governance Framework,
   and admits or removes participants.
2. Trust-root topology – how trust anchors and credential issuers are organized
   and distributed.
3. Runtime dependencies – whether trust establishment or participant discovery
   requires synchronous interaction with shared services.
4. Control and neutrality – whether any participant can control, favour, or
   exclude others, and what safeguards exist to prevent this.

The options form a spectrum rather than discrete choices. As governance authority
and information are distributed to participants and mandatory runtime dependencies
on shared services are reduced, a data space moves toward the decentralized end
of the spectrum.

### Central and Federated

Here the DSGA function is embodied in shared infrastructure. In the central
variant a single authority — typically a dedicated legal entity such as an
operations company — provides the mandatory governance services consumed by all
participants. In the federated variant several authorities operate under a
common trust list (a shared set of trusted trust anchors and credential issuers),
distributing the function without fully decentralizing it. Both rely on services
that participants depend on at runtime.

Not all governance services are consumed in the same way. Some are used only
during participant lifecycle events, such as onboarding services that register
new participants. Others are consulted during data-sharing interactions between
participants, for example registries that resolve information about participants
and their connectors. These runtime services introduce a synchronous dependency
and can become a single point of failure if their availability is required for
every interaction.

This dependency can be mitigated in two ways. One approach is to operate the
governance service with high availability. A more decentralized approach is to
eliminate the synchronous dependency by distributing the required configuration
and reference data to participants. Each participant caches the governance data
locally and evaluates it during interactions instead of querying the governance
service at runtime. This avoids a runtime dependency on centralized components
and aligns with the DTF guidance to avoid assuming synchronous communication or
the continuous availability of centralized services. Enabling caching moves the
pattern toward the decentralized end of the spectrum, since each participant then
holds the governance data it needs locally.

This pattern is often appropriate where a data space needs a clear single point
of accountability, simplified and consistent onboarding, an authoritative source
of truth, or where regulation requires a designated responsible entity.

#### Trade-offs

This pattern provides clear accountability and contractual responsibility through
a shared authority. It simplifies and standardizes onboarding, dispute resolution,
and governance processes, provides an authoritative source of truth, reduces
coordination effort for participants, and is straightforward to bootstrap.

The trade-off is greater reliance on centralized governance. Shared services may
become runtime dependencies and potential single points of failure unless
mitigated, for example through high availability or local caching of governance
data. Centralization can also reduce participant autonomy and create neutrality
risks if the shared authority can favour or exclude participants. As required
by the Rulebook, such centralization should be explicitly justified and
complemented by appropriate safeguards, including transparent governance
processes, audit rights, revocation mechanisms, and, where feasible, alternative
providers.

### Decentral

Here the DSGA function is not embodied in shared infrastructure. Governing
authority is not delegated to a designated party but exercised collectively:
the governance framework — the DTFs in force together with any data-space-specific
provisions — is distributed to every participant, who applies and enforces it
locally, and decisions about the rules are taken jointly rather than by any
single actor.

Trust is not rooted in a single authority or central identity provider. Instead,  
participants accept credentials from multiple independent issuers and each
chooses which trust anchors and issuers to rely on. There is no mandated runtime
dependency on a shared service: each participant holds the governance data it
needs locally and, where an authoritative statement such as a revocation check
is required, queries an external Oracle of its own choosing. As a result, no
single actor holds power over the others and there is no shared component whose
failure halts the data space; any shared component that does appear is optional
and chosen by the participants.

Onboarding reflects the same collective logic: either a one-time onboarding entity
issues a membership credential at join time with no ongoing dependency, or
membership is established peer-to-peer by presenting claims to an existing
participant that evaluates the membership rules directly.

One possible realization of this pattern is a permissioned distributed ledger (DLT)
operated jointly by the participants. In this case, the legislative aspect of
the DSGA function is exercised collectively: governance decisions, such as adopting
or amending DTFs, changing governance parameters, or admitting and removing
participants, are proposed and voted through the ledger. Smart contracts encode
the agreed governance rules and execute the agreed outcome, for example by updating
the accepted set of trust anchors or the revocation registry. Typical functions
implemented through the ledger include collective governance and voting,
tamper-evident registries for trust anchors, credential issuers, membership,
and revocation status, as well as notarization anchors supporting audit and
observability. Because the ledger is jointly operated and replicated across
participants, no single participant controls these governance functions and there is
no single point of failure.

Three architectural boundaries preserve the decentral characteristics of this
pattern. First, data sharing remains peer-to-peer and off-ledger: only governance
state, decisions, and cryptographic commitments (hashes) are recorded, never
the shared data itself, and generally not participants' credentials or claims.
Second, trust evaluation remains local. Participants evaluate governance
information using their locally maintained copy of the ledger rather than
querying a shared service during each interaction, avoiding synchronous runtime
dependencies in line with the DTF guidance against assuming global information
or continuously available centralized services. Third, because ledger contents
are replicated across participants, personal or otherwise sensitive information
should not be stored on the ledger. Instead, off-ledger storage should be
combined with ledger commitments and, where appropriate, zero-knowledge proofs
to support selective disclosure in accordance with the attribute-based trust
model.

A smart contract in this context is executable code deployed on the distributed
ledger. It is distinct from the IDSA data sharing contract negotiated bilaterally
between participants during contract negotiation, and the two should not be
conflated.

This pattern is appropriate where participant autonomy, resilience, neutrality,
and the absence of mandatory runtime dependencies on shared governance services
are primary objectives. It is particularly suitable where governance can be
exercised collectively and participants are willing to share responsibility for
operating the governance framework.

#### Trade-offs

This pattern provides maximal participant autonomy and agency, neutrality with
no single participant holding power over others, the absence of a single point of
failure, freedom to choose providers and avoid lock-in, and strong resilience
through distributed governance.

The trade-offs are increased coordination and integration effort for participants
and greater overall architectural complexity. Achieving consistency and
interoperability is more challenging without shared services and depends on
shared semantics, such as a common claim vocabulary. Reconciliation and dispute
resolution require well-defined governance rules, escalation paths, and
appropriate consensus thresholds. Dynamic runtime trust also demands robust
negotiation protocols and continuous trust verification. Decentralized onboarding
mechanisms are described in the Rulebook's [Decentralized Onboarding Patterns](https://kb.internationaldataspaces.org/external/rulebook/140_Decentralized_Patterns_Onboarding).

## Catalogs
*Different architectural options for implementing Catalogs in the context of dataspaces. Please also refer to the IDSA Rulebook page [Cataloging](https://kb.internationaldataspaces.org/external/rulebook/120_DataDiscoveryServices)*

### Federated or Central (Marketplace)
*Insights on federated or central catalogs and corresponding trade-offs*

### Decentral
*Insights on decentral catalogs and corresponding trade-offs*


## Observer
*Different architectural options for implementing Observer role. Please also refer to the IDSA Rulebook page [Observability](https://kb.internationaldataspaces.org/external/rulebook/121_Observability) and IDSA position paper [Observability in Data Spaces](https://internationaldataspaces.org/download/51606/?tmstv=1777284023)* 

### Federated or Central Escrow

### Decentral
*Insights on decentral observability and corresponding trade-offs*
