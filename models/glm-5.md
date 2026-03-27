# GLM-5: Zhipu AI's Open-Weight Frontier Model

**Category:** Frontier Models
**Key Concepts:** Mixture of Experts (MoE), [DeepSeek Sparse Attention (DSA)](../concepts/deepseek-sparse-attention.md), Asynchronous RL

## TL;DR
GLM-5 is a recently released frontier large language model by Zhipu AI (now matched in performance by efficient alternatives like [MiniMax M2.7](minimax-m2-7.md)), targeting complex systems engineering and long-horizon agentic tasks. It is a 744B-parameter [Mixture of Experts (MoE)](../concepts/mixture-of-experts.md) model with 40B active parameters per token. Building on its predecessor, GLM-5 introduces [DeepSeek Sparse Attention (DSA)](../concepts/deepseek-sparse-attention.md) for efficient long-context handling (up to 200K tokens) and employs a novel [asynchronous reinforcement learning](../papers/areal.md) infrastructure called "slime" to maximize post-training iteration efficiency. It currently stands as one of the most capable open-weight models available.

---

## Architectural Breakthroughs

GLM-5 represents a significant scale-up and architectural evolution for Zhipu AI:

*   **Scale and MoE Architecture:** The model scales from the 355B parameters of GLM-4.5 to a massive 744B total parameters. However, by utilizing a sparse [MoE](../concepts/mixture-of-experts.md) architecture, it only activates 40B parameters during inference. This provides the reasoning capacity of a massive model while maintaining reasonable computational costs.
*   **[DeepSeek Sparse Attention (DSA)](../concepts/deepseek-sparse-attention.md):** To handle large contexts efficiently, GLM-5 integrates DeepSeek Sparse Attention. This mechanism significantly reduces the deployment cost and memory overhead associated with standard attention, allowing the model to natively support a 200K-token context window without catastrophic performance degradation.
*   **Pre-training Data:** The pre-training corpus was expanded from 23 trillion to 28.5 trillion tokens, providing a broader base of knowledge and reasoning patterns.
*   **"Slime" Asynchronous RL:** A major bottleneck in modern LLM development is the inefficiency of Reinforcement Learning (RL) during post-training. Zhipu AI developed "slime", a novel asynchronous RL infrastructure (similar in spirit to [AReaL](../papers/areal.md)). This infrastructure substantially improves training throughput and efficiency, enabling more fine-grained and frequent post-training iterations, which is crucial for complex agentic and reasoning tasks.
*   **Hardware Independence:** Notably, GLM-5 was trained entirely on Huawei Ascend chips using the MindSpore framework, demonstrating the viability of non-NVIDIA compute stacks at the frontier scale.

## Performance and Benchmarks

GLM-5 achieves best-in-class performance among open-source models across various reasoning, coding, and agentic benchmarks:

*   **Coding & Engineering:** It scores highly on SWE-bench Verified (77.8%), approaching the performance of top proprietary models like Claude Opus 4.5 in real-world programming scenarios.
*   **Long-Horizon Agentic Tasks:** On the Vending Bench 2 benchmark, which measures long-term operational capabilities (simulating a business over a year), GLM-5 ranks #1 among open-source models, demonstrating strong long-term planning and resource management.

---

## Real-World Application & Who Should Care

### 🚀 The Performance Monsters (SOTA Seekers)
**Why you care:** GLM-5 is currently one of the most powerful open-weight models available for complex systems engineering. Its massive 744B parameter count (with 40B active) provides top-tier reasoning capabilities.
**Action:** Deploy GLM-5 for demanding agentic tasks, advanced coding generation, or complex reasoning pipelines where open weights and high performance are mandatory.

### 💰 The Cost & Latency Optimizers (API Developers)
**Why you care:** The integration of [MoE](../concepts/mixture-of-experts.md) (40B active parameters) and [DeepSeek Sparse Attention (DSA)](../concepts/deepseek-sparse-attention.md) means GLM-5 is significantly cheaper to run than a dense model of similar capability.
**Action:** If you need frontier-level intelligence but are constrained by the inference costs of dense models or proprietary APIs, GLM-5's architecture offers an excellent cost-to-performance ratio, especially for tasks requiring long context windows (up to 200K tokens).

### 💻 The Everyday Prompt Engineers
**Why you care:** GLM-5 excels at "agentic" tasks and long-horizon planning. It's not just for chatting; it's designed to follow complex, multi-step instructions over time.
**Action:** When using GLM-5 in web interfaces or tools (like Claude Code or OpenCode), give it complex, multi-part problems. You can leverage its 200K context window to upload massive codebases or long documents and expect it to maintain coherence and follow complex instructions throughout the interaction.

---

## References
*   [GLM-5: China's First Public AI Company Ships a Frontier Model (Medium)](https://medium.com/@mlabonne/glm-5-chinas-first-public-ai-company-ships-a-frontier-model-a068cecb74e3)
*   [Zhipu AI Developer Documentation](https://docs.z.ai/guides/llm/glm-5)