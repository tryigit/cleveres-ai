# CoRT: Counterfactual Replay for Token-Level Rubric-Guided Policy Optimization

**TL;DR:** CoRT is a novel method for allocating reward credit at the token level during rubric-based reinforcement learning (like GRPO). Instead of broadcasting a single response-level score uniformly to all generated tokens or training a complex auxiliary scoring model, CoRT uses counterfactual replay to compute token-wise likelihood contrasts. This enables fine-grained credit assignment without changing the overall response reward or adding significant overhead.

## The Problem with Response-Level Rewards
In modern RLHF pipelines (especially GRPO-style frameworks), language models are often trained by evaluating their outputs against explicit rubrics. However, these structured judgments are usually reduced to a single scalar reward for the entire response. This reward is then converted into an advantage and broadcast uniformly to all generated tokens.

This creates a credit assignment problem: if a model generates a brilliant reasoning step but makes a minor formatting error at the end, the penalty applies uniformly to the entire sequence. The model receives no explicit signal about *which* specific tokens caused the reward or penalty, even when the rubric criteria are grounded in highly specific semantic choices or spans.

## How CoRT Works
CoRT solves this by introducing a lightweight, token-level credit weighting mechanism:
1.  **Counterfactual Replay:** It takes a sampled response and rescores it twice: once using the original rubric-conditioned prompt, and once using a matched, criteria-free "counterfactual" prompt.
2.  **Likelihood Contrasts:** It calculates the difference in log-likelihoods for each token between these two contexts. This contrast acts as a proxy for how much a specific token depends on the rubric context.
3.  **Credit Redistribution:** CoRT maps these contrasts into bounded, response-normalized weights. It then redistributes the standard signed GRPO advantage across the tokens based on these weights.

## Key Advantages
*   **No Auxiliary Scorer Required:** Unlike other token-level RL methods, CoRT does not require training and deploying a separate token scoring model, retaining the architectural simplicity of GRPO.
*   **Preserves the Overall Reward:** The token-level adjustments are normalized so that the total response-level reward remains unchanged, ensuring training stability.
*   **Empirical Gains:** In experiments across various instruction-tuned models, CoRT improved over matched response-level GRPO by an average of 4.4 percentage points, proving that policy-internal likelihoods provide an effective, granular training signal.

## Real-World Application & Who Should Care

(Rocket) **THE PERFORMANCE MONSTERS (SOTA Seekers):**
For engineers fine-tuning reasoning models or agents on highly specific, multi-constraint tasks (e.g., coding with strict stylistic guidelines, complex math formatting), CoRT offers a way to maximize the data efficiency of your RL pipeline. It ensures the model learns precisely *why* a response succeeded or failed, accelerating alignment on granular constraints.

(Money) **THE COST & LATENCY OPTIMIZERS (API Developers):**
Implementing token-level RL usually requires running a second, heavy reward model alongside the main policy during training. CoRT bypasses this entirely by reusing the policy model to perform a counterfactual forward pass. This significantly reduces the compute overhead (VRAM and FLOPs) required to achieve fine-grained policy optimization.

(Person at Computer) **THE EVERYDAY PROMPT ENGINEERS:**
This topic is highly technical and aimed at post-training engineers; it does not directly change how everyday users write prompts in web interfaces.

---

## References
* [CoRT: Counterfactual Replay for Token-Level Rubric-Guided Policy Optimization](https://arxiv.org/abs/2607.25659)

See also: [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md), [Token-Level Policy Optimization (TLPO)](../techniques/token-level-policy-optimization.md), [Enhancing Rubric-based RL via Self-Distillation](enhancing-rubric-based-rl-self-distillation.md)
