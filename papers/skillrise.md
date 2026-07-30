# SkillRise: Agentic Reinforcement Learning for Cross-Task Skill Evolution

**TL;DR:** SkillRise is a unified reinforcement learning framework designed to help LLM agents learn and transfer skills across related but distinct tasks. Unlike traditional methods that treat each task as an isolated episode or rely on complex multi-stage pipelines, SkillRise uses a single policy to alternate between solving a task and updating an evolving "skill document." This document is then passed to the next task in a progressively challenging sequence.

## How SkillRise Works
LLM agents often encounter multiple tasks that share underlying solution patterns. Standard agentic RL struggles because it doesn't carry insights forward. SkillRise solves this by interleaving execution and curation:
1.  **Task Solving:** The agent attempts a task using its current knowledge and the provided skill document.
2.  **Skill Curation:** After the attempt, the same policy reflects on the outcome and updates the skill document.
3.  **Cross-Task Transfer:** The updated document is passed directly as context to the next related task in the sequence.

A key innovation is its decoupled credit assignment: the solving steps are supervised by the immediate outcome of the current task, while the curation steps are supervised by the discounted future outcomes of downstream tasks. This teaches the model to extract reusable, transferable skills rather than just memorizing a solution to the current problem.

## Key Advantages
*   **Unified Policy:** Alternates between solving and curating without needing separate specialist models.
*   **Eliminates Complex Pipelines:** Avoids the runtime overhead and fragility of multi-stage systems that separately extract, retrieve, and execute skills.
*   **True Cross-Task Generalization:** Experiments show scaling at test time-performance improves with longer sequences of distinct but related tasks, proving the model is transferring skills rather than just benefiting from repeated sampling of a single task.

## Real-World Application & Who Should Care

(Rocket) **THE PERFORMANCE MONSTERS (SOTA Seekers):**
For researchers building highly capable, generalist agents across diverse environments (like WebShop or ALFWorld), SkillRise provides a rigorous RL mechanism to achieve state-of-the-art Pass@1 performance. The ability to evolve a dynamic skill document across task sequences unlocks a new level of continuous, in-context learning.

(Money) **THE COST & LATENCY OPTIMIZERS (API Developers):**
Multi-stage agent architectures that require separate LLM calls for reasoning, extracting skills, retrieving them, and executing them are extremely token-heavy. SkillRise folds this entire lifecycle into a single policy alternating within a continuous sequence, significantly reducing the runtime overhead and API costs of agentic skill learning.

(Person at Computer) **THE EVERYDAY PROMPT ENGINEERS:**
While the RL training framework is complex, the underlying concept is highly applicable: when prompting an AI to solve a series of related tasks, explicitly ask it to "update its internal rulebook or skill document" after each attempt, and pass that document forward to the next prompt. This mirrors the SkillRise process and improves consistency across complex workflows.

---

## References
* [SkillRise: Agentic Reinforcement Learning for Cross-Task Skill Evolution](https://arxiv.org/abs/2607.26784)

See also: [Agentic Context Management: Solving Agent Memory and Cost by Treating Them as Lifecycle and Architecture Problems](../papers/agentic-context-management.md), [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md)
