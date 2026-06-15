# Smaller Models are Natural Explorers for Policy-Level Diversity in GRPO

**TL;DR:** Small-to-Large Policy Optimization (S2L-PO) is a new framework that leverages smaller models within the same family as "natural explorers" to generate diverse rollouts for training larger models via [GRPO](../concepts/group-relative-policy-optimization.md). This approach avoids the noise of token-level randomness, providing structured exploration signals that lead to faster convergence and higher performance ceilings in mathematical reasoning.

## The Problem with Current Exploration in GRPO

In Group Relative Policy Optimization (GRPO), the quality of the policy update heavily depends on the diversity of the rollouts (the multiple outputs generated for a single prompt). Traditionally, this diversity is increased by injecting more token-level randomness (e.g., higher temperature or top-p sampling).

However, token-level randomness has a significant downside: it introduces step-wise noise. This noise can lead to incoherent trajectories, logical leaps, or outright gibberish, especially in complex tasks like mathematical reasoning. While you get different answers, you often get a lot of useless, low-quality answers that do not provide good learning signals for the model.

## Enter S2L-PO: Policy-Level Diversity

The researchers identified a crucial insight: smaller models within the same architectural family inherently exhibit higher policy-level diversity. When you sample multiple times from a small model, it explores different logical paths more aggressively than a large model, as indicated by its superior "pass@k" relative to its larger counterparts when the sample count (k) is high.

Crucially, the diversity from a small model is temporally correlated. It preserves logical consistency throughout the trajectory. It is not just random noise; it is structured, coherent exploration.

The **S2L-PO (Small-to-Large Policy Optimization)** framework uses a fixed, smaller model to generate the initial rollouts used to train a larger learner model.

### Progressive Annealing Strategy

To balance exploration (learning new things from the small model's diverse paths) and exploitation (refining the large model's own capabilities), S2L-PO employs a progressive annealing strategy.

Training starts with offline rollouts generated entirely by the small model. Over time, the training process transitions to using the large learner's own sampled rollouts. This shift prevents the training from bottlenecking on the small model's capacity limits later in the process, elegantly avoiding mid-training performance drops.

### Results
Using a 1.7B parameter model as an explorer to guide an 8B parameter model, S2L-PO improved accuracy on the AIME 24 math benchmark by +8.8% while simultaneously reducing the compute required for rollouts.

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers)**
If you are building custom reasoning models or fine-tuning existing foundation models for maximum accuracy in specialized domains (like coding or advanced math), S2L-PO provides a structural advantage. It allows you to break out of local optima faster by using a small model to map out diverse reasoning paths, pushing your final model to a higher performance ceiling than standard GRPO alone.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers)**
Training with GRPO is already more efficient than PPO, but the rollout phase (generating multiple answers to evaluate) is still computationally expensive. By generating the initial exploratory rollouts using a much smaller, cheaper model (e.g., 1.7B vs 8B), S2L-PO directly reduces the FLOPs and time required during the critical exploration phase of RL training.

💻 **THE EVERYDAY PROMPT ENGINEERS**
This is purely a training methodology and does not directly change how you prompt existing models through web interfaces or APIs today. However, it signals that the next generation of small-to-medium models will be significantly more capable, as training them becomes more efficient and effective.

## References
* [Smaller Models are Natural Explorers for Policy-Level Diversity in GRPO](https://arxiv.org/abs/2605.30789)
