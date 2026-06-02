# From Layers to Submodules: Rethinking Granularity in Replacement-Based LLM Compression

## TL;DR
Current post-training replacement-based LLM compression techniques often assume redundancy exists in contiguous, full-layer blocks, deleting or replacing entire sequential layers. **SubFit** challenges this by compressing models at the *submodule* level. By selecting non-contiguous Attention and FeedForward submodules and outfitting them with lightweight fitted residual bypasses, SubFit achieves significantly better perplexity-accuracy trade-offs, particularly at high sparsity levels. At 25% sparsity, it retains 84.6% of dense downstream accuracy compared to 81.6% for previous baselines.

---

## The Flaw in Full-Layer Compression

When compressing large language models, a common strategy is to completely remove specific layers or replace them with simpler modules. Historically, these techniques adhere to two strict design constraints:
1. **Full-Layer Granularity:** They treat the entire transformer layer as a single unit to keep or discard.
2. **Contiguous Selection:** They assume redundancy clusters in specific, continuous depth ranges (e.g., removing layers 10 through 15).

However, research shows this is overly restrictive. Redundancy in pretrained [Transformer Architecture: The Engine of Modern AI](../concepts/transformer-architecture.md) networks is not evenly distributed between Attention and FeedForward outputs, nor is it confined to neat, contiguous blocks.

## The SubFit Methodology

SubFit (Submodule-level Fitted residual replacement) addresses these limitations by introducing a finer-grained compression strategy:

* **Submodule-Level Granularity:** Instead of dropping entire layers, SubFit independently targets specific Attention and FeedForward submodules.
* **Non-Contiguous Selection:** Removable components do not need to be clustered. SubFit can drop an Attention module from layer 4 and a FeedForward module from layer 12.
* **Lightweight Bypasses:** Each selected submodule is replaced with its own lightweight fitted residual bypass, requiring only calibration data post-training.

By strategically targeting redundancy wherever it exists rather than forcing contiguous layer drops, SubFit vastly outperforms traditional methods, retaining much higher downstream accuracy and significantly lowering perplexity degradation (2.42x vs 4.34x for baselines at 25% sparsity) while delivering measurable inference speedups and KV-cache savings.

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
**Maximizing the Accuracy-Compute Pareto Curve.** If you are pushing models to the edge of consumer hardware limitations and exploring aggressive [Quantization: Shrinking Models for the Real World](../concepts/quantization.md), SubFit offers a new avenue. It allows you to aggressively prune models (up to 37.5% sparsity) while preserving substantially more reasoning capability and accuracy than standard layer-dropping techniques, enabling smarter models on tighter VRAM constraints.

### 💰 For The Cost & Latency Optimizers (API Developers)
**Smarter, Faster Serving.** SubFit delivers measurable inference speedups and KV-cache savings without the sharp performance drop-offs seen in traditional pruning. Deploying SubFit-compressed models reduces the per-request compute footprint, allowing for higher batch sizes and lower latency when serving thousands of concurrent users.

### 💻 For The Everyday Prompt Engineers
**Not Immediately Applicable.** This is an architectural post-training compression technique executed by developers prior to deployment. It does not alter how you interact with the model via prompts, though it contributes to the broader ecosystem trend of making advanced AI available on consumer devices and reducing latency.

---

## References
* [From Layers to Submodules: Rethinking Granularity in Replacement-Based LLM Compression](https://arxiv.org/abs/2606.02559)
