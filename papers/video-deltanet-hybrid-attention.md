# Video DeltaNet: A Video-Native Hybrid Attention for Livestream Video Generation

**Category:** Frontier Research & Papers
**Date:** September 2026

## TL;DR
Video diffusion models require repeatedly processing long spatiotemporal token sequences during denoising, making standard global Softmax attention a massive computational bottleneck. While linear attention is popular in text LLMs, directly applying it to video often degrades the fine-grained visual details necessary for high-quality generation. **Video DeltaNet (VDN)** solves this by introducing a hybrid architecture. It replaces the global Softmax mechanism with a combination of local Softmax attention and a bidirectional linear memory called Video Delta Attention (VDA). VDA updates its memory only once per frame by jointly incorporating spatial tokens. When applied to the MiniMax H3 architecture, this hybrid model (VDN-H3) completes DiT denoising for a 14.3-second, 768p video in just 6.70 seconds on 8 NVIDIA B200 GPUs-a massive 14.5x speedup over a dense H3 baseline, while largely preserving Dense H3 quality.

---

## Real-World Application & Who Should Care

### (Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
**Why you care:** Pushing video generation to longer durations and higher resolutions is severely constrained by quadratic attention complexity. By separating local fine-grained spatial interactions (handled by Softmax) from long-range temporal context (handled by bidirectional linear memory), VDN allows you to scale sequence lengths dramatically without the massive compute overhead of dense attention blocks.
**Action:** Adopt hybrid architectures for spatiotemporal modeling. Use localized Softmax for intra-frame quality and linear RNNs/attention for inter-frame temporal consistency.

### (Money) THE COST & LATENCY OPTIMIZERS (API Developers):
**Why you care:** A 14.5x speedup in the denoising loop fundamentally changes the unit economics of video generation APIs. This allows for near real-time (livestream) generation capabilities on modern hardware, drastically lowering the GPU-seconds required per user request.
**Action:** Evaluate migrating your production Video DiT pipelines to hybrid linear-attention architectures like Video DeltaNet. The speedups obtained from optimizing the long-sequence processing step will directly translate to higher throughput and lower compute costs.

### (Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
**Not Immediately Applicable:** This is an underlying architectural change for video generation models. It does not change how you currently write prompts or interact with existing tools, though it will power faster tools in the future.

---

## References
*   [Video DeltaNet: A Video-Native Hybrid Attention for Livestream Video Generation](https://arxiv.org/abs/2609.20744)

See also: [SANA-Video 2.0: Hybrid Linear Attention with Attention Residuals](sana-video-2-hybrid-linear-attention.md)
