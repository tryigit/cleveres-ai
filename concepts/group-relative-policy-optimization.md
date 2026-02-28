# Group Relative Policy Optimization (GRPO)

**Category:** Core Concepts & Architecture
**Key Concepts:** Reinforcement Learning (RL), Proximal Policy Optimization (PPO), DeepSeekMath, DeepSeek-R1

## TL;DR
Group Relative Policy Optimization (GRPO) is a reinforcement learning (RL) algorithm introduced by DeepSeek, first used in DeepSeekMath and most notably in the reasoning model [DeepSeek-R1](../models/deepseek-r1.md). It is a paradigm shift from traditional methods like Proximal Policy Optimization (PPO). GRPO eliminates the need for a separate "critic" model (or value function), relying instead on group-based reward baselines and a KL-divergence penalty. This simplification significantly reduces memory and computational overhead, cutting VRAM requirements by up to 50% and democratizing RL training for large language models.

***

## How GRPO Works: Simplifying Reinforcement Learning

Traditional reinforcement learning methods used for tuning Large Language Models (LLMs), like PPO, typically require maintaining two distinct neural networks during training:
1.  **The Actor (Policy Model):** The model generating the responses.
2.  **The Critic (Value Model):** A model trained alongside the actor to evaluate how good the generated responses are.

Training and keeping both models in memory is computationally expensive. GRPO fundamentally changes this architecture.

### 1. Eliminating the Critic Model
The most significant innovation of GRPO is the complete removal of the critic model. By not needing to load and backpropagate through a second large model, GRPO drastically reduces the VRAM and compute required. DeepSeek has shown that this can lower VRAM requirements by approximately 50%, making it possible to train models that would otherwise be restricted to massive GPU clusters.

### 2. Group-Based Reward Baselines
Instead of relying on a critic model to predict a baseline value for a given prompt, GRPO uses empirical group statistics.
For a single prompt, the policy model generates a *group* of multiple candidate responses. A reward is calculated for each response in the group. The baseline is then determined directly from this group of rewards. The model optimizes its policy by looking at the relative advantage of each response compared to the group's baseline.

### 3. The KL-Divergence Penalty
To ensure the model does not "reward hack" or stray too far from its original, pre-trained capabilities (like writing coherent sentences), GRPO incorporates a Kullback-Leibler (KL) divergence penalty. This penalty anchors the policy model to a frozen reference model, ensuring that while the model learns to maximize rewards (e.g., getting a math problem right), it does not lose its fundamental language skills.

***

## Real-World Application & Who Should Care

### 🚀 The Performance Monsters (SOTA Seekers)
**Why you care:** GRPO is the secret sauce behind the self-taught reasoning capabilities of open-weight champions like DeepSeek-R1. It proves that you can achieve state-of-the-art reasoning (System 2 thinking) through pure reinforcement learning without the massive overhead of PPO.
**Action:** If you are training custom reasoning models or fine-tuning existing ones for complex domains like theorem proving or advanced coding, adopting GRPO is the most efficient path to pushing the boundaries of what open-source models can achieve.

### 💰 The Cost & Latency Optimizers (API Developers)
**Why you care:** While GRPO is a training technique rather than an inference technique, its existence indirectly benefits developers. Because it is up to 50% more memory efficient to train, it drastically lowers the barrier to entry for creating specialized, highly capable models.
**Action:** You can expect a surge of highly capable, specialized models tuned with GRPO that are smaller and cheaper to run. Keep an eye out for GRPO-tuned small models (e.g., in the 1B to 8B parameter range) that can replace larger, more expensive API calls for specific reasoning tasks.

### 🧑‍💻 The Everyday Prompt Engineers
**Why you care:** GRPO-trained models, such as DeepSeek-R1, are optimized differently than standard SFT (Supervised Fine-Tuned) models. They are heavily rewarded for showing their work and formatting their thoughts (e.g., using `<think>` tags).
**Action:** When interacting with models trained via GRPO, explicitly encourage them to output their reasoning steps. You do not need to provide lengthy few-shot examples of *how* to think; instead, clearly define the constraints of the problem and let the model's RL-honed internal monologue do the heavy lifting.

***

## References
*   [DeepSeekMath: Pushing the Limits of Mathematical Reasoning in Open Language Models (arXiv)](https://arxiv.org/abs/2402.03300)
*   [DeepSeek-R1: Incentivizing Reasoning Capability in LLMs via Reinforcement Learning](https://arxiv.org/abs/2501.12948)
