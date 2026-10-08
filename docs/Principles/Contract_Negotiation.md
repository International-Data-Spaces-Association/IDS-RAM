# Contract Negotiation

Perhaps the most critical capability, this allows two participants to agree on the specific terms (Policies) under which data will be shared and to **establish legally and technically meaningful agreements** governing data sharing.

This capability is defined by **DSP negotiation messages and state machines**, which formalize the lifecycle of a data sharing agreement through states such as request, offer, acceptance, agreement, verification, and finalization.

- Negotiation is **stateful and asynchronous**
- Both parties maintain a synchronized view of the contract state
- Contract messages reference policies, assets, and constraints expressed in machine-readable form

The result of contract negotiation is an agreement that can be **referenced by orchestration and observability mechanisms**, without embedding the contract logic into the data plane.

## Key architectural concepts

- **Automated Negotiation:** The **Dataspace Protocol: Contract Negotiation Protocol** manages a state machine (Request → Offer → Agreement) that leads to a legally and technically binding Agreement.
- **Policy Expression:** Uses the ODRL (Open Digital Rights Language) to define **Permissions** (what you can do), **Prohibitions** (what you cannot do), and **Duties** (obligations like payment or logging).
- **Agreement Verification:** Before data is transferred, the agreement is verified to ensure both parties are still in compliance with the negotiated terms.

## Further Resources

- **IDSA Rulebook Guidance**
  - [Data Sharing](https://kb.internationaldataspaces.org/external/rulebook/110_Data_sharing)
  - [Planes](https://kb.internationaldataspaces.org/external/rulebook/010_Planes)
  - [Policies: Contract Policies](https://kb.internationaldataspaces.org/external/rulebook/105_Policies#contract-policies)

- **Focus Papers**
  - [IDSA Position Paper: Semantic Interoperability in Data Spaces](https://internationaldataspaces.org/download/52879/?tmstv=1772198923)
    - Particularly relevant: Section 3.4, *Open Digital Rights Language (ODRL)*, for the definition of usage terms for the contract

- **Specifications**
  - [Dataspace Protocol: Contract Negotiation Protocol Specification](https://eclipse-dataspace-protocol-base.github.io/DataspaceProtocol/2025-1-err2/#negotiation-protocol)
  - [ODRL Information Model](https://www.w3.org/TR/odrl-model/)  
  - [ODRL Vocabulary & Expression](http://www.w3.org/TR/vocab-odrl/)
