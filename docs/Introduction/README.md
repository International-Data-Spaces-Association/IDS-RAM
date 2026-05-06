# Introduction

The emergence of dataspaces as a key enabler for trustworthy data sharing has introduced a new class of data
architecture principles. Within this landscape, the __International Data Spaces Association (IDSA)__ provides a
foundational Rulebook that defines the core principles, roles, and capabilities required to establish and operate such
environments. However, turning these high-level principles into actionable, technical guidance requires a dedicated
architectural framework. __This is the purpose of the IDS Reference Architecture Model (IDS-RAM)__.

The IDS-RAM is the central compendium of technical documents that operationalizes the concepts defined in the IDSA Rulebook. It maps
abstract governance models, data usage policies, and protocol specifications into concrete technical (logical)
components, interfaces, and behavioral patterns. It does so with a clear focus: enabling interoperability, scalability,
and conformance without prescribing a single implementation path. In other words, the IDS-RAM is not a blueprint but a
design space—a structured but flexible guide that supports diverse requirements while preserving the integrity of the
IDSA dataspace model.

This document is for system architects, software engineers, and infrastructure designers who are tasked with building or
integrating components within a dataspace to enable business-driven data ecosystems. If you’re looking to understand
what makes a connector IDSA-compliant, how to build interoperable and integrable services, or how to maintain trust and
policies in a decentralized environment—this is your technical guidance.

Central to the IDS-RAM are specifications such as the __Dataspace Protocol (DSP)__ and the __Decentralized Claims Protocol (
DCP)__. These protocols define how components communicate, how identities are exchanged and verified, and how
policy-conformant data discovery and transfer is achieved. The IDS-RAM highlights these specifications, covering components,
message formats, interaction sequences, and binding details. Further, it describes in depth how they are integrated with
key capabilities like identity management, observability, data discovery, contract negotiation and secure data transfer. Details of such capabilities are maintained within dedicated documents under the purview of IDSA. The IDS-RAM document integrates and connects these documents to provide a comprehensive overview and a single source of truth for architecture models according to IDSA specifications.

To support real-world applicability, the IDS-RAM organizes its content into two major sections:

__Capability Mapping:__ This section lists the essential capabilities enabled through dataspaces—such as data discovery,
policy enforcement, usage control, identity resolution, and observability. Each capability is analyzed from a technical
perspective, detailing how it can be implemented within a compliant dataspace. The descriptions are aligned with the
IDSA Rulebook and maintains references to the foundational concepts to highlight the strong relation between the two
documents. The IDS-RAM content is however grounded in system-level detail, interactions pattern, documents expected
behavior, and provides guidance on integration patterns of infrastructure and other technologies.

__Architectural Best Practices:__ Recognizing the diversity of business and technical requirements across domains, the
IDS-RAM does not enforce a singular architecture. Instead, it presents validated patterns and warns against known
anti-patterns, guiding implementers through the architectural decisions while setting up or operating a dataspace.
Whether the goal is to create a lightweight edge connector, operate a multi-tenant marketplace, or integrate with
existing enterprise systems, the IDS-RAM aims on outlining the architectural considerations and trade-offs—while maintaining
compatibility with the IDSA model.

The IDS-RAM is intentionally neutral with respect to implementations. It refrains from endorsing any specific codebase or
vendor product. Where useful, illustrative code snippets and configuration examples are included to clarify complex
concepts and show practical realizations. For this, available open source projects (such as those maintained under the
Eclipse Dataspace Working Group (EDWG) initiative) are referenced.

Importantly, the IDS-RAM is a _living_ document due to continuous updates of IDSA technical documents this document refers to. Therefore, rather than locking into static version cycles, it evolves incrementally with latest releases of technical documents.
Changes of these documents are managed through the corresponding GitHub repositories, with full traceability of modifications and clear visibility into the rationale
behind decisions. Periodic release tags of the IDS-RAM document however will provide stable points of reference, allowing contributors and adopters to align
their work with a consistent snapshot of the evolving model.

## Contributions
The IDSA Working Group Architecure creates and maintains the IDS-RAM. Its mission is to guide architects and software engineers in designing and developing trusted, interoperable, and compliant data spaces.

To know more about the IDSA Working Group Architecture, please visit [our home page](https://internationaldataspaces.org/we/working-groups/). The [IDSA working groups brochure](https://internationaldataspaces.org/download/50753/?tmstv=1770728340) provides details on how to get involved and how to contribute.

Please note: IDSA working group activities are reserved for members. Find more information about IDSA membership here: [Become a Member](https://internationaldataspaces.org/we/become-a-member/)

## Terminology
IDS-RAM uses terms as defined in the [IDSA Glossary](external/glossary/glossary/). 
