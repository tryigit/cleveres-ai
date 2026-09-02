# SMELT: Scaling Laws for Compute-Matched MoE Looped Transformers

**TL;DR**
SMELT (Sparse MoE Transformer, middle layers Loop Twice) optimizes Mixture-of-Experts (MoE) architectures by repeating the middle layers of the network during a forward pass. By closely matching per-token FLOPs, total non-embedding parameters, and KV cache against an unlooped baseline, this technique demonstrates measurable training efficiency gains, saving 6.8 to 18.0% of training FLOPs on the compute-optimal frontier. Mechanistically, looping shifts attention away from 'attention sinks' towards more content-relevant tokens, improving performance on downstream tasks like Code generation.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
Model builders scaling to tens of billions of parameters can use SMELT's looping recipe to squeeze higher functional depth out of the same physical parameter count, directly lowering the compute required to hit optimal loss frontiers.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
Compared with a deeper, equally wide unlooped model, looping can reuse the same layers. However, SMELT's compute-matched baseline closely matches total non-embedding parameters, so this comparison does not establish a smaller stored-weight footprint or a general deployment benefit.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
This architectural improvement happens invisibly during model training, meaning everyday prompt engineers will simply experience smarter models, particularly for complex reasoning and long-context coding tasks, without needing to change their workflow.

## Rethinking Iterative Computation

Unlike previous evaluations that conflated architectural advantages with additional compute, SMELT closely matches training budgets. By looping the middle half of the layers exactly twice, the model's validation loss drops faster with compute. The second visit to these layers reduces the attention sink phenomenon, effectively redirecting the model's focus to more critical tokens.

## References
*   [arXiv:2609.01343](https://arxiv.org/abs/2609.01343)
*   See also: [Transformer Architecture: The Engine of Modern AI](../concepts/transformer-architecture.md)
*   See also: [Mixture of Experts (MoE): Scaling Intelligence Efficiently](../concepts/mixture-of-experts.md)
*   See also: [DeepLoop: Depth Scaling for Looped Transformers](deeploop-depth-scaling-looped-transformers.md)
