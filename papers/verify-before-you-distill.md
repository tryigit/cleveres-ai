# Verify Before You Distill: Prompt-Level Teacher Gating for On-Policy Distillation

## TL;DR

Vanilla On-Policy Distillation (OPD) uniformly applies dense token-level supervision from a frozen teacher model to a student's rollouts. However, if the teacher is wrong on a specific prompt, it can induce a strong but misleading update for the student due to the mode-seeking nature of reverse KL divergence. This paper introduces Teacher-Gated On-Policy Distillation (TGOPD), which first verifies teacher reliability at the prompt level using a small set of verifier-scored teacher probes. If the teacher is deemed reliable, the prompt is routed to dense OPD; otherwise, it falls back to verifier-grounded GRPO. This approach not only improves student performance across mathematics, code, and instruction following, but also significantly reduces compute waste, increasing asynchronous OPD teacher-node GPU utilization from under 10% to nearly 80%.

## The Problem with Vanilla OPD

In traditional on-policy distillation, the student model generates rollouts, and the teacher model provides token-level feedback (supervision) on those rollouts. The issue arises because the teacher model is not infallible. When a teacher makes a mistake, the dense supervision it provides confidently points the student in the wrong direction. Because the objective function relies on reverse Kullback-Leibler (KL) divergence, which is "mode-seeking," the student model heavily penalizes itself for deviating from the teacher's incorrect path, leading to severely misleading updates. Previous methods like entropy or likelihood agreement only measure uncertainty, not outcome correctness.

## Teacher-Gated On-Policy Distillation (TGOPD)

TGOPD solves this by adding a prompt-level gating mechanism:
1. **Probe Generation**: For a given prompt, the teacher generates a small number of "probes" (responses).
2. **Reliability Check**: A verifier scores these probes. If the teacher demonstrates it can reliably solve the prompt, the prompt passes the gate.
3. **Routing**:
   - **Pass**: The prompt is routed to dense On-Policy Distillation (OPD).
   - **Fail**: The prompt is routed to standard Group Relative Policy Optimization (GRPO), where the student learns from verifier scores without dense teacher guidance.

By utilizing otherwise-idle teacher capacity for these reliability checks during asynchronous training, TGOPD turns downtime into productive verification, vastly improving compute efficiency.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For researchers training custom models (e.g., 4B to 35B parameters), TGOPD provides a robust framework to combine the dense, token-level efficiency of distillation with the safety of reinforcement learning (GRPO). It ensures that your student model doesn't overfit to the teacher's hallucinations or errors on difficult prompts.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
If you run asynchronous distillation pipelines, teacher GPU nodes often sit idle waiting for student rollouts. TGOPD uses this idle time to generate verification probes. The paper demonstrates an increase in teacher-node GPU utilization from 9.8% to 78.9%. This directly translates to faster training runs and significantly reduced hardware rental costs.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
This training technique operates under the hood during model creation and does not directly change how you write prompts in web interfaces today. However, you will notice future open-weight models becoming much better at complex reasoning tasks without inheriting the exact flaws of the larger models they were distilled from.

## Source
- [Verify Before You Distill: Prompt-Level Teacher Gating for On-Policy Distillation](https://arxiv.org/abs/2609.02998)

See also: [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md), [Direct Preference Optimization (DPO)](../concepts/direct-preference-optimization.md)
