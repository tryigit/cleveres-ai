# DeepLoop: Depth Scaling for Looped Transformers

**TL;DR**
Looped Transformers reuse a compact stack of physical blocks for multiple rounds of computation, increasing functional depth without requiring more memory for parameters. However, this parameter reuse alters residual branch scaling. DeepLoop introduces a modified Post-LN DeepNorm initialization tailored specifically for tied-depth architectures, dynamically increasing residual scaling exponents to maintain stability as loop counts increase.

## Rethinking Residual Scaling for Parameter Reuse

A standard, untied [Transformer architecture](../concepts/transformer-architecture.md) receives a unique parameter update at each residual branch. In contrast, a Looped Transformer revisits the same physical parameters multiple times during a linearized forward pass.

This means that a single, shared parameter update aggregates gradients from every visit, and is then read back by those same layers in subsequent iterations. Standard residual scaling methods (like conventional DeepNorm) do not account for this "tied-depth effect," leading to instabilities when recurrent depth significantly outpaces physical depth.

## The DeepLoop Solution

DeepLoop addresses this by formalizing the tied-depth effect through a first-order perturbation bound, managed by a visit-alignment coefficient (κ_R). The authors found that when parameter visits are highly aligned, the residual scaling exponent must increase from 1/4 (standard DeepNorm) to 1/2 as the loop count grows.

Retaining the Post-LN DeepNorm architecture, DeepLoop adjusts the initialization coefficients for an unrolled depth $N$:
*   $\alpha = (2N)^{1/2}$
*   $\beta = (8N)^{-1/2}$

When applied to GPT-style language models, DeepLoop acts neutrally when operating strictly as an untied model. However, once recurrent depth is activated (blocks are revisited), it significantly improves validation loss and downstream accuracy, demonstrating that stable recurrent depth relies on scaling rules that understand parameter visits rather than just nominal layer counts.

## Real-World Application & Who Should Care

*   🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):** If you are pushing model boundaries with recurrent structures like Looped Transformers, DeepLoop provides the mathematical foundation to prevent unstable training dynamics, unlocking higher effective reasoning depth on fixed parameter budgets.
*   💰 **THE COST & LATENCY OPTIMIZERS (API Developers):** Looped architectures are inherently cost-effective for deployment because they require less VRAM to store parameters. DeepLoop ensures that these parameter-efficient models actually train stably and perform reliably in production without exploding gradients.
*   👨‍💻 **THE EVERYDAY PROMPT ENGINEERS:** While you won't tune DeepNorm hyperparameters during prompting, this architecture enables the development of models that can dynamically "think longer" (by looping more times) without inflating the size of the model weights on your local machine or cloud provider.

## References
* [DeepLoop: Depth Scaling for Looped Transformers](https://arxiv.org/abs/2607.13491)

See also: [SMELT: Scaling Laws for Compute-Matched MoE Looped Transformers](smelt-looped-transformers.md)
