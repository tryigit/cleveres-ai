# Beyond Retrieval: Progressive Latent Memory Evolution for Streaming Video Understanding

## TL;DR
Streaming video understanding requires Multimodal Large Language Models (MLLMs) to process continuous visual inputs and respond to queries with bounded memory and strict causality. Existing methods usually compress history into an external memory bank and retrieve evidence as additional visual context (store-and-retrieve). However, this keeps historical evidence external, preventing it from being internalized into a compact, evolving latent memory.

**LatentStream** bridges this gap by shifting the paradigm from store-and-retrieve to retrieve-and-internalize. It features a progressive latent working memory framework composed of three parts:
1. **Query-agnostic Hierarchical Streaming Memory:** Organizes visual history into short-, mid-, and long-term levels under a fixed budget using Jenks-guided adaptive consolidation.
2. **Hierarchical Latent Memory Evolution:** Equips groups of latent tokens with expanding receptive fields to iteratively retrieve and internalize historical evidence into a compact, fixed-length latent memory when a query arrives.
3. **Progressive Confidence-guided Latent Memory Optimization:** Refines latent memory tokens and retrieved evidence using a hierarchical progression reward based on predictive entropy.

This allows LatentStream to achieve state-of-the-art results on online and offline video benchmarks by continuously guiding streaming reasoning.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For researchers pushing the limits of infinite-context or streaming video understanding, LatentStream provides a highly optimized architecture for maintaining deep temporal context without blowing up memory budgets. By internalizing retrieved context into a fixed-length latent space rather than just appending raw frames, models can reason over much longer video streams while preserving a fixed-length latent memory.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
Processing long videos frame-by-frame is incredibly token-heavy and expensive. LatentStream's retrieve-and-internalize mechanism maintains a fixed memory budget while still capturing long-term temporal context. In the reported Qwen2.5-VL-7B evaluation, it reduced peak memory and per-token latency, but the latent memory evolution performed before answer generation increased time to first token from 7.63 to 8.41 seconds.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
While you can't manually implement latent memory evolution, this breakthrough means that future AI assistants capable of "watching" your screen or analyzing a 3-hour movie won't suddenly "forget" what happened in the first 10 minutes. You will experience much more coherent and context-aware responses when interacting with continuous, long-form video content.

## References
* [arXiv: 2609.04131](https://arxiv.org/abs/2609.04131)

See also: [VideoMLA: Low-Rank Latent KV Cache for Minute-Scale Autoregressive Video Diffusion](video-mla.md)
