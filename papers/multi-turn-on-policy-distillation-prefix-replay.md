# Multi-Turn On-Policy Distillation with Prefix Replay

**Category:** Frontier Research & Papers
**Date:** July 2026

## TL;DR
Fully online On-Policy Distillation (OPD) for large language model agents is extremely expensive because it requires fresh multi-turn environment interactions from a "student" model and dense supervision from a "teacher" at every step. This paper introduces Replayed-Prefix On-Policy Distillation (ReOPD), an off-environment alternative. By reusing pre-collected teacher trajectories as prefixes, ReOPD allows the student to act at selected steps while receiving per-step supervision-eliminating the need for live environment tool calls during training. A step-decaying sampling schedule addresses the "prefix trap" (the distribution shift between student on-policy states and teacher reliability). ReOPD achieves at least a 4x speedup per rollout compared to standard OPD while preserving or improving accuracy.

## The Problem: The High Cost of Live Agent Training
When training an agentic model to use tools or interact with environments over multiple turns, standard On-Policy Distillation (OPD) forces the student model to act live in the environment. At each step, a powerful teacher model is queried for the "correct" next action based on the student's current state. This requires enormous compute overhead for tool execution, latency, and continuous teacher querying, making scalable distillation difficult.

## The Solution: Prefix Replay (ReOPD)
ReOPD turns expensive online interaction into a reusable offline resource:
1.  **Teacher Trajectories:** Pre-collected, successful interaction histories from a powerful teacher are used as a static dataset.
2.  **Prefix Replay:** Instead of running live in an environment, the student model is fed a chunk (prefix) of the teacher's trajectory. The student is then asked to predict the next action.
3.  **Dense Supervision:** The teacher's pre-calculated logits (or answers) for that exact step are used as the distillation target.
4.  **The "Prefix Trap":** Simply replacing the student's history with the teacher's history causes a distribution shift (the student never learns to recover from its own mistakes). However, making histories more "student-on-policy" queries the teacher on states where it might be unreliable. ReOPD solves this using a step-decaying sampling schedule that emphasizes early, lower-shift prefixes to balance student occupancy and teacher reliability.

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
ReOPD allows for the rapid distillation of complex, multi-step agentic behaviors (like mathematical reasoning with Python or web search) into smaller models without the bottleneck of live environment simulators. This enables massive scaling of training data.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
Training agentic models is notoriously expensive due to simulator overhead. ReOPD offers a minimum 4x speedup per rollout and requires zero live tool calls during training. You can distill a massive multi-agent workflow into a single, cheap model using purely offline logs.

💻 **THE EVERYDAY PROMPT ENGINEERS:**
This topic does not directly apply to you. ReOPD is a post-training optimization technique for model developers and does not change how you write prompts or interact with consumer web interfaces.

## References
* [Multi-Turn On-Policy Distillation with Prefix Replay](https://arxiv.org/abs/2607.04763)

See also: [Demystifying OPD: Length Inflation and Stabilization Strategies for LLMs](../papers/demystifying-opd-length-inflation.md), [Weak-to-Strong Generalization via Direct On-Policy Distillation](../papers/direct-on-policy-distillation.md)