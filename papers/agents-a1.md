# Scaling the Horizon, Not the Parameters: Reaching Trillion-Parameter Performance with a 35B Agent

**Category:** Frontier Research & Papers
**Link:** [Scaling the Horizon, Not the Parameters: Reaching Trillion-Parameter Performance with a 35B Agent](http://arxiv.org/abs/2606.30616v1)

## TL;DR
Agents-A1 is a 35B [Mixture of Experts (MoE): Scaling Intelligence Efficiently](../concepts/mixture-of-experts.md) model that achieves performance on par with trillion-parameter models (like Kimi-K2.6 and DeepSeek-V4-pro) on long-horizon tasks. It achieves this by focusing on scaling the agent horizon rather than the model size. By building a long-horizon knowledge-action infrastructure and employing a novel three-stage training recipe, Agents-A1 handles complex, multi-step tasks across diverse domains efficiently.

## Core Innovations: The Horizon Scaling Framework

### 1. Long-Horizon Infrastructure
Instead of relying on sheer parameter size to brute-force reasoning, Agents-A1 scales the length and complexity of its trajectories. The framework integrates external knowledge, actions, observations, and verifier outcomes to construct rich agentic trajectories that average 45K tokens in length. This allows the model to "think longer" and course-correct over extended interactions.

### 2. Three-Stage Training Recipe
The model is trained via a highly specialized pipeline designed to distill vast domain knowledge into a compact 35B student:
*   **Stage 1: Full-Domain Supervised Fine-Tuning (SFT)** - The base model is aligned with broad agentic behaviors to establish a foundational understanding of tasks.
*   **Stage 2: Specialized Domain Teachers** - Domain-level teacher models are trained to capture specialized expertise in distinct areas.
*   **Stage 3: Multi-Teacher Domain-Routed On-Policy Distillation** - This novel technique uses salient vocabulary alignment to efficiently transfer knowledge from the specialized teachers into the single 35B student model, unifying six heterogeneous domains without catastrophic forgetting.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS
For researchers building highly autonomous AI systems, Agents-A1 proves that massive scale isn't the only path to SOTA performance. By focusing on trajectory length and robust multi-teacher distillation, you can achieve trillion-parameter capabilities in complex domains (like FrontierScience-Olympiad and MolBench-Bind) using significantly smaller, MoE-based architectures.

### 💰 THE COST & LATENCY OPTIMIZERS
This is a massive breakthrough for API developers and platform engineers. Running a 35B MoE model is exponentially cheaper and faster than serving a 1T+ parameter behemoth. Agents-A1 offers a blueprint for deploying hyper-capable agents in production environments where hardware constraints or inference costs typically prohibit the use of frontier-scale models.

### 💻 THE EVERYDAY PROMPT ENGINEERS
While the internal architecture is complex, the takeaway for prompt engineering is clear: models that are encouraged to generate long, detailed trajectories perform better. When using agents, providing them with structured environments where they can gather external knowledge, observe outcomes, and verify steps over many iterations (simulating a long horizon) will yield significantly better results than expecting a zero-shot answer.

---
## References
* [Scaling the Horizon, Not the Parameters: Reaching Trillion-Parameter Performance with a 35B Agent](http://arxiv.org/abs/2606.30616v1)
