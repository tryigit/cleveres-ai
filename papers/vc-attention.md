# VC-Attention: Value Smoothing and Softmax Casting for Low-bit Attention

## TL;DR
Diffusion Transformers (DiTs) have set a new standard for video generation, but the deployment cost is heavily dominated by their long spatiotemporal sequences and attention mechanisms. Existing low-bit kernel quantization techniques often stumble due to value outliers, and the high-precision exponential operations in softmax become a primary bottleneck on modern GPUs. **VC-Attention** is a training-free, low-bit attention framework that solves both issues. It introduces **V-Smooth**, which uses online clustering to group value tokens so they quantize harmoniously, and **ExpCast-FP8**, which fuses operations to map log-domain scores directly to E4M3 probabilities. This approach yields significant end-to-end generation speedups for DiT models (up to 1.7x faster) without sacrificing output fidelity.

## Methodology

VC-Attention tackles the two main limiters of low-bit attention speed and accuracy:
1. **Value Smoothing (V-Smooth):** Value outliers typically follow no fixed structure, making them the primary source of error when quantizing outputs. V-Smooth resolves this by reordering value tokens using a lightweight, online clustering method, ensuring that tokens grouped within the same hardware block have similar scales. It quantizes only the residual values after subtracting the block mean, restoring the mean from the row sum inherently maintained by the online softmax.
2. **Softmax Casting (ExpCast-FP8):** The high-precision exponential calculation situated between the two matrix multiplications of attention constitutes the longest pipeline stage on datacenter GPUs when using low-bit Tensor Cores. ExpCast-FP8 bypasses this delay by mapping log-domain scores directly into E4M3 probability codes via a single fused multiply-add operation, thus eliminating the FP32 exponential and subsequent format conversion bottlenecks.

Across models like Wan2.2 and HunyuanVideo-1.5, this method results in a 1.46-1.59x attention kernel speedup on Blackwell/Hopper architectures and a 2.3-3.6x speedup on workstation GPUs, improving overall generation times significantly.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
This is highly relevant for researchers focusing on state-of-the-art video generation and optimizing Diffusion Transformers. VC-Attention provides a pathway to deploy top-tier video models on advanced hardware with significantly faster iteration and generation times, maximizing compute utility.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
A critical breakthrough for platforms hosting video generation APIs. By eliminating high-precision softmax bottlenecks and deploying a training-free low-bit framework, you can drastically reduce the latency of generating high-resolution, long-duration video clips and increase GPU throughput, directly lowering operational costs.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
Not immediately applicable to daily prompt engineering tasks. However, as API providers integrate these optimizations, you can expect much faster turnaround times when prompting heavy video models (like Wan2.2 or HunyuanVideo) in web interfaces, improving your workflow efficiency.

## See Also
* [SimSD: Simple Speculative Decoding in Diffusion Language Models](simsd-speculative-decoding-diffusion.md)

## References
* [VC-Attention: Value Smoothing and Softmax Casting for Low-bit Attention](https://arxiv.org/abs/2609.15810)
