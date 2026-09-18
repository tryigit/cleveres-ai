# RetireOPD: Self-Retiring On-Policy Distillation for Agentic Reinforcement Learning

**Category:** Frontier Research & Papers
**Key Concepts:** Agentic Reinforcement Learning, On-Policy Distillation, Adaptive Retirement, Skill-Conditioned Teacher, Token-Level Supervision

## TL;DR
Training multi-turn agents with Reinforcement Learning (RL) is difficult because the sparse, scalar reward per trajectory is often insufficient for robust learning. A common solution is On-Policy Distillation (OPD), where a skill-free student learns from a self-teacher equipped with privileged task skills. However, teacher supervision isn't always reliable, and its benefits are stage-dependent. **RetireOPD (Self-Retiring On-Policy Distillation)** solves this by first optimizing a decoupled, skill-conditioned teacher, and then training the student jointly with RL and OPD. Crucially, it introduces *Adaptive Retirement*: the student autonomously drops the teacher's guidance once their discrepancy stops shrinking and the student reaches a target success rate. After retirement, training proceeds with RL alone. Applied to Qwen2.5 models, RetireOPD significantly improves success rates on ALFWorld and WebShop, even surpassing the performance of its own skill-conditioned teacher.

---

## Real-World Application & Who Should Care

### (Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
**Why you care:** When training agents for complex, multi-turn environments, distillation from a teacher with privileged information often plateaus, as the student eventually becomes limited by the teacher's own bottlenecks. RetireOPD allows the student to absorb the dense token-level supervision early on, and then break free to surpass the teacher via pure RL.
**Action:** Implement Adaptive Retirement in your agentic RL pipelines. Monitor the KL divergence or discrepancy between student and teacher during OPD; once it plateaus and a baseline success rate is hit, sever the distillation loss and rely purely on environment rewards.

### (Money) THE COST & LATENCY OPTIMIZERS (API Developers):
**Why you care:** Training and serving dual models (teacher and student) during extended RL fine-tuning is computationally expensive. By adaptively retiring the teacher model early in the training process, you save significant compute resources during the latter stages of RL optimization.
**Action:** Use RetireOPD to minimize the GPU hours spent on generating teacher rollouts. The student can acquire the necessary dense signals efficiently and then switch to a cheaper, pure RL setup for final refinement.

### (Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
**Why you care:** This research explains why smaller, specialized open-source agents are becoming incredibly competent at complex web navigation and tool-use tasks, rivaling massive frontier models.
**Action:** As models trained with techniques like RetireOPD become available, you can trust smaller local or open-source agents (like those based on Qwen2.5) to reliably execute multi-step workflows (like booking flights or parsing web interfaces) without needing to rely on the largest, most expensive commercial APIs.

---

## References
*   [RetireOPD: Self-Retiring On-Policy Distillation for Agentic Reinforcement Learning](https://arxiv.org/abs/2609.20784)

See also: [β-OPSD: Deriving with Policy Optimization, Training with Self-Distillation](b-opsd.md)
