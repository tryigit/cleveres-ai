# EXAONE 4.5: LG's Open-Weight Vision Language Model

**TL;DR:** EXAONE 4.5 is LG AI Research's first open-weight Vision Language Model (VLM). It builds on the EXAONE 4.0 framework by integrating a dedicated visual encoder, enabling native multimodal pretraining over visual and textual modalities. With a context window of up to 256K tokens and specialized document-centric training data, it excels at complex document understanding and Korean contextual reasoning.

## Overview
Released to the open-source community, EXAONE 4.5 targets enterprise-scale use cases, particularly in document understanding and extraction. Rather than just bolting a vision encoder onto a frozen language model, LG AI Research designed EXAONE 4.5 for native multimodal pretraining.

The training pipeline places a significant emphasis on high-quality, document-centric corpora that align with strategic industrial applications. This targeted data design, combined with an extended context length of up to 256K tokens, allows the model to perform long-context reasoning over extensive documents.

## Key Capabilities
*   **Native Multimodal Pretraining:** Integrates a dedicated visual encoder directly into the base framework for joint optimization over text and images.
*   **Massive Context Window:** Supports up to 256K tokens, making it ideal for processing entire books, codebases, or complex financial reports.
*   **Document-Centric Focus:** Exceptional performance in parsing, understanding, and extracting structured information from complex documents.
*   **Korean Contextual Reasoning:** Achieves state-of-the-art performance in Korean-language tasks alongside strong general English capabilities.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
For developers building massive enterprise [Retrieval-Augmented Generation (RAG)](../concepts/retrieval-augmented-generation.md) pipelines over complex, multi-page PDFs or technical manuals, EXAONE 4.5 offers a robust open-weight alternative to proprietary models. Its 256K context window means you can often ingest entire documents directly rather than relying on aggressive chunking strategies that might break semantic coherence.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
As an open-weight model, EXAONE 4.5 allows you to bring powerful document understanding in-house. If you are processing thousands of documents containing tables, figures, and dense text, running this model locally or on dedicated cloud instances can significantly reduce dependency on expensive, latency-variable external API calls (like GPT-4V or Claude Opus).

### 💻 THE EVERYDAY PROMPT ENGINEERS
When working with EXAONE 4.5, take advantage of its long context and document specialization. You can prompt it with detailed instructions to extract specific data points from highly unstructured visual documents, relying on its underlying [Transformer Architecture](../concepts/transformer-architecture.md) to maintain long-range dependencies across multiple pages of input.

## Sources
*   [EXAONE 4.5 Technical Report (arXiv)](https://arxiv.org/abs/2604.08644)
