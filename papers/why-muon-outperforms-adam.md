# Why Muon Outperforms Adam: A Curvature Perspective

**TL;DR:** While Adam has long been the standard optimizer for training deep learning models, Muon has been shown to improve large language-model training efficiency by approximately 2x. This paper demonstrates that Muon achieves this by consistently incurring a smaller second-order curvature penalty (specifically through lower Normalized Directional Sharpness) compared to Adam, resulting in larger single-step loss decreases.

## The Curvature Advantage of Muon over Adam

The shift from standard SGD (Stochastic Gradient Descent) to Adam revolutionized deep learning by introducing adaptive learning rates based on first and second moments. However, as language models scale up, newer optimizers like Muon have demonstrated significant improvements, often halving the training time.

By applying a second-order Taylor approximation to the training landscape, researchers discovered that while Muon and Adam have comparable first-order gains (meaning they move in a generally good direction with similar initial force) and similar update norms (meaning they take similarly sized steps), **Muon consistently incurs a smaller second-order curvature penalty.**

### Lower Normalized Directional Sharpness (NDS)

This smaller penalty is driven primarily by Muon maintaining a lower **Normalized Directional Sharpness (NDS)**. In the middle and late stages of training, Muon achieves this lower NDS mostly through smaller within-layer curvature. Essentially, Muon balances update energy across different curvature groups more effectively than Adam.

When the curvature of the training landscape is highly heterogeneous (which is typical when training large, complex models on imbalanced data, like Zipf-Probabilistic Context-Free Grammar data), Muon aligns its gradients toward high-curvature modes more intelligently. This yields a lower local quadratic loss after the exact same number of training steps.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
If you are pre-training large foundational models or running massive, multi-epoch fine-tuning jobs on highly heterogeneous or imbalanced datasets, switching your optimizer from Adam/AdamW to Muon could result in faster convergence and lower final loss. Understanding that Muon handles highly variable loss landscapes better means you can push learning rates and data diversity further.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
For teams that are constantly pre-training models from scratch or engaging in continuous post-training RL updates, training time directly equals cloud compute cost. Using an optimizer that can yield a 2x efficiency gain means your GPU cluster rental costs are halved for the same final model capability.

### 💻 THE EVERYDAY PROMPT ENGINEERS
This topic focuses purely on the underlying mathematical optimization during the initial training of the neural network. It does not affect prompt engineering or API usage directly.

***
**Sources:**
* Why Muon Outperforms Adam: A Curvature Perspective (arXiv:2606.04662)

See also: [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md), [Linear Attention Architectures: Mechanisms, Trade-offs, and Cross-Layer Routing](linear-attention-architectures-routing.md), [Let's Scale Step by Step: Compute-Efficient Hyperparameter Transfer for Large-Scale Mixture-of-Experts](moe-compute-efficient-transfer.md)
