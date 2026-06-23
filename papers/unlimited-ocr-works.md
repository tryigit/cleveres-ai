# Unlimited OCR Works

## TL;DR
Recent end-to-end OCR models (like DeepSeek OCR) use a Large Language Model (LLM) as the decoder to leverage language priors, significantly improving OCR performance. However, during long-horizon copying tasks, the accumulated KV cache drives up memory consumption and slows down generation, unlike humans who don't suffer this efficiency decline. "Unlimited OCR" solves this by replacing all attention layers in the decoder with Reference Sliding Window Attention (R-SWA). This new attention mechanism reduces computation costs and maintains a strictly constant KV cache size throughout the entire decoding process, allowing the model to transcribe dozens of document pages in a single forward pass without degrading speed.

---

## The Bottleneck in LLM-Based OCR

Standard LLM decoders process information autoregressively, storing previous token representations in the KV Cache.
*   **The Problem:** For extremely long parsing tasks (like transcribing 50 pages of a PDF), this cache grows linearly. Eventually, memory usage skyrockets, and generation slows to a crawl.
*   **The Solution (Unlimited OCR):** By combining a highly compressed encoder with the novel Reference Sliding Window Attention (R-SWA) in the decoder, the KV cache size remains constant regardless of output length.
*   **General Purpose:** R-SWA is not just for OCR; it's a general-purpose parsing attention mechanism applicable to Automatic Speech Recognition (ASR) and long-form translation.

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
If you are building multi-modal parsing systems, Unlimited OCR's R-SWA allows you to handle massive documents (e.g., full books or extensive financial reports) in a single forward pass under a standard maximum length of 32K, overcoming the traditional limits of autoregressive memory consumption in parsing tasks.

### 💰 For The Cost & Latency Optimizers (API Developers)
Maintaining a constant KV cache is a massive win for inference efficiency. Unlike standard models where cost and latency balloon as the generation lengthens, R-SWA ensures predictable, stable memory usage and throughput, drastically lowering the compute costs associated with long-document parsing APIs. This provides an architectural alternative to explicit [Context Caching: The Cost-Cutting Superpower for Long-Context AI](../techniques/context-caching.md) for parsing-specific tasks.

### 🧑‍💻 For The Everyday Prompt Engineers
When using next-generation OCR tools built on architectures like this, you will be able to upload much larger PDFs or image batches and receive full transcriptions significantly faster and without the typical mid-generation slowdowns seen in standard LLM web interfaces.

---

## References
*   [Unlimited OCR Works (arXiv:2606.23050)](https://arxiv.org/abs/2606.23050)
*   [GitHub Repository](http://github.com/baidu/Unlimited-OCR)
