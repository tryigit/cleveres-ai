# CONF-KV: Confidence-Aware KV Cache Eviction with Mixed-Precision Storage for Long-Horizon LLM

**Category:** Frontier Research & Papers
**Paper:** [CONF-KV: Confidence-Aware KV Cache Eviction with Mixed-Precision Storage for Long-Horizon LLM](https://arxiv.org/abs/2605.24786)
**Date:** May 2026

## TL;DR
CONF-KV is a dynamic KV-cache manager designed for long-horizon LLM inference. Instead of using static eviction windows or just historical attention, it uses the model's *current uncertainty* (derived from the next-token distribution) to determine the cache budget at each step. It retains more context when the model is uncertain and prunes aggressively when confident. Combined with mixed-precision (FP16/INT8) storage, CONF-KV achieves near-full-KV performance (95.3% success on VisualWebArena) at 2.8 times lower peak memory.

---

## The KV Cache Bottleneck
In long-horizon LLM inference, the KV cache becomes the dominant consumer of GPU memory, limiting batch sizes and causing latency spikes. Most existing eviction policies (like [StreamingLLM & Attention Sinks: Efficient Streaming Language Models](../concepts/streaming-llm.md) or standard H2O) rely on fixed recency windows or historical attention scores.

These methods ignore a crucial, readily available signal computed at every decoding step: the model's confidence in its next token.

## The CONF-KV Architecture
CONF-KV proposes that when a model is highly confident about the next word, it needs less historical context. When it is uncertain, it needs to scan deeper into its memory.

### 1. Confidence-Based Budgeting
CONF-KV converts the next-token probability distribution into a scalar confidence score. This score dynamically dictates the per-step KV cache budget.
*   **High Confidence:** Shrink the cache budget aggressively.
*   **Low Confidence (Uncertainty):** Expand the budget to retain more historical context.

### 2. Composite Ranking & Protected Windows
Within the dynamically chosen budget, tokens are ranked using a combination of accumulated attention mass and recency. Additionally, a small protected recent window is maintained to ensure local grammatical coherence.

### 3. Mixed-Precision Storage & Blockwise Attention
To further optimize memory, CONF-KV employs mixed FP16/INT8 storage for the cache and integrates blockwise online-softmax attention.

## Performance
Across generated lengths up to 4K tokens, CONF-KV maintains a memory footprint similar to a fixed 512-token sliding window. On the 32K token Needle-in-a-Haystack test, it achieves 91.4% retrieval accuracy, completely crushing standard sliding windows (53.8%) and outperforming H2O (80.6%).

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
For those deploying highly capable, long-context models locally where memory is tight, CONF-KV offers a way to maintain high retrieval accuracy (like 91.4% on Needle-in-a-Haystack) without the massive VRAM footprint of unpruned [PagedAttention: Eliminating KV Cache Waste](../concepts/paged-attention.md) setups.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
This is a game-changer for high-volume inference infrastructure. By dynamically reducing the KV cache footprint during confident generation phases and utilizing mixed-precision storage, you can significantly increase batch sizes and throughput on existing hardware, directly lowering the cost per token for long-horizon agentic workflows.

💻 **THE EVERYDAY PROMPT ENGINEERS:**
While implemented at the backend level, understanding CONF-KV helps explain why API responses for very long documents might occasionally speed up or slow down based on the complexity of the specific segment the model is currently generating.

---
**Sources:**
*   [CONF-KV: Confidence-Aware KV Cache Eviction with Mixed-Precision Storage for Long-Horizon LLM (arXiv:2605.24786)](https://arxiv.org/abs/2605.24786)
