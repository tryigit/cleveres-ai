# Spectral Rewiring for Exploration, Purification, and Model Merging

## TL;DR
While reinforcement learning is the standard post-training recipe for LLMs, dense full-parameter updates often lead to suppressed reasoning performance and cross-domain interference when consolidating multiple capabilities. Subspace-Aligned Rewiring (SAR) is a post-hoc editing method that addresses this by extracting the "reasoning-effective" components of these updates, which are largely concentrated in the base model's spectral space. By retaining this spectral core and filtering out orthogonal components (using as little as ~0.58% of total parameters), SAR acts as a training-free mechanism to preserve reasoning gains, improve mathematical exploration, and purify mixed-domain updates. Furthermore, it enables superior model merging across experts that surpasses previous baselines.

## Core Mechanisms
1. **Spectral Space Extraction:** SAR identifies that the most critical parameter updates for reasoning reside within the model's spectral space, rather than being uniformly distributed across all dense parameters.
2. **Subspace-Aligned Rewiring (SAR):** By filtering the weight updates and keeping only this spectral core, SAR removes the residual directions that typically cause premature reasoning saturation or domain interference during multi-domain training.
3. **Training-Free Purification and Merging:** The technique operates post-hoc. It can "purify" a model trained on mixed domains by releasing suppressed capabilities (like coding) while maintaining math reasoning, and it can merge different expert models more effectively than standard weight-averaging techniques.

## Real-World Application & Who Should Care

*   **(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):** Model researchers and builders who are fine-tuning or running RL on base models can use SAR to merge multiple domain-specific experts (e.g., a math expert and a coding expert) without the catastrophic interference that usually degrades the capabilities of both.
*   **(Money) THE COST & LATENCY OPTIMIZERS (API Developers):** Because SAR is a post-hoc editing method that uses a tiny fraction of total parameters to extract reasoning cores, it offers a computationally inexpensive, training-free way to optimize model performance and combine capabilities without expensive retraining cycles.
*   **(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:** This research means future open-weight models downloaded for local use will likely be "smarter" generalists, maintaining high performance across diverse tasks like coding, math, and general instruction following simultaneously, without one capability cannibalizing the others.

See also: [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md)

## References
* [Spectral Rewiring for Exploration, Purification, and Model Merging](https://arxiv.org/abs/2607.03065)
