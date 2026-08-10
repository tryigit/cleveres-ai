# When Privileged Guidance Misaligns: State-Matched Routing and Contextualized Self-Distillation for Multi-Turn Agents

**Category:** Frontier Research & Papers
**Date:** August 2026

## TL;DR

On-policy distillation provides dense supervision for multi-turn agents by allowing a synchronized teacher to score student responses at every turn using successful reference trajectories. However, when agents take different actions or reorder subgoals, they reach execution states not covered by the reference trajectory. Using privileged guidance indiscriminately in these moments causes a "state-reference mismatch." To solve this, researchers introduced State-Matched Routing and Contextualized Self-Distillation (SMRC-SD). This method dynamically checks if the student's current state matches a supported state in the reference trajectory, distilling *only* at matched states and using state-conditioned teacher contexts.

## The State-Reference Mismatch

In interactive environments, multi-turn agents continually alter the execution state with each action. Traditional privileged on-policy distillation forces the teacher to guide the student based on an idealized, successful trajectory.

The problem arises when the student deviates:
1. **Different Actions:** The student might take an alternative, but valid, path.
2. **Reordered Subgoals:** The student might complete required steps in a different sequence.

When the student reaches a novel state not present in the reference, the teacher's guidance becomes locally incompatible, providing confusing or harmful gradients.

## SMRC-SD: Dynamic Distillation

SMRC-SD addresses this mismatch through two main mechanisms:

1.  **State-Matched Routing:** At each turn, the system verifies if the student's current execution state aligns with any supported state along the successful reference trajectory. If there is no match, distillation is filtered out for that turn, avoiding incompatible guidance.
2.  **Contextualized Supervision:** For matched states, SMRC-SD constructs a state-conditioned teacher context directly from the successful trajectory, ensuring the supervision is tightly grounded in the state the student has actually reached.

This approach significantly improved task success rates (e.g., from 0.746 to 0.865 on ALFWorld using Qwen3-1.7B) compared to unconditional full-path distillation.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
Researchers training complex multi-turn agents can use SMRC-SD to drastically improve sample efficiency and final task success rates by eliminating noisy gradients caused by state-reference mismatches during distillation.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
By focusing distillation only on matched states and avoiding unproductive updates from mismatched contexts, teams can reduce the compute overhead required to train small, specialized models for agentic workflows.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
Not directly applicable. This is a post-training optimization framework for model developers, not a prompting technique for end users.

## References

* [When Privileged Guidance Misaligns: State-Matched Routing and Contextualized Self-Distillation for Multi-Turn Agents](https://arxiv.org/abs/2608.05219)

See also: [Weak-to-Strong Generalization via Direct On-Policy Distillation](direct-on-policy-distillation.md)