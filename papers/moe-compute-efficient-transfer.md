# Let's Scale Step by Step: Compute-Efficient Hyperparameter Transfer for Large-Scale Mixture-of-Experts

## TL;DR
Optimizing hyperparameters like learning rates for massive Mixture-of-Experts (MoE) models by sweeping at scale is computationally prohibitive. This paper proposes a compute-efficient, two-step hyperparameter transfer framework. First, it uses Maximal Update Parameterization (µP) with [Multi-Head Latent Attention (MLA): Compressing the KV Cache](../concepts/multi-head-latent-attention.md) and the Muon optimizer ([Why Muon Outperforms Adam: A Curvature Perspective](why-muon-outperforms-adam.md)) to reliably transfer optimal learning rates across scaling model widths. Second, it extends this transferability to the training token dimension, establishing a predictive scaling law ($R^2=0.95$). This allows the optimal learning rate derived from a small proxy model trained on a limited budget to accurately predict the optimal learning rate for massive MoE models (e.g., 155B total, 17B active parameters) trained for trillions of tokens (e.g., 10T).

## Real-World Application & Who Should Care

**(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):**
For researchers building and pre-training large-scale [Mixture of Experts (MoE): Scaling Intelligence Efficiently](../concepts/mixture-of-experts.md) models, this framework provides a scientifically rigorous and compute-efficient way to find optimal hyperparameter configurations. It proves that scaling laws apply predictably to hyperparameter optimization, meaning small-scale proxy training can accurately set the course for massive, trillion-token pre-training runs without expensive large-scale trial and error.

**(Money) THE COST & LATENCY OPTIMIZERS (API Developers):**
This research specifically targets training efficiency, meaning it doesn't directly provide new tools for inference-time latency or cost reduction. However, by significantly reducing the compute overhead required for pre-training hyperparameter tuning, it lowers the barrier to entry for organizations wanting to train custom, highly capable MoE foundation models from scratch, which indirectly impacts API economics down the line.

**(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:**
This paper is highly technical, focusing entirely on the underlying math and systems engineering required to initialize and pre-train massive neural networks efficiently. It has no direct impact on how a user prompts or interacts with deployed models.

## References
* [Let's Scale Step by Step: Compute-Efficient Hyperparameter Transfer for Large-Scale Mixture-of-Experts](https://arxiv.org/abs/2608.20061)
