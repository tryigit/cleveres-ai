# GoLongRL: Capability-Oriented Long Context Reinforcement Learning with Multitask Alignment

**Category:** Frontier Research & Papers
**Key Concepts:** Reinforcement Learning with Verifiable Rewards (RLVR), Long-Context Capabilities, Group Relative Policy Optimization (GRPO), Multitask Optimization

## TL;DR
Existing long-context reinforcement learning methods often focus on designing complex retrieval paths, which leads to narrow task coverage and reward structures that fail to capture real-world long-context needs. **GoLongRL** introduces a fully open-source, capability-oriented post-training recipe for long-context reinforcement learning with verifiable rewards (RLVR). By utilizing a diverse dataset of 23K samples across 9 task types and introducing a novel optimization technique (TMN-Reweight), GoLongRL significantly improves long-context capabilities, achieving performance comparable to leading closed-source and large-scale models.

## Key Innovations

### 1. Capability-Oriented Data Construction
Instead of relying solely on retrieval complexity, GoLongRL builds a comprehensive taxonomy of long-context capabilities. The researchers openly released a dataset of 23K RLVR samples that spans 9 distinct task types. Each task is paired with its natural evaluation metric to provide accurate, verifiable rewards.

This dataset includes curated open-source samples and synthetic data generated from real documents like books, academic papers, and multi-turn dialogues. When trained with a standard [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md) setup using only this dataset, their Qwen3-30B-A3B model outperformed the closed-source QwenLong-L1.5 dataset. It delivered performance comparable to DeepSeek-R1-0528 and Qwen3-235B-A22B-Thinking-2507, proving that reward diversity and broad task coverage are critical for long-context improvement.

### 2. TMN-Reweight for Multitask Optimization
Training a model across 9 different task types introduces significant optimization challenges because the rewards from different tasks are inherently heterogeneous. To solve this, GoLongRL introduces **TMN-Reweight**.

TMN-Reweight combines two key mechanisms:
*   **Task-Level Mean Normalization:** Aligns the scale of rewards across different tasks so that no single task dominates the gradient updates.
*   **Difficulty-Adaptive Weighting:** Adjusts the importance of samples based on their difficulty, providing more reliable advantage estimation during training.

By utilizing TMN-Reweight, the framework achieves higher average performance compared to vanilla GRPO while preserving or even improving general capabilities across standard evaluations.

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
If you are training reasoning models that need to process massive documents, books, or codebases, GoLongRL provides a blueprint. By shifting focus from simple retrieval paths to a broad taxonomy of capabilities and using TMN-Reweight, you can train smaller models (like 30B parameters) to punch far above their weight class in long-context evaluations. The fully open-source nature means you can adopt the entire pipeline immediately.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
Training models to handle long contexts efficiently is expensive. GoLongRL's findings suggest that you do not necessarily need massive parameter counts to achieve strong long-context performance. By utilizing their open-source 23K RLVR dataset and training methodology, you can post-train smaller, more efficient models that run faster and cheaper in production without sacrificing the ability to analyze lengthy user inputs.

💻 **THE EVERYDAY PROMPT ENGINEERS:**
While this is a post-training technique for model builders, the resulting models will directly benefit you. As models trained with GoLongRL principles become available, you will notice fewer "lost in the middle" errors when pasting entire codebases or long PDFs into your prompts. The models will be better aligned to handle complex, multi-step instructions across massive contexts.

## Source Links
*   [Hugging Face Paper Page](https://huggingface.co/papers/2605.19577)
*   [arXiv API ID](https://arxiv.org/abs/2605.19577)
