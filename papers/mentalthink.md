# MentalThink: Shaping Thoughts in Mental SVG World

## TL;DR
MentalThink introduces a novel visual-symbolic reasoning paradigm for Multimodal LLMs (MLLMs) that mimics human mental imagery. By utilizing a "think-with-SVG" pipeline, models learn to generate, render, and interpret scalable vector graphics (SVG) as an intermediate visual representation. This allows the model to externalize spatial hypotheses, inspect them deterministically, and perform complex reasoning within a constrained geometric space, effectively giving the AI a verifiable "mental" visual workspace.

## Core Mechanism
Unlike standard [Chain of Thought](../concepts/chain-of-thought.md) techniques that rely purely on text to reason through problems, MentalThink equips models with an executable mechanism for visual reflection.

The paradigm works through a two-stage training framework:
1. **Supervised Fine-Tuning (SFT):** The model learns basic SVG syntactic alignment, enabling it to write structured vector code that corresponds to specific visual layouts.
2. **Multi-turn Reinforcement Learning (RL):** The model is encouraged to iteratively inspect, revise, and refine its intermediate visual hypotheses. By repeatedly rendering the SVG sketches and updating them, the model refines its compositional scene construction and spatial understanding over multiple turns.

Extensive evaluations prove the effectiveness of this approach: MentalThink achieves 55.1% on VSIBench and 76.0% on MindCube, highlighting the superiority of executable vector graphics as a workspace for dynamic perspective-taking.

## Real-World Application & Who Should Care

*   🚀 **The Performance Monsters (SOTA Seekers):** Researchers focused on complex spatial reasoning, geometry, or dynamic visual problem-solving can use this paradigm to significantly boost accuracy. The ability to deterministically render intermediate states provides a grounded reasoning trace that standard text-only LLMs cannot match.
*   💰 **The Cost & Latency Optimizers (API Developers):** This approach adds latency due to the multi-turn SVG generation and rendering process. It is currently less applicable for low-latency tasks, though optimizing the "mental" rendering engine could eventually unlock complex visual capabilities on edge devices.
*   🧑‍💻 **The Everyday Prompt Engineers:** You can simulate this methodology today by prompting models like Claude or GPT-4 to "write SVG code representing the scene, then base your next reasoning step on the layout of that SVG." Forcing the model into an intermediate symbolic representation often grounds its hallucinations.

## References
* [MentalThink: Shaping Thoughts in Mental SVG World](https://arxiv.org/abs/2607.03530)
