# Data Transfer (Transfer Process)

Data Transfer orchestrates the **actual exchange or access of data** between dataspace participants once a contract has been established.

This capability does **not** define how data is transferred; instead, it defines **transfer process messages** that coordinate *when* and *under which agreement* data transfer may occur.

- Data transfer is **peer-to-peer** between participants
- Multiple transfer modalities are possible (files, APIs, streams, confidential compute)
- Transfer protocols are selected and bound outside DSP

This design decouples governance and interoperability (control plane) from performance- and domain-specific data exchange (data plane).

## Key architectural concepts

- **Transfer State Machine:** The **Dataspace Protocol: Transfer Process Protocol** governs the lifecycle of a data transfer (Requested → Started → Completed/Terminated).
- **Separation of Concerns:** It distinguishes between the *Control Plane* (which handles the signaling and "paperwork") and the *Data Plane* (the actual technical "pipe" like HTTP, MQTT, or S3).
- **Transfer Signaling:** The **Dataplane Signaling** specification defines how the Control Plane instructs the Data Plane to open, monitor, or close a transfer channel based on an active Agreement.

## Control Plane

**Control plane part of the Data Transfer** is responsible for **governing and coordinating data sharing**, but not for handling the data itself.

Architecturally, this capability encompasses:

- Transfer process coordination
- Policy evaluation and claims verification

It is realized by the **Control plane** part of the **Transfer process** protocol of the **DSP.** Together with **DCP**, defining the messages, states, and sequences required to reach authorized transfer initiation.

## Data Plane

The Data Plane is responsible for the **execution of data transfer and data use**, in accordance with the agreements established by the control plane.

Architecturally:

- The data plane is **outside the scope of the Dataspace Protocol and IDS-RAM**
- It is implemented by participant-controlled data services
- It may include data management systems, APIs, compute environments, or streaming infrastructures

The separation between control plane and data plane allows dataspaces to support **heterogeneous technologies and business models**, while preserving a common governance and interoperability layer.

## Policy Enforcement

Policy Enforcement describes how **usage policies and contractual obligations** are applied across dataspace interactions.

From an architectural perspective, policy enforcement is a **shared responsibility**:

- The dataspace control plane evaluates policies during discovery, negotiation, and orchestration
- Data management services enforce policies during actual data access and use

Policies are expressed in machine-readable form and referenced by DSP messages, but enforcement may occur both **technically** (e.g. access control, usage restrictions) and **organizationally** (e.g. contractual compliance).

This division ensures that dataspaces can scale without assuming control over participant infrastructure.

## Further Resources

- **IDSA Rulebook Guidance**
  - [Data Sharing](https://kb.internationaldataspaces.org/external/rulebook/110_Data_sharing)
  - [Planes](https://kb.internationaldataspaces.org/external/rulebook/010_Planes)
  - [Policies](https://kb.internationaldataspaces.org/external/rulebook/105_Policies)

- **Specifications**
  - [Dataspace Protocol: Transfer Process Protocol](https://eclipse-dataspace-protocol-base.github.io/DataspaceProtocol/2025-1-err1/#transfer-protocol)
