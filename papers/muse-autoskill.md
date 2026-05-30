# MUSE-Autoskill: Self-Evolving Agents via Skill Creation, Memory, Management, and Evaluation

**Category:** Frontier / Research Paper
**Paper:** [MUSE-Autoskill: Self-Evolving Agents via Skill Creation, Memory, Management, and Evaluation](https://arxiv.org/abs/2605.27366)
**Date:** May 2026

## TL;DR
MUSE-Autoskill (Memory-Utilizing Skill Evolution) addresses a major limitation in current autonomous agents: the treatment of generated skills as static, isolated blocks of code. Instead, it proposes a unified lifecycle for agent skills - from creation and memory to management, evaluation, and continuous refinement. By treating skills as long-lived, experience-aware assets with built-in memory, agents can effectively reuse and self-improve their task-solving capabilities over time across different contexts.

---

## The Problem: Static Skills in Agents
While modern AI agents can write code to solve tasks, most existing frameworks discard these "skills" after use or store them statically in a library. When a new task arrives, the agent either writes a new skill from scratch or blindly retrieves an old one that may not perfectly fit or might contain uncorrected edge cases. This prevents true continuous learning and evolution.

## The MUSE-Autoskill Framework
MUSE-Autoskill transforms skills into dynamic, living entities managed through a complete lifecycle:

1.  **Creation:** The agent generates skills on-demand when faced with novel challenges.
2.  **Memory:** A unique *skill-level memory* is introduced. Each skill accumulates its own experience (e.g., edge cases encountered, successful adaptations) across different tasks.
3.  **Management:** Skills are organized efficiently, allowing the agent to retrieve and select the most relevant tools for a given context.
4.  **Evaluation & Refinement:** Skills are rigorously tested via unit tests and runtime feedback. If a skill fails or encounters a new scenario, it is continuously refined.

By incorporating unit tests and runtime feedback, MUSE-Autoskill ensures that skills are not just reusable, but reliable and self-improving.

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
For researchers building general-purpose autonomous agents, the skill-level memory is a paradigm shift. It allows agents to accumulate wisdom within their toolset, significantly improving cross-task transfer and long-term success rates on benchmarks like SkillsBench. This framework is crucial for building agents that actually get smarter the longer they run.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
Reusing and adapting reliable, pre-tested skills drastically reduces the token usage and latency associated with generating complex code from scratch for every new request. By managing a refined skill library, developers can build more efficient multi-agent systems, such as using an [Agent-as-a-Judge](agent-as-a-judge.md) to verify skill execution without regenerating the core logic.

💻 **THE EVERYDAY PROMPT ENGINEERS:**
If you are building custom GPTs or local agents that execute code, try prompt patterns that enforce a "skill lifecycle". Ask your agent to write a test suite alongside its code, and instruct it to document any edge cases it encounters in a central log to improve its future responses.

---
**Source:** https://arxiv.org/abs/2605.27366

See also: [PANDO: Efficient Multimodal AI Agents via Online Skill Distillation](pando-online-skill-distillation.md)
