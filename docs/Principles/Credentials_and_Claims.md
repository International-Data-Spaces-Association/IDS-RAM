# Credentials & Claims
 
Based on the trust framework Data Space Governance Authority establishes in a data space, Credentials and Claims provide the architectural means for **identity, trust, and authorization** for participants. It helps ensure that all participants and their technical components (Connectors/participant agents) are uniquely identified and their security posture is verifiable.  

This capability is realized through the **Decentralized Claims Protocol (DCP)**, which acts as an interoperable overlay to DSP.  

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
  - [Trust](https://github.com/International-Data-Spaces-Association/IDSA-Rulebook/blob/Rulebook-3.0/008_Trust.md)
  - [Decentralization: Trust Frameworks and Credential Management](https://github.com/International-Data-Spaces-Association/IDSA-Rulebook/blob/Rulebook-3.0/007_Decentralization.md#trust-frameworks-and-credential-management)
  - [Dataspace Trust Frameworks](https://github.com/International-Data-Spaces-Association/IDSA-Rulebook/blob/Rulebook-3.0/009_Dataspace_Trust_Frameworks.md)
  - [Establishing Trust](https://github.com/International-Data-Spaces-Association/IDSA-Rulebook/blob/Rulebook-3.0/103_Establishing_Trust.md)
  - [Attributes and Claims](https://github.com/International-Data-Spaces-Association/IDSA-Rulebook/blob/Rulebook-3.0/104_Attributes_and_claims.md)
  - [Identity](https://github.com/International-Data-Spaces-Association/IDSA-Rulebook/blob/Rulebook-3.0/107_Identity.md)
  - [Decentralized Patterns: Onboarding](https://github.com/International-Data-Spaces-Association/IDSA-Rulebook/blob/Rulebook-3.0/140_Decentralized_Patterns_Onboarding.md)
 
- **Technical specifications:**
  - [Decentralized Claims Protocol (DCP)](https://eclipse-dataspace-dcp.github.io/decentralized-claims-protocol/)
    
- **Related Focus Papers:**
  - [Draft paper on Identifiers in Data Spaces](https://github.com/International-Data-Spaces-Association/identity-in-data-spaces)
 
