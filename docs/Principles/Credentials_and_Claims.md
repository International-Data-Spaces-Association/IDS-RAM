# Credentials & Claims

Based on the trust framework Data Space Governance Authority establishes in a data space, Credentials and Claims provide the architectural means for **identity, trust, and authorization** for participants. It helps ensure that all participants and their technical components (Connectors/participant agents) are uniquely identified and their security posture is verifiable.  

This capability is realized through the **Decentralized Claims Protocol (DCP)**, which acts as an interoperable overlay to Dataspace Protocol (DSP).  

DCP:

- Enables participants to issue, present, and verify verifiable credentials
- Supports decentralized trust anchors and privacy-preserving verification
- Integrates with DSP interactions to gate discovery, negotiation, and orchestration
  
 Credentials and claims ensure that trust decisions are **evidence-based, contextual, and automated**, without introducing centralized identity providers.

## Key architectural concepts

- **Decentralized Identity:** Implemented via the **Decentralized Claims Protocol (DCP)**, which utilizes self-issued identity tokens and Decentralized Identifiers (DIDs).
- **Verifiable Credentials:** Participants manage organizational identities and "claims" (e.g., certification, membership) without relying on a single central authority. This allows for a "trust-by-design" approach where trust anchors can be federated.
- **Authentication:** Connectors use the Authorization header in HTTPS bindings to pass these identity tokens, ensuring that only authenticated "Participant Agents" can access services.

## Further resources

- **IDSA Rulebook Guidance:**
  - [Trust](https://kb.internationaldataspaces.org/external/rulebook/008_Trust)
  - [Decentralization: Trust Frameworks and Credential Management](https://kb.internationaldataspaces.org/external/rulebook/007_Decentralization/#trust-frameworks-and-credential-management)
  - [Dataspace Trust Frameworks](https://kb.internationaldataspaces.org/external/rulebook/009_Dataspace_Trust_Frameworks)
  - [Establishing Trust](https://kb.internationaldataspaces.org/external/rulebook/103_Establishing_Trust)
  - [Attributes and Claims](https://kb.internationaldataspaces.org/external/rulebook/104_Attributes_and_claims)
  - [Identity](https://kb.internationaldataspaces.org/external/rulebook/107_Identity)
  - [Decentralized Patterns: Onboarding](https://kb.internationaldataspaces.org/external/rulebook/140_Decentralized_Patterns_Onboarding)

- **Technical specifications:**
  - [Decentralized Claims Protocol (DCP)](https://eclipse-dataspace-dcp.github.io/decentralized-claims-protocol/)
  - [W3C Verified Credentials Data Model](https://www.w3.org/TR/vc-data-model-2.1/)  
  - [Decentralized Identifiers (DIDs)](https://www.w3.org/TR/did-1.1/)

- **Related Focus Papers:**
  - [Draft paper on Identifiers in Data Spaces](https://github.com/International-Data-Spaces-Association/identity-in-data-spaces)

- **IDS-RAM Architectural Patterns:**
  - [DSGA Patterns](../Pattern/DSGA.md)
