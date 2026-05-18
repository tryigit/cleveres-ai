# MMSkills: Towards Multimodal Skills for General Visual Agents

**Category:** Frontier Research & Papers
**Date:** May 2024

## TL;DR
Reusable skills are critical for improving agent capabilities. However, most existing skill packages encode behavior as textual prompts, code, or learned routines. For visual agents, procedural knowledge is inherently multimodal: they must recognize relevant states, interpret visual progress or failure, and decide the next operation. This paper introduces **MMSkills**, a framework for representing, generating, and using reusable multimodal procedures for runtime visual decision making. It compacts a textual procedure with runtime state cards and multi-view keyframes into a state-conditioned package, significantly improving both frontier and smaller multimodal agents across GUI and game-based benchmarks.

***

## The Multimodal Procedural Knowledge Framework

MMSkills formalizes three practical challenges for general visual agents:
1.  **Representation (What a package should contain):** Each MMSkill is a compact, state-conditioned package. It tightly couples a textual procedure with *runtime state cards* and *multi-view keyframes*.
2.  **Generation (Where packages come from):** The framework develops an agentic trajectory-to-skill Generator. This transforms public, non-evaluation interaction trajectories into reusable skills via workflow grouping, procedure induction, visual grounding, and meta-skill-guided auditing.
3.  **Utilization (How agents consult the evidence):** The paper introduces a "branch-loaded" multimodal skill agent. Selected state cards and keyframes are inspected in a temporary branch, aligned with the live environment, and then distilled into structured guidance for the main agent. This avoids excessive image context or over-anchoring to reference screenshots.

This approach suggests that external multimodal procedural knowledge effectively complements model-internal priors, providing robust capabilities across diverse visual domains. This complements other autonomous systems like [OpenManus: The Open-Source Framework for General AI Agents](../models/openmanus.md) and approaches addressing multi-turn instability like [Self-Distilled Agentic Reinforcement Learning](self-distilled-agentic-rl.md).

***

## Real-World Application & Who Should Care

### 🚀 The Performance Monsters (SOTA Seekers)
**Why you care:** If you are building general-purpose visual agents (e.g., for GUI automation or game-playing), MMSkills provides a structured way to inject external procedural knowledge. The branch-loaded mechanism allows your agent to consult visual evidence without polluting the main context window or over-anchoring.
**Action:** Implement the trajectory-to-skill Generator to harvest public interaction data and build a library of multimodal skills to augment your agent's zero-shot visual reasoning capabilities.

### 💰 The Cost & Latency Optimizers (API Developers)
**Why you care:** Pumping continuous video frames or massive screenshot histories into a frontier multimodal model is extremely expensive and slow.
**Action:** By packaging visual knowledge into compact "state cards" and "multi-view keyframes" and distilling them in a temporary branch, you can dramatically reduce the visual tokens processed by the main agent during runtime decision making, lowering API costs and latency.

### 💻 The Everyday Prompt Engineers
**Why you care:** While you might not build the architecture, understanding that visual agents struggle without multimodal procedural knowledge changes how you prompt them.
**Action:** When instructing vision-language models for complex visual tasks, provide explicit "state cards" in your prompt - couple text instructions with reference screenshots of intermediate states and success/failure conditions to guide the model effectively.

***

## References
*   [Paper page - MMSkills: Towards Multimodal Skills for General Visual Agents](https://huggingface.co/papers/2605.13527)
