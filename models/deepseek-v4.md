# DeepSeek-V4: The Next Generation

**Category:** Frontier / Models
**Key Concepts:** Fast Inference, Caching, Pro & Flash Variants

## TL;DR
DeepSeek-V4 is the next generation of frontier models from DeepSeek, revealed via their API documentation. The rollout introduces two distinct variants: **DeepSeek-V4-Pro** and **DeepSeek-V4-Flash**. These models natively support both standard generation and "thinking" mode, unifying the capabilities previously split between models like [DeepSeek-V3](deepseek-v3.md) and [DeepSeek-R1](deepseek-r1.md). A significant focus of V4 is maintaining DeepSeek's notoriously low API pricing, with aggressive discounts for context cache hits.

---

## Model Variants and Pricing Strategy

The V4 API exposes two endpoints, both sporting a massive 1M token context window and a 384K maximum output limit. Crucially, the "thinking mode" is available directly via the API for both variants. The model names `deepseek-chat` and `deepseek-reasoner` will be deprecated in favor of `deepseek-v4-flash` (with thinking disabled/enabled).

### 1. DeepSeek-V4-Pro
The "Pro" variant is designed for maximum capability and complex reasoning.
*   **Cache Miss Input:** $1.74 / 1M tokens
*   **Cache Hit Input:** $0.145 / 1M tokens (a 91% discount)
*   **Output:** $3.48 / 1M tokens

### 2. DeepSeek-V4-Flash
The "Flash" variant is optimized for extreme speed and low cost, likely utilizing a smaller parameter count or more aggressive architectural optimizations while retaining the ability to engage the thinking mode.
*   **Cache Miss Input:** $0.14 / 1M tokens
*   **Cache Hit Input:** $0.028 / 1M tokens (an 80% discount)
*   **Output:** $0.28 / 1M tokens

### Unified Capabilities
Both models support:
*   **Thinking Mode:** Can be toggled on or off directly in the API call.
*   **JSON Output:** Ensuring structured generation.
*   **Tool Calls:** Native support for agentic workflows.
*   **Chat Prefix Completion & FIM:** Currently in Beta (non-thinking mode only).

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
**Why you care:** DeepSeek-V4-Pro integrates the deep reasoning capabilities of [DeepSeek-R1](deepseek-r1.md) with a massive 1M context window and natively supported tool use.
**Action:** Use V4-Pro for highly complex, multi-step agentic tasks, particularly those requiring analysis of massive codebases or entire books, taking advantage of the integrated thinking mode and tool calling.

### 💰 For The Cost & Latency Optimizers (API Developers)
**Why you care:** The pricing structure heavily favors applications that can reuse context.
**Action:** The V4-Flash model is absurdly cheap ($0.28/M output). Combined with the massive cache hit discount ($0.028/M input), it becomes the go-to model for high-volume tasks like log analysis, bulk data extraction, or continuous conversational agents where the system prompt and history are consistently cached.

### 💻 For The Everyday Prompt Engineers
**Why you care:** The unification of standard and reasoning models simplifies prompt engineering. You no longer have to choose between a "chat" model and a "reasoner" model beforehand.
**Action:** You can now build workflows that use a single model API, toggling the `thinking` parameter on only for the specific prompts that require deep logical breakdowns, saving time and money on simpler queries.

---

## References
*   [DeepSeek API Docs - Models & Pricing](https://api-docs.deepseek.com/quick_start/pricing)

See also: [DeepSeek-V3](deepseek-v3.md), [DeepSeek-R1](deepseek-r1.md)
