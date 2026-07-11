# Linear Attention Architectures: Mechanisms, Trade-offs, and Cross-Layer Routing

## TL;DR
Self-attention enables tokens to retrieve information from the full context, but its quadratic sequence length cost restricts long-context training and inference. To address this, a comparative study evaluates four recent recurrent linear-attention architectures: DeltaNet, Gated DeltaNet, Kimi Delta Attention, and Gated DeltaNet-2, expressing them in a common recurrent-memory notation. Experimental results on 350M-parameter models trained for 15B tokens show that Kimi Delta Attention with Muon achieves the lowest validation loss, while a pure Gated DeltaNet stack trained with AdamW yields the highest training throughput. Additionally, the study introduces Cross-Layer Value Routing (CLVR) - a lightweight mechanism that routes into the aligned hidden stream and forwards the write value - which modestly improves final validation loss for DeltaNet-style memories.

## Real-World Application & Who Should Care

*   🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
    Researchers designing custom model architectures for infinite-context applications should examine these trade-offs. The introduction of Cross-Layer Value Routing (CLVR) and the observed performance of Kimi Delta Attention combined with Muon provide actionable pathways to lower validation loss in recurrent linear-attention models without returning to standard quadratic attention.

*   💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
    For API providers and framework engineers, the finding that a pure Gated DeltaNet stack trained with AdamW maximizes normalized training throughput is critical. Adopting these linear-attention architectures can drastically reduce the memory overhead and computational cost associated with the KV cache at inference time, enabling significantly cheaper scaling for large-context workloads.

*   💻 **THE EVERYDAY PROMPT ENGINEERS:**
    This topic focuses purely on the underlying architectural optimization during the initial training of the neural network. It does not affect prompt engineering or standard API usage directly, as you interact with the final compiled model.

## References
* [Linear Attention Architectures: Mechanisms, Trade-offs, and Cross-Layer Routing](https://arxiv.org/abs/2607.07953)

See also: [Gated DeltaNet-2: Decoupling Erase and Write in Linear Attention](gated-deltanet-2.md)
See also: [Why Muon Outperforms Adam: A Curvature Perspective](why-muon-outperforms-adam.md)
