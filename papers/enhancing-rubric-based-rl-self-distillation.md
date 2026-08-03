# Enhancing Rubric-based RL via Self-Distillation

## TL;DR
Rubric-based Reinforcement Learning is effective for improving Large Language Models (LLMs) on open-ended tasks, but it suffers from limited exploration. Two major failure modes exist: Unexplored Criteria (UC), where the policy never generates a rollout satisfying a specific criterion, and Suppressed Criteria (SC), where satisfied criteria lose learning signals because scalar reward aggregation assigns them non-positive overall advantages. Criterion-Distilled Policy Optimization (CriPO) solves this by using on-policy self-distillation to explicitly inject missing behaviors (UC) and rescue useful token-level patterns from negative-advantage rollouts (SC), all while avoiding the train-inference mismatch typical of external guidance methods.

## The Problem: Unexplored and Suppressed Criteria

In rubric-based RL, such as [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md), learning is driven by whether generated text satisfies specific, defined criteria. However, standard optimization struggles with exploration:

1.  **Unexplored Criteria (UC):** If a model never produces a rollout that satisfies a specific criterion, it never receives an optimization signal for that behavior. Previous methods try to fix this by giving the model "hints" (external guidance) during training, but this causes a train-inference mismatch because the hints are missing during actual deployment, leading to error accumulation.
2.  **Suppressed Criteria (SC):** Even when a model successfully satisfies a criterion in a rollout, that learning signal can be lost. If the *overall* aggregated reward for that rollout is low (e.g., it satisfied one criterion but failed three others), the rollout receives a negative advantage. Consequently, the model is penalized for the entire sequence, inadvertently suppressing the specific token patterns that successfully satisfied the one criterion. Analysis shows over 57% of samples experience SC during training.

## The Solution: Criterion-Distilled Policy Optimization (CriPO)

CriPO addresses both UC and SC without relying on external hints during inference, building upon the principles of [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md) and [Direct Preference Optimization (DPO)](../concepts/direct-preference-optimization.md):

*   **Addressing UC with a Criterion-Injection Self-Teacher:** For criteria the model never satisfies, CriPO creates a "self-teacher" by injecting the missing criteria into the generation process. It then computes a localized forward-KL loss to teach the policy these missing behaviors directly, without relying on them during inference.
*   **Addressing SC with a Counterfactual Self-Teacher:** For rollouts that have a negative overall advantage but contain useful, criterion-satisfying segments, CriPO uses a counterfactual self-teacher to locate the specific tokens responsible for the success. It then flips the advantages of these specific tokens to positive values, preserving the useful patterns instead of penalizing them along with the rest of the bad rollout.

By resolving these exploration bottlenecks, CriPO achieves stronger final performance on medicine and science benchmarks with approximately 2x fewer optimization steps compared to standard rubric-based RL.

## Real-World Application & Who Should Care

*   🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):** Researchers training LLMs for complex, multi-constraint tasks (like legal drafting or medical diagnosis) can use CriPO to ensure the model actually learns all constraints, rather than just the easiest ones, maximizing overall capability.
*   💰 **THE COST & LATENCY OPTIMIZERS (API Developers):** By achieving better performance in half the optimization steps, CriPO significantly reduces the compute costs associated with RLHF/GRPO post-training pipelines.
*   💻 **THE EVERYDAY PROMPT ENGINEERS:** This is a post-training technique. It does not change how you write prompts, but models trained with CriPO will be much better at following complex, multi-part instructions without "forgetting" specific rules.

## References
* [Enhancing Rubric-based RL via Self-Distillation](https://arxiv.org/abs/2607.18082)
