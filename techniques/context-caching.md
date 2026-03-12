# Context Caching: The Cost-Cutting Superpower for Long-Context AI

## TL;DR
**Context Caching** is a technique that allows developers to store (cache) the processed state (**[KV Cache](../concepts/paged-attention.md)**) of a large prompt prefix—such as a system instruction, a long document, or a codebase—and reuse it across multiple API calls. Instead of paying to re-process the same 50,000 tokens for every user request, you only pay once to cache it, and then pay a heavily discounted rate (often 50-90% off) for subsequent hits.

---

## How It Works: Static vs. Dynamic Prompts

In a typical LLM call, the prompt is processed from scratch every time. With Context Caching, you split your prompt into two parts:

1.  **Static Prefix (Cached):** The part that doesn't change.
    *   *Examples:* A 100-page policy document, a "persona" definition for a role-playing bot, or a large set of few-shot examples.
2.  **Dynamic Suffix (User Query):** The part that is unique to each request.
    *   *Examples:* "Summarize section 3," "Does this policy cover flood damage?", or "Translate this sentence."

When a request comes in, the API checks if the static prefix is already in the cache (hit). If so, it skips processing those tokens entirely, saving both **compute (latency)** and **money**.

---

## Supported Providers & Pricing Models (Typical)

Most major providers now support some form of context caching:
*   **Anthropic (Claude 3.5 Sonnet/Haiku):** explicitly marks "cache breakpoints." ~90% discount on cache hits.
*   **OpenAI (GPT-4o, o1, o3-mini):** automatic caching for recent requests. ~50% discount on cache hits.
*   **Google (Gemini 1.5 Pro/Flash):** explicit context caching API. Huge savings for million-token contexts.
*   **DeepSeek (V3/R1):** automatic prefix caching at the API level (DiskCache). Extremely low cost for hits.

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
Latency is key.
*   **Interactive Agents:** If your agent has a 50k-token "memory" or "instruction manual," caching it means the user doesn't have to wait 10 seconds for the model to re-read it every turn. Responses feel instant.
*   **Coding Assistants:** Cache the entire repository structure so the model understands the full project context without re-ingesting it for every small code change.

### 💰 For The Cost & Latency Optimizers (API Developers)
This is mandatory for production RAG systems.
*   **RAG Optimization:** Instead of retrieving small chunks, you can cache a larger set of relevant documents.
*   **Few-Shot Prompting:** You can now afford to include 100+ examples in your prompt (which massively improves quality) because you only pay for them once, not every call.

### 🧑‍💻 For The Everyday Prompt Engineers
While mostly an API feature, understanding it helps you design better system prompts.
*   **Front-Load Context:** Put all your heavy instructions, rules, and reference material at the *start* of the conversation. This maximizes the chance that the system can cache that block.
*   **Structure Matters:** Keep your system prompts stable. Changing even one character in the prefix breaks the cache for everyone.

---

## References
*   [Anthropic Prompt Caching Guide](https://docs.anthropic.com/en/docs/build-with-claude/prompt-caching) - Detailed implementation guide.
*   [Retrieval-Augmented Generation (RAG)](../concepts/retrieval-augmented-generation.md) - Context caching is a powerful alternative or companion to RAG.
