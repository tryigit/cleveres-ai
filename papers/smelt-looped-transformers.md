# SMELT: Scaling Laws for Compute-Matched MoE Looped Transformers

**TL;DR**
SMELT (Sparse MoE Transformer, middle layers Loop Twice) optimizes Mixture-of-Experts (MoE) architectures by repeating the middle layers of the network during a forward pass. By strictly matching per-token FLOPs, parameter count, and KV cache against an unlooped baseline, this technique demonstrates measurable training efficiency gains, saving 6.8 to 18.0% of training FLOPs. Mechanistically, looping shifts attention away from 'attention sinks' towards more content-relevant tokens, improving performance on downstream tasks like Code generation.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
Model builders scaling to tens of billions of parameters can use SMELT's looping recipe to squeeze higher functional depth out of the same physical parameter count, directly lowering the compute required to hit optimal loss frontiers.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
While looping does not strictly lower inference FLOPs (since it matches the budget of a deeper baseline), it reduces the memory footprint for model weights by reusing the same layers. This is highly beneficial for deploying large MoE models on memory-constrained GPUs.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
This architectural improvement happens invisibly during model training, meaning everyday prompt engineers will simply experience smarter models, particularly for complex reasoning and long-context coding tasks, without needing to change their workflow.

## Rethinking Iterative Computation

Unlike previous evaluations that conflated architectural advantages with additional compute, SMELT strictly matches training budgets. By looping the middle half of the layers exactly twice, the model achieves better test loss drops with scale. The second visit to these layers reduces the attention sink phenomenon, effectively redirecting the model's focus to more critical tokens.

## References
*   [arXiv:2609.01343](https://arxiv.org/abs/2609.01343)
*   See also: [Transformer Architecture: The Engine of Modern AI](../concepts/transformer-architecture.md)
*   See also: [Mixture of Experts (MoE): Scaling Intelligence Efficiently](../concepts/mixture-of-experts.md)
*   See also: [DeepLoop: Depth Scaling for Looped Transformers](deeploop-depth-scaling-looped-transformers.md)