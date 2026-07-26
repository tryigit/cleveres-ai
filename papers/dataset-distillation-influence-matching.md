# Dataset Distillation by Influence Matching

## TL;DR
Influence Matching (Inf-Match) is a novel dataset distillation method that shifts the focus from imitating the training process (like per-step gradients) to aligning the final training outcome. It learns a compact synthetic dataset whose effect on converged model parameters matches that of the full dataset. This is achieved using a fully differentiable, sample-level influence estimator, improving upon standard [Distilled Reinforcement Learning for LLM Post-training](distilled-reinforcement-learning.md) techniques.

## Real-World Application & Who Should Care

*   **(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):** Researchers aiming for extreme data efficiency and high accuracy on downstream tasks can use Inf-Match to create highly optimized, miniature datasets that deliver superior performance on benchmarks like Tiny-ImageNet compared to process-matching baselines.
*   **(Money) THE COST & LATENCY OPTIMIZERS (API Developers):** Training models on massive datasets is expensive. By distilling a large dataset into a small, synthetic proxy set that yields the same converged model, API providers can drastically cut down on compute costs for continuous training or model updates.
*   **(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:** This does not directly impact everyday prompting. However, models trained via this technique may eventually be updated more frequently and cost-effectively, providing a slightly fresher and more performant experience behind the scenes.

## Overview
Traditional dataset distillation often relies on aligning process surrogates, such as training trajectories. Influence Matching (Inf-Match) takes an outcome-centric perspective. The core innovation is a fully differentiable, sample-level influence estimator that quantifies how adding or removing data shifts the parameters, running in linear time via unrolled optimization dynamics and first-order Taylor approximation.

By minimizing the mismatch between the influence of the synthetic set and the real dataset, Inf-Match ensures the synthetic data produces the same final model state as the original data. The method scales well across both classification and vision-language distillation tasks, offering a robust alternative to heuristic process imitation.

## References
* [Dataset Distillation by Influence Matching](https://arxiv.org/abs/2607.16859)
