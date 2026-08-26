# WeMM-Embedding: WeChat Multi-Modal Embedding Technical Report

**TL;DR:** WeMM-Embedding is a family of highly capable universal multimodal embedding models developed by Tencent WeChat. Supporting arbitrary interleaved inputs of text, images, videos, and visual documents, it achieves state-of-the-art performance across multiple benchmarks and has proven its practical value via massive-scale deployment across WeChat's ecosystem.

## The Core Concept: Universal Representation

Modern AI architectures, especially agentic systems and [Retrieval-Augmented Generation (RAG): Bridging Knowledge and Generation](../concepts/retrieval-augmented-generation.md) pipelines, require heterogeneous content (a mix of text, images, and video) to be represented in a single shared mathematical space.

WeMM-Embedding achieves this universality through a family of models (2B, 4B, and 9B variants) that support flexible output dimensions. This allows a single model to handle retrieval, recommendation, and classification tasks across wildly different data modalities.

## Training Architecture

The WeMM-Embedding family is trained in two distinct stages to balance broad alignment with precise task performance:

1.  **Large-Scale Multimodal Alignment Stage:** The models are first exposed to massive amounts of raw, uncurated data to establish a fundamental shared understanding between modalities (e.g., learning that an image of a dog and the word "dog" occupy the same semantic space).
2.  **Refinement Stage:** The models are then fine-tuned using curated data, fine-grained relevance supervision, and cross-scale knowledge transfer. This ensures that the embeddings are not just conceptually similar, but mathematically optimized for specific tasks like high-precision search and recommendation.

## Performance & Real-World Deployment (August 2026)

WeMM-Embedding is not just an academic exercise; it is a heavily battle-tested production system.

*   **Public Benchmarks:** The 9B variant achieves a new state-of-the-art overall score of 80.6 on MMEB-v2. Remarkably, even the 2B variant surpasses previously leading 8B open-source baselines.
*   **Production Deployment:** It has demonstrated substantial gains on a 26-task in-house benchmark and consistent improvements across 14 online A/B tests.
*   **Scale:** It is currently deployed at scale across WeChat Channels, Official Accounts, Moments, and e-commerce services, handling billions of transactions and queries.

## Real-World Application & Who Should Care

### (Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For researchers building complex agentic systems that must dynamically perceive text, images, and video in real-time, the 9B variant provides a state-of-the-art foundation. The ability to handle arbitrarily interleaved inputs means you don't need separate embedding models for different modalities, dramatically simplifying the architecture of multimodal RAG pipelines.

### (Money) THE COST & LATENCY OPTIMIZERS (API Developers):
The 2B variant is the star here. Because it outperforms previous 8B open-source models, developers can achieve leading accuracy with a fraction of the VRAM and compute overhead. The flexible output dimensions also allow engineers to dynamically shrink the embedding size (reducing vector database storage and query costs) while maintaining acceptable relevance.

### (Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
While you don't directly prompt an embedding model, WeMM-Embedding is the engine powering the background search capabilities in consumer apps like WeChat. Better multimodal embeddings mean that when you search for "that video of a cat wearing a hat I saw last week" using text, the system can actually understand the visual content of the videos and find the exact clip, rather than relying on the video having a descriptive title.

## References
*   [WeMM-Embedding: WeChat Multi-Modal Embedding Technical Report](https://arxiv.org/abs/2608.24053)
*   [GitHub Repository (Tencent/WeMM-Embedding)](https://github.com/Tencent/WeMM-Embedding)
