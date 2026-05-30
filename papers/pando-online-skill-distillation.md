# PANDO: Efficient Multimodal AI Agents via Online Skill Distillation

**Category:** Frontier Research & Papers
**Paper:** [PANDO: Efficient Multimodal AI Agents via Online Skill Distillation](https://arxiv.org/abs/2605.24785)
**Date:** May 2026

## TL;DR
PANDO is a single-rollout online skill-distillation framework designed to make multimodal web agents more efficient as they accumulate experience. Instead of relying on increased inference-time compute (like rollout search or specialist model stacks), PANDO maintains a structured Skill Library and uses progress reflection, confidence-based skill demotion, hierarchical routing, visual compression, and cache-aware prompting. It achieves a 58.3% success rate on VisualWebArena using up to 61% fewer tokens than previous models, demonstrating that agents can become both better and cheaper over time.

---

## The Efficiency Problem in Web Agents
Recent advances in multimodal web agents have primarily focused on scaling inference-time computation to improve success rates. While effective, this approach introduces severe inefficiencies:
1.  **Repeat-Action Loops:** Agents often get stuck repeating the same unsuccessful actions.
2.  **Hidden Discovery Costs:** Significant compute is spent exploring and verifying paths before a final solution is found.
3.  **Low Prompt-Cache Reuse:** Agents rarely reuse context effectively across steps.

These factors make long-horizon web automation prohibitively expensive at scale. A core question emerges: can an agent learn from its past interactions to reduce its marginal cost on future tasks?

## PANDO's Online Skill Distillation Framework
PANDO addresses these inefficiencies by shifting from inference-time search to experience-driven efficiency. Key components include:

### 1. Structured Skill Library
PANDO maintains a persistent library of acquired skills. Rather than acting from scratch every time, it retrieves and applies learned routines.

### 2. Hierarchical Routing & Confidence-Based Demotion
The agent hierarchically routes tasks to the most appropriate skills. If a skill fails or the agent's confidence drops, PANDO employs "confidence-based skill demotion" to gracefully fall back to more primitive actions, preventing endless loops.

### 3. Visual Compression and Cache-Aware Prompting
To maximize the efficiency of context windows, PANDO uses visual compression to reduce image token loads and cache-aware prompting. By keeping static skill definitions and environmental context consistent, it maximizes hit rates in [Context Caching: The Cost-Cutting Superpower for Long-Context AI](../techniques/context-caching.md).

## Trajectory-Level Efficiency Metrics
To properly evaluate agent efficiency, the authors introduce three new metrics beyond simple binary success:
*   **Action Repetition Rate:** How often the agent repeats the exact same action.
*   **Step Overhead Ratio:** The ratio of exploratory/failed steps to the final successful path.
*   **Prompt Cache Utilization:** The percentage of tokens successfully retrieved from the KV cache rather than recomputed.

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
For researchers building state-of-the-art web agents, PANDO shows that building a structured, hierarchical skill library is more effective than brute-forcing rollout search. The 58.3% success rate on VisualWebArena without pre-evaluation discovery budgets sets a new standard for single-rollout capability. It pairs naturally with frameworks like [MUSE-Autoskill: Self-Evolving Agents via Skill Creation, Memory, Management, and Evaluation](muse-autoskill.md).

💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
This is a blueprint for viable commercial agents. By drastically reducing token usage (up to 61% less) and explicitly optimizing for prompt cache utilization, PANDO directly translates into lower API bills and faster response times for enterprise web automation tasks.

💻 **THE EVERYDAY PROMPT ENGINEERS:**
When creating your own custom GPTs or local agents for repetitive web tasks, you can apply PANDO's principles: explicitly instruct your agent to save successful "routines" in its memory, and encourage it to fall back to basic steps if a complex routine fails twice.

---
**Sources:**
*   [PANDO: Efficient Multimodal AI Agents via Online Skill Distillation (arXiv:2605.24785)](https://arxiv.org/abs/2605.24785)
