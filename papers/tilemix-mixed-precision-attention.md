# TileMix: Tile-Centric Mixed-Precision Attention for LLM Inference Acceleration

## TL;DR
Long-context prefill in Large Language Models (LLMs) suffers from massive computation and memory bottlenecks because dense self-attention computes quadratic query-key scores. Existing solutions either force the entire attention matrix into uniform low-precision (hurting model quality) or rely on sparse selection of tokens (which can miss important context). **TileMix** introduces a novel kernel that treats numerical precision as a spatial, executable decision. It partitions the attention matrix into hardware-aligned score tiles and dynamically dispatches each tile to either FP16 or INT8 precision. This allows LLMs to retain dense connectivity and long-context quality while reaping the inference speedups and memory reductions of INT8 execution where it is safe to do so.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For researchers pushing the absolute limits of context windows, TileMix offers a way to maintain the reasoning capability and quality of dense attention in long contexts, recovering the exact performance lost when using naive, uniform INT8 quantization, without introducing the structural complexities of sparse attention.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
This is highly relevant for scaling inference infrastructure. Because TileMix uses a shared online-softmax state and dynamic hardware-aligned precision routing, you get the throughput benefits of mixed precision (FP16 and INT8) during long-context prefill natively on A100s. It drops easily into your existing stack since it supports grouped-query attention, continuous/variable-length batching, and INT8 KV caches—directly driving down your latency per token without needing complex re-training.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
While you will not interact with TileMix directly via a prompt, this technique enables API providers to process your massive context prompts (like dropping in a 100-page document) much faster. It ensures that when you feed huge walls of text to an LLM, it doesn't arbitrarily ignore critical sentences (which can happen with sparse token selection) or hallucinate due to aggressive quantization.

## How TileMix Works
Rather than applying a one-size-fits-all [Quantization: Shrinking Models for the Real World](../concepts/quantization.md) method across the entire attention computation, TileMix operates at the "tile" level (a small block of queries and keys that fit neatly into the GPU's memory architecture, similar to the foundational ideas behind [FlashAttention: IO-Aware Exact Attention](../concepts/flash-attention.md)).

1. **Hardware-Aligned Partitioning:** TileMix chops the massive quadratic attention matrix into smaller score tiles.
2. **Precision Routing Kernel:** It introduces a bitmask-based decision layer. Some token interactions are highly sensitive and require FP16 precision, while others are robust enough to be computed in INT8.
3. **Unified Updates:** Whether a tile is computed in FP16 or INT8, TileMix routes both streams into a shared online-softmax state. This ensures mathematical correctness and stable gradients/activations without tearing the attention calculation apart.
4. **No Re-Training Required:** Because it dynamically routes standard dense attention tokens based on metadata compact enough to scale to long contexts, it preserves dense connectivity out of the box and requires zero retraining or finetuning of the base model.

By making precision a localized spatial decision rather than a global model state, TileMix establishes a new frontier where we can precisely balance accuracy and efficiency during the computationally intensive prefill phase.

## References
* [arXiv:2608.17336 - TileMix: Tile-Centric Mixed-Precision Attention for LLM Inference Acceleration](https://arxiv.org/abs/2608.17336)
* [GitHub Repository: HanzhiZhang-Ulrica/TileMix](https://github.com/HanzhiZhang-Ulrica/TileMix)
