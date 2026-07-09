# Is One Layer Enough? Training A Single Transformer Layer Can Match Full-Parameter RL Training

## TL;DR
Reinforcement learning (RL) has become a central component of post-training large language models (LLMs), but how RL adaptation is distributed across transformer layers is poorly understood. This paper challenges the assumption that every layer contributes similarly to the gains obtained during RL post-training. Surprisingly, training a single transformer layer can recover most of the gains achieved by full-parameter RL training, and in some cases even surpass it. RL gains are highly concentrated in a small subset of transformer layers, specifically the ones in the middle of the transformer stack.

## Real-World Application & Who Should Care

* 🚀 **The Performance Monsters (SOTA Seekers):** This insight is crucial for optimizing the RL post-training process. By focusing RL adaptation on the middle layers, researchers can achieve similar or better performance with significantly less compute and memory overhead.
* 💰 **The Cost & Latency Optimizers (API Developers):** Training a single layer instead of full-parameter tuning drastically reduces training costs. API developers can leverage this finding to fine-tune models on custom datasets more efficiently and economically.
* 💻 **The Everyday Prompt Engineers:** While this is primarily a training optimization, it highlights the inner workings of LLMs during RLHF/GRPO. End-users might not directly apply this, but they benefit from the resulting smaller, cheaper, and faster models that maintain high performance.

See also: [Transformer Architecture: The Engine of Modern AI](../concepts/transformer-architecture.md), [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md)

## References
* [Is One Layer Enough? Training A Single Transformer Layer Can Match Full-Parameter RL Training](https://arxiv.org/abs/2607.01232)
