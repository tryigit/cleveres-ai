# Nemotron 3 Super: The Hybrid Mamba-MoE

**Category:** Frontier / Models
**Key Concepts:** Agentic Reasoning, LatentMoE, Multi-Token Prediction (MTP), Mamba-2

## TL;DR
Released in March 2026 by NVIDIA, **Nemotron 3 Super** (120B total, 12B active parameters) is an open-weights model engineered specifically to solve the "thinking tax" and "context explosion" in multi-agent systems. It achieves maximum compute efficiency by combining a hybrid **[State Space Models (SSM) & Mamba](../concepts/state-space-models.md)** architecture with **[LatentMoE](../concepts/latent-moe.md)** and **[Multi-Token Prediction (MTP)](../concepts/multi-token-prediction.md)**.

---

## The Architecture: Solving Multi-Agent Bottlenecks

Agentic AI systems generate up to 15x more tokens than standard chat models because they constantly resend history, tool outputs, and reasoning steps. This leads to massive latency and cost issues when using traditional, large reasoning models. Nemotron 3 Super addresses these challenges with three core architectural innovations:

### 1. [LatentMoE](../concepts/latent-moe.md) (Latent Mixture of Experts)
Instead of running routed experts on the model's full hidden representation, LatentMoE compresses the token payloads into a smaller latent space before dispatching them to the experts. This drastically reduces the memory movement and communication bottlenecks that plague standard **[Mixture of Experts (MoE)](../concepts/mixture-of-experts.md)** models during serving, allowing the model to call 4x as many expert specialists for the same inference cost.

### 2. [Multi-Token Prediction (MTP)](../concepts/multi-token-prediction.md)
Nemotron 3 Super predicts multiple future tokens in a single forward pass. By acting as its own drafter, the model dramatically accelerates text generation speed, especially for the verbose output required during long-context reasoning tasks and tool calling.

### 3. Hybrid Mamba-2 & Attention
To handle the "context explosion" of multi-agent workflows, the model uses interleaved **Mamba-2** layers alongside traditional Attention layers. This hybrid approach enables a native 1M-token context window without the crushing VRAM overhead of a standard KV cache, giving agents long-term memory for aligned, high-accuracy reasoning without goal drift.

---

## Real-World Application & Who Should Care

### 🚀 The Performance Monsters (SOTA Seekers)
**Why you care:** If you are building complex multi-agent applications (like software development swarms or cybersecurity triaging), Nemotron 3 Super provides the specialized depth and long-context alignment needed for autonomous problem-solving.
**Action:** Deploy the open-weights model locally (e.g., via Ollama or NVIDIA NIM) using 2x H100-80GB GPUs. Enable its native reasoning mode (`enable_thinking=True`) to leverage its long-horizon planning capabilities.

### 💰 The Cost & Latency Optimizers (API Developers)
**Why you care:** The combination of LatentMoE and MTP delivers over 5x the throughput of the previous Nemotron Super iteration. You can run massive agentic workflows continuously without paying the typical "thinking tax" associated with dense reasoning models.
**Action:** Use Nemotron 3 Super for high-volume background tasks, such as automated IT ticket resolution or data extraction from massive documents, where cost-per-token and Time-Between-Tokens (TBT) are critical.

### 💻 The Everyday Prompt Engineers
**Why you care:** While designed for agents, the model's high throughput and open nature mean it will likely power many of the free or low-cost reasoning tiers in consumer AI tools.
**Action:** When using Nemotron 3 Super via chat interfaces, take advantage of its 1M context window by feeding it entire codebases or extensive documentation; its Mamba-2 backbone ensures it retains that context over long sessions.

---

## References
*   [Introducing Nemotron 3 Super (NVIDIA Technical Blog)](https://developer.nvidia.com/blog/introducing-nemotron-3-super-an-open-hybrid-mamba-transformer-moe-for-agentic-reasoning/)
*   [NVIDIA Debuts Nemotron 3 Family of Open Models](https://nvidianews.nvidia.com/news/nvidia-debuts-nemotron-3-family-of-open-models)
*   [nvidia/NVIDIA-Nemotron-3-Super-120B-A12B-FP8 on Hugging Face](https://huggingface.co/nvidia/NVIDIA-Nemotron-3-Super-120B-A12B-FP8)
