# Flash-BoN: Instant Drafts for Inference-Time Scaling in Diffusion Models

## TL;DR
Flash-BoN introduces a novel approach for efficient [Inference-Time Compute: The New Scaling Law (System 2 Thinking)](../concepts/inference-time-compute.md) in text-to-image diffusion models. Instead of relying solely on repeated intermediate verification during the denoising process, Flash-BoN generates a large pool of inexpensive draft candidates by combining three complementary acceleration knobs: timestep truncation, layer skipping, and activation proxies. These are merged into a single configuration optimized once per model. An efficient multi-stage verification procedure then identifies the most promising draft, which is subsequently refined at full quality. Under fixed wall-clock budgets, Flash-BoN consistently outperforms existing baselines and improves orthogonal techniques like reflection-based prompt optimization.

## Real-World Application & Who Should Care

*   🚀 **The Performance Monsters (SOTA Seekers):** Researchers aiming for the absolute highest quality in text-to-image generation can use Flash-BoN to significantly improve their results under a fixed computational budget. The method combines well with existing prompt optimization techniques, yielding substantial gains (e.g., +16% AUC in their experiments) by expanding the diversity of candidate drafts explored.
*   💰 **The Cost & Latency Optimizers (API Developers):** Engineers running high-volume image generation services can leverage Flash-BoN to maximize the quality-to-cost ratio. By using cheap drafts and multi-stage verification, Flash-BoN ensures compute is spent efficiently on generating broad explorations rather than expensive step-by-step verification, offering better wall-clock efficiency for a given generation quality target.
*   🧑‍💻 **The Everyday Prompt Engineers:** While this is a backend architectural technique, users of AI image generators powered by Flash-BoN will experience faster generation times for high-quality, complex prompts, as the system can efficiently explore many variations of a prompt behind the scenes without excessive wait times.

## References
* [Flash-BoN: Instant Drafts for Inference-Time Scaling in Diffusion Models](https://arxiv.org/abs/2607.04461)
