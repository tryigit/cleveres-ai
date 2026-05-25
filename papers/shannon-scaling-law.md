# LLMs as Noisy Channels: A Shannon Perspective on Model Capacity and Scaling Laws

**Category:** Frontier / Research Paper
**Paper:** [LLMs as Noisy Channels: A Shannon Perspective on Model Capacity and Scaling Laws (Ouyang et al., 2026)](https://arxiv.org/abs/2605.23901)
**Date:** May 2026 (Trending)

## TL;DR
Existing scaling laws for Large Language Models (LLMs) often predict that performance improves monotonically as you add more compute or data. However, this fails to explain non-monotonic phenomena such as catastrophic overtraining and [Quantization](../concepts/quantization.md)-induced degradation, where performance actually drops despite increased resources. The **Shannon Scaling Law** proposes a unified theoretical framework grounded in the Shannon-Hartley theorem, modeling LLM training as information transmission over a noisy channel. It reveals a fundamental "Shannon capacity" for LLMs: if you scale model size or data without preserving a sufficient signal-to-noise ratio (SNR), the noise is amplified, causing a transition from monotonic improvement to U-shaped performance degradation.

---

## The Concept: LLMs as Communication Channels

Traditionally, Kaplan's Scaling Laws and Chinchilla Scaling Laws suggested a straightforward formula: more parameters plus more tokens equals lower loss.

However, in practice, researchers have observed "U-shaped" degradation. For instance, training a model for too long on the same data, or applying extreme quantization, can cause the model's performance to suddenly collapse.

The **Shannon Scaling Law** explains this by framing the training process as a communication problem:
*   **Channel Bandwidth:** The model's parameters (size and precision).
*   **Signal Power:** The training tokens (the useful information being learned).
*   **Intrinsic Noise:** Imperfections in data quality, quantization errors, or optimization noise.

According to the Shannon-Hartley theorem, the capacity of a channel is dictated by the Signal-to-Noise Ratio (SNR). If you try to push more signal (data) through a channel (model) that has high intrinsic noise without increasing the bandwidth (parameter capacity), the noise overwhelms the signal.

## Predicting Catastrophic Collapse

This framework explicitly captures the interaction between learning signal and intrinsic noise. It successfully predicts loss basins that prior monotonic scaling laws miss entirely.

In experiments on Pythia and OLMo2 under various perturbations (Gaussian noise, quantization, and supervised fine-tuning on math, QA, and code tasks), the Shannon Scaling Law consistently outperformed classical scaling laws. Remarkably, when fitted on smaller Pythia models ($\le$6.9B) with limited tokens ($\le$180B), it accurately extrapolated and predicted the performance of the unseen 12B model up to 307B tokens, even as monotonic baselines collapsed.

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
**Optimizing Compute Budgets.**
When pre-training or fine-tuning massive models, you can no longer assume that throwing more data or compute at the model will guarantee improvements. The Shannon Scaling Law provides a rigorous framework to calculate the exact point where [Inference-Time Compute](../concepts/inference-time-compute.md) or training-time compute yields diminishing returns or actively harms the model, allowing you to halt training before catastrophic overtraining occurs.

### 💰 For The Cost & Latency Optimizers (API Developers)
**Predicting Quantization Limits.**
If you are aggressively quantizing models to reduce API serving costs, this law is crucial. It models quantization as injected noise. By understanding the Shannon capacity of your specific model architecture, you can predict exactly how much you can quantize weights (e.g., from 8-bit down to 4-bit or lower) before hitting the U-shaped degradation cliff, saving costly trial-and-error.

### 💻 For The Everyday Prompt Engineers
*(This fundamental scaling law primarily impacts model builders and researchers rather than prompt engineering. However, understanding that a larger model isn't always strictly better if trained past its capacity helps explain why a smaller, well-tuned model might occasionally outperform a massive one on specific tasks.)*

---

**Source:**
*   [arXiv:2605.23901 - LLMs as Noisy Channels: A Shannon Perspective on Model Capacity and Scaling Laws](https://arxiv.org/abs/2605.23901)
