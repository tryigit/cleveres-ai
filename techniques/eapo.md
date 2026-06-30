# Experience Augmented Policy Optimization for LLM Reasoning

**Category:** Prompt Engineering Techniques
**Link:** [Experience Augmented Policy Optimization for LLM Reasoning](http://arxiv.org/abs/2606.30420v1)

## TL;DR
Experience-Augmented Policy Optimization (EAPO) is a new method for improving LLM reasoning via Reinforcement Learning with Verifiable Rewards (RLVR). Instead of discarding past reasoning trajectories or forcing the model to follow fixed, outdated paths, EAPO treats a prior RL-optimized policy as an "action-level experience prior" and selectively injects experience at critical decision points during rollout.

## The Problem with Current RLVR
Reinforcement Learning with Verifiable Rewards (RLVR) has become standard for boosting LLM reasoning (similar to the goals of [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md), but using mathematical/logical verification). However, standard RLVR struggles with efficiency:
1.  **High Sampling Costs:** Models often train from scratch, failing to utilize accumulated experience efficiently.
2.  **Policy Mismatch:** Attempts to reuse past reasoning trajectories usually treat them as fixed paths. As the model learns and evolves, these old, fixed trajectories become mismatched with its current behavior, leading to unstable training.

## The EAPO Solution
EAPO solves this by making experience *policy-adaptive*.
*   **Action-Level Priors:** Instead of forcing the model down a rigid historical path, EAPO uses a prior, optimized policy to guide the current model action-by-action.
*   **Selective Injection:** The system intelligently identifies "critical decision points" during generation (rollout) and injects experience only when needed, allowing the model flexibility while keeping it on a productive track.
*   **Adapted Importance Sampling:** To keep the learning process stable and mathematically unbiased when mixing in these augmented rollouts, EAPO uses a specialized importance sampling scheme.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS
If you are pre-training or heavily fine-tuning models for advanced math or coding (like Qwen-2.5-Math), EAPO offers a more efficient RLVR pipeline. It consistently outperforms standard RLVR baselines, allowing you to reach higher reasoning benchmarks with better sample efficiency.

### 💰 THE COST & LATENCY OPTIMIZERS
Training reasoning models via RL is notoriously expensive in terms of compute and time. By efficiently reusing past experience without suffering from policy mismatch, EAPO reduces the total sampling cost required to converge on a highly capable model, saving significant GPU hours during the alignment phase.

### 💻 THE EVERYDAY PROMPT ENGINEERS
While EAPO is a training-time technique, its core philosophy-adaptive guidance at critical decision points-can inform prompt design. When building complex agent workflows or multi-step reasoning chains, providing "experience priors" (like few-shot examples or specific hints) dynamically at the exact step the model typically fails is more effective than dumping all constraints into the initial system prompt.

---
## References
* [Experience Augmented Policy Optimization for LLM Reasoning](http://arxiv.org/abs/2606.30420v1)
