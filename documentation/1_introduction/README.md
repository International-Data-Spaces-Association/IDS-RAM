# Introduction

The emergence of dataspaces as a key enabler for trustworthy data sharing has introduced a new class of data
architecture principles. Within this landscape, the __International Data Spaces Association (IDSA)__ provides a
foundational Rulebook that defines the core principles, roles, and capabilities required to establish and operate such
environments. However, turning these high-level principles into actionable, technical guidance requires a dedicated
architectural framework. __This is the purpose of the Reference Architecture Model (RAM)__.

The RAM is the central technical document that operationalizes the concepts defined in the IDSA Rulebook. It maps
abstract governance models, data usage policies, and protocol specifications into concrete technical (logical)
components, interfaces, and behavioral patterns. It does so with a clear focus: enabling interoperability, scalability,
and conformance without prescribing a single implementation path. In other words, the RAM is not a blueprint but a
design space—a structured but flexible guide that supports diverse requirements while preserving the integrity of the
IDSA dataspace model.

This document is for system architects, software engineers, and infrastructure designers who are tasked with building or
integrating components within a dataspace to enable business-driven data ecosystems. If you’re looking to understand
what makes a connector IDSA-compliant, how to build interoperable and integrable services, or how to maintain trust and
policies in a decentralized environment—this is your technical guidance.

Central to the RAM are specifications such as the __Dataspace Protocol (DSP)__ and the __Decentralized Claims Protocol (
DCP)__. These protocols define how components communicate, how identities are exchanged and verified, and how
policy-conformant data discovery and transfer is achieved. The RAM highlights these specifications, covering components,
message formats, interaction sequences, and binding details. Further, it describes in depth how they are integrated with
key capabilities like identity management, observability, data discovery, contract negotiation and secure data transfer.

To support real-world applicability, the RAM organizes its content into two major sections:

__Capability Mapping:__ This section lists the essential capabilities enabled through dataspaces—such as data discovery,
policy enforcement, usage control, identity resolution, and observability. Each capability is analyzed from a technical
perspective, detailing how it can be implemented within a compliant dataspace. The descriptions are aligned with the
IDSA Rulebook and maintains references to the foundational concepts to highlight the strong relation between the two
documents. The RAM content is however grounded in system-level detail, interactions pattern, documents expected
behavior, and provides guidance on integration patterns of infrastructure and other technologies.

__Architectural Best Practices:__ Recognizing the diversity of business and technical requirements across domains, the
RAM does not enforce a singular architecture. Instead, it presents validated patterns and warns against known
anti-patterns, guiding implementers through the architectural decisions while setting up or operating a dataspace.
Whether the goal is to create a lightweight edge connector, operate a multi-tenant marketplace, or integrate with
existing enterprise systems, the RAM aims on outlining the architectural considerations and trade-offs—while maintaining
compatibility with the IDSA model.

The RAM is intentionally neutral with respect to implementations. It refrains from endorsing any specific codebase or
vendor product. Where useful, illustrative code snippets and configuration examples are included to clarify complex
concepts and show practical realizations. For this, available open source projects (such as those maintained under the
Eclipse Dataspace Working Group (EDWG) initiative) are referenced.

Importantly, the RAM is a _living_ document. Rather than locking into static version cycles, it evolves incrementally.
Changes are managed through GitHub, with full traceability of modifications and clear visibility into the rationale
behind decisions. Periodic release tags provide stable points of reference, allowing contributors and adopters to align
their work with a consistent snapshot of the evolving model.

