# ATLAS: Agentic or Latent Visual Reasoning? One Word is Enough for Both

**TL;DR:** ATLAS introduces a framework that unites agentic and latent approaches to visual reasoning by representing operations as a single discrete "functional token." This avoids costly intermediate visual generation and integrates cleanly with standard scalable next-token prediction, Supervised Fine-Tuning (SFT), and Reinforcement Learning (RL) pipelines. To manage token sparsity during RL, ATLAS uses a stabilized variant known as Latent-Anchored GRPO (LA-GRPO).

## The Divide in Visual Reasoning

In visual reasoning tasks, models often need to process intermediate visual states. Historically, there have been three main approaches:
1.  **Direct Image Generation:** Using unified models to output intermediate visual frames. This is highly interpretable but computationally exorbitant and complex to architect.
2.  **Agentic Reasoning:** Allowing the model to use external tools or code to process visuals. While effective, this creates context-switching latency by constantly hitting external execution environments.
3.  **Latent Reasoning:** Using hidden, continuous embeddings to represent reasoning steps. This is fast but often lacks interpretability, struggles with task generalization, and is difficult to parallelize during standard training.

## The ATLAS Solution: The Functional Token

ATLAS bridges these gaps by compressing an internalized visual operation into a single discrete "word" added to the tokenizer's vocabulary, called a **functional token**.

Because it functions just like any other text token, it is fully compatible with standard next-token prediction and existing training loops (SFT and RL) without requiring structural changes to the model architecture. The token triggers an internal visual operation without needing external tool-call latency or verbose intermediate image generation, and without requiring explicit visual supervision data.

## Stabilizing RL with LA-GRPO

Training a model to effectively utilize a new, highly specific token via [RLHF](../concepts/rlhf.md) presents a challenge: the token appears sparsely in the generated trajectories, making gradient updates weak and unstable.

To counter this, the authors introduce **Latent-Anchored Group Relative Policy Optimization (LA-GRPO)**. Building on standard [GRPO](../concepts/group-relative-policy-optimization.md), LA-GRPO stabilizes the reinforcement learning phase by anchoring these sparse functional tokens with a statically weighted auxiliary objective, providing stronger, more consistent gradient signals to guide the model's behavior.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
Researchers developing autonomous multimodal agents can use the ATLAS paradigm to embed complex, internalized visual operations directly into the vocabulary, achieving the performance of agentic tool-use without the latency of environment handoffs.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
By converting visual reasoning steps into standard discrete tokens rather than generating intermediate image frames, engineers can dramatically reduce inference costs and latency. ATLAS proves that complex visual multi-step tasks can be handled within standard text-based Transformer architectures, keeping infrastructure unified.

### 💻 THE EVERYDAY PROMPT ENGINEERS
While ATLAS is an architectural framework, its existence signals that future multimodal models (like next-gen Claude or Gemini) will become much faster and more capable at handling complex visual logic puzzles without needing to "think out loud" via code generation.

***
**Sources:**
* ATLAS: Agentic or Latent Visual Reasoning? One Word is Enough for Both (arXiv:2605.15198)

See also: [Latent Reasoning with Normalizing Flows](latent-reasoning-normalizing-flows.md)
