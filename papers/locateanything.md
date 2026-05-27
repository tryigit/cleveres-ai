# LocateAnything: Fast and High-Quality Vision-Language Grounding with Parallel Box Decoding

**Category:** Frontier / Research Paper
**Paper:** [LocateAnything: Fast and High-Quality Vision-Language Grounding with Parallel Box Decoding](https://arxiv.org/abs/2605.27365)
**Date:** May 2026

## TL;DR
LocateAnything is a unified generative grounding and detection framework that addresses the sequential inference bottleneck in Vision-Language Models (VLMs). Instead of generating bounding box coordinates one token at a time, it introduces Parallel Box Decoding (PBD), treating geometric elements as atomic units to decode them in a single step. Combined with a massive 138-million sample dataset, LocateAnything dramatically improves both decoding throughput and high-IoU localization accuracy.

---

## The Problem: Sequential Box Decoding
In modern Vision-Language Models, visual grounding (finding an object from a text description) and detection are typically framed as a token generation problem. A 2D bounding box is serialized into a sequence of 1D coordinate tokens (e.g., `[y_min]`, `[x_min]`, `[y_max]`, `[x_max]`).

Because autoregressive models generate these tokens strictly sequentially, it creates a massive inference bottleneck. Furthermore, decoding coordinates independently token-by-token breaks the coupled geometric structure of a bounding box, often leading to lower precision.

## The Solution: Parallel Box Decoding
LocateAnything solves this by introducing **Parallel Box Decoding (PBD)**. Similar in spirit to [Multi-Token Prediction](../concepts/multi-token-prediction.md) for text, PBD treats geometric elements (bounding boxes and points) as atomic units.

Instead of predicting four separate coordinate tokens over four forward passes, the model decodes the entire box in a single step. This approach preserves intra-box geometric coherence and unlocks substantial parallelism, pushing the speed-accuracy frontier forward.

### LocateAnything-Data
To support this high-precision architecture, the researchers curated a massive dataset containing over 138 million training samples, massively increasing the data diversity required for high-quality localization tasks.

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
For robotics, autonomous driving, and complex visual reasoning tasks, high-IoU accuracy is critical. By preserving geometric coherence through PBD and training on vast data, LocateAnything achieves significantly better localization quality across diverse benchmarks without sacrificing speed.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
The primary benefit of Parallel Box Decoding is throughput. By decoding bounding boxes in a single step rather than four sequential steps, vision-language APIs can process image analysis requests much faster, drastically reducing inference latency and compute costs per image.

💻 **THE EVERYDAY PROMPT ENGINEERS:**
While the architecture is under the hood, everyday users interacting with future multimodal models will experience much faster and more accurate "point-and-click" or "find the object" capabilities in chat interfaces, with fewer hallucinations regarding object placement.

---
**Source:** https://arxiv.org/abs/2605.27365
