# Cataloging
 
Cataloging describes the architectural capability to **advertise data assets and data services** in a dataspace without exposing the data itself.
 
From a protocol perspective, cataloging is realized through **DSP catalog messages**, which allow participants to publish **machine-readable metadata** describing datasets, services, and associated usage policies. These catalogs form the basis for discovery and negotiation.  
 
Cataloging:
 
- Is **metadata-only** and policy-filtered
- Does not imply authorization or data access
- Enables automated reasoning by downstream contract-negotiation state machines

Bindings (e.g. HTTP-based bindings) allow these catalog messages to be transported independently of the underlying data systems, preserving interoperability across implementations.
 
## Key architectural concepts
- **Dataset Advertising:** Realized through the **Catalog Protocol**. Providers publish a Catalog containing Datasets, Offers, and Services.
- **Standardized Metadata:** Uses the DCAT (Data Catalog Vocabulary) and JSON-LD for semantic interoperability.
- **Discovery:** Consumers can request a full catalog or specific dataset metadata via standardized HTTPS endpoints (e.g., /catalog/request).

 
As explained in the [IDSA Rulebook](https://kb.internationaldataspaces.org/external/rulebook/120_DataDiscoveryServices/), this capability can be implemented as a managed service by one or more selected participants, hosted by the data space governance authority, or operated in a fully decentralized fashion by every participant that offers data contracts (see the visual representation of various implementation designs of the DSGA above). The type of catalog architecture used depends on the design of the data space as well as the needs and capabilities of the participants.
 
## Further resources
- **IDSA Rulebook Guidance:**
  - [Cataloging (Data Discovery Services)](https://kb.internationaldataspaces.org/external/rulebook/120_DataDiscoveryServices/)
 
- **Technical specifications:**
  - [Dataspace Protocol: Catalog Protocol](https://eclipse-dataspace-protocol-base.github.io/DataspaceProtocol/2025-1-err2/#catalog-protocol)
  - [Data Catalog Vocabulary (DCAT)](https://www.w3.org/TR/vocab-dcat-3/)
 
- **Related Focus Papers:**
  - [IDSA Position Paper on Semantic Interoperability](https://internationaldataspaces.org/download/52879/?tmstv=1772198923)
  - Particularly the following sections in the paper provide further details relevant for cataloging:
     - 3.2 Abilities of the Dataspace Protocol
     - 3.3 Data Catalog Vocabulary (DCAT) - Version 3
     - 3.4 Open Digital Rights Language (ODRL)
   
- **IDS-RAM Architectural Patterns:**
  - [Catalog Patterns](../Pattern/Catalogs.md)
