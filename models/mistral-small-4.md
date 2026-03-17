# Mistral Small 4: The Unified MoE Model

**Category:** Frontier / Models
**Date:** March 2025 (Trending)

## TL;DR
Mistral Small 4 is a major release from Mistral AI that unifies the capabilities of their flagship models into a single, versatile package. It combines reasoning (Magistral), multimodal tasks (Pixtral), and agentic coding (Devstral). Released under the Apache 2.0 license, it features a 119B parameter Mixture of Experts (MoE) architecture with a 256k context window, configurable reasoning effort, and significant performance improvements over its predecessor, Mistral Small 3.

***

## Key Features & Architecture

*   **Unified Capabilities:** Small 4 eliminates the need to switch between specialized models. It acts as a fast instruct model, a powerful reasoning engine, and a multimodal assistant natively accepting both text and image inputs.
*   **MoE Architecture:** The model utilizes a Mixture of Experts design with 128 experts, where 4 are active per token. It has 119B total parameters, but only 6B active parameters per token (8B including embedding and output layers), enabling highly efficient scaling and specialization.
*   **Configurable Reasoning Effort:** Users can toggle between fast, low-latency responses (`reasoning_effort="none"`) and deep, reasoning-intensive outputs (`reasoning_effort="high"`).
*   **Performance Leap:** Compared to Mistral Small 3, this model offers a 40% reduction in end-to-end completion time in latency-optimized setups, and 3x more requests per second in throughput-optimized setups.
*   **Massive Context Window:** The 256k context window allows for extensive document analysis and long-form interactions.
*   **Open Source Commitment:** Released under the Apache 2.0 license, making it fully open, accessible, and customizable for specialized tasks.

***

## Real-World Application & Who Should Care

### 🚀 The Performance Monsters (SOTA Seekers)
**Why you care:** Mistral Small 4 delivers deep, step-by-step reasoning for complex problems when configured with high reasoning effort. Its native multimodality and 256k context window make it a powerhouse for massive document parsing, visual analysis, and advanced agentic workflows without sacrificing precision.
**Action:** Deploy the model on recommended hardware (e.g., 4x NVIDIA HGX H100 or 2x NVIDIA DGX B200) to leverage its full reasoning capabilities and benchmark it against closed-source alternatives on complex tasks like math or coding.

### 💰 The Cost & Latency Optimizers (API Developers)
**Why you care:** The MoE architecture guarantees high efficiency, activating only a small fraction of parameters per token. This translates to lower latency and reduced operational costs. The configurable reasoning parameter lets you dynamically allocate compute only when needed, maintaining low latency for everyday tasks.
**Action:** Integrate Mistral Small 4 into your API pipelines using vLLM or SGLang, where it has been highly optimized. Route complex queries to the high-reasoning mode while keeping simple queries on the fast, low-latency mode to minimize costs.

### 💻 The Everyday Prompt Engineers
**Why you care:** You now have access to a single open-source model that excels at general chat, complex problem-solving, and image analysis. The model produces significantly shorter outputs while matching or surpassing larger models, which means you get faster answers.
**Action:** Experiment with the `reasoning_effort` parameter in your prompts. Use `none` for quick drafting and brainstorming, and switch to `high` when you need the model to think through a difficult coding problem or logic puzzle.

***

## References
*   [Mistral AI Blog: Introducing Mistral Small 4](https://mistral.ai/news/mistral-small-4)
