# OmniPack: Unified Token Compression for Efficient Omni-modal Large Language Models

**Category:** Frontier Research & Papers
**Date:** August 2026

## TL;DR
Omni-modal large language models process huge sequences of audio and visual tokens, causing major computational bottlenecks. **OmniPack** is a training-free framework that elegantly solves this by coordinating two phases of compression: *structural compression* (removing modality-specific redundancy and merging similar tokens) before the LLM, and *semantic refinement* (consolidating representations via textual guidance) inside the LLM. It outperforms existing methods, preserving 98.0% of the original performance on Qwen2.5-Omni-7B while slashing FLOPs to just 16.7%.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
If you are developing cutting-edge omni-modal applications where token limits are constantly maxed out by video and audio streams, implementing OmniPack's dual-phase approach allows you to pack significantly more contextual multimodal data into a single context window without discarding structurally important global evidence early in the pipeline.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
This is highly impactful for reducing inference costs. By applying OmniPack's training-free token compression, you can retain up to 92.9% of omni-modal model performance while using only 6.8% of the original FLOPs. This translates directly to massive latency improvements and lower compute overhead for high-volume audio-visual API processing, similar to the goals of general [Quantization](../concepts/quantization.md).

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
This technique does not apply to prompt engineers using web UI chat boxes, as token compression algorithms run under the hood in the model serving infrastructure.

## References
* [OmniPack: Unified Token Compression for Efficient Omni-modal Large Language Models](https://arxiv.org/abs/2608.03812)
