# Multi-Token Prediction (MTP)

**Category:** Foundational / Architecture
**Key Concepts:** Next-Token Prediction, Speculative Decoding, Inference Efficiency

## TL;DR
Multi-Token Prediction (MTP) is an architectural innovation that modifies the traditional training and inference objective of Large Language Models (LLMs). Instead of predicting just the single next token, an MTP model is trained to predict multiple future tokens simultaneously in a single forward pass. This densifies training signals and allows for massive inference speedups without the complex multi-model orchestration usually required by traditional speculative decoding.

---

## The Problem: Next-Token Prediction Bottleneck
Standard LLMs are trained using the **Next-Token Prediction (NTP)** objective. Given a sequence of text, the model learns to predict what word comes next, moving forward one step at a time.
*   **Training Limit:** The model only gets feedback on its immediate next step, missing out on learning longer-term planning directly.
*   **Inference Limit:** Because it can only generate one token at a time, generation is strictly sequential and bottlenecked by memory bandwidth (loading model weights for every single token).

## How MTP Works
MTP extends the prediction scope. At each position, the model doesn't just predict token $t+1$, but also $t+2$, $t+3$, etc.

### The Architecture
A common MTP implementation, as pioneered by models like **[DeepSeek-V3](../models/deepseek-v3.md)** and adopted by **[Nemotron 3 Super](../models/nemotron-3-super.md)**, uses sequential prediction modules (heads) added on top of the main base model:
1.  **Shared Base Model:** The main Transformer processes the context and predicts the first token.
2.  **MTP Modules:** Additional shallow layers (often just a projection matrix and a Transformer block) take the base representation and sequentially predict the subsequent tokens.

During training, all these predictions are compared against the actual text, providing a richer, denser loss signal.

### MTP for Inference (Self-Speculative Decoding)
During inference, MTP acts as a built-in **[Speculative Decoding](../techniques/speculative-decoding.md)** mechanism.
*   Traditional speculative decoding uses a separate, smaller "draft" model to guess several tokens, which the large "target" model then verifies in parallel.
*   With MTP, the model acts as its own drafter. The MTP modules predict the bonus tokens, and the main model verifies them in the next step. If the predictions are correct, the model can output multiple tokens in the time it usually takes to output one.

---

## Real-World Application & Who Should Care

### 🚀 The Performance Monsters (SOTA Seekers)
**Why you care:** MTP forces models to build better internal representations of future plans during training, often leading to improved reasoning capabilities and data efficiency.
**Action:** When fine-tuning models that support MTP, leverage the MTP loss (often scaled down, e.g., 0.1) as an auxiliary training objective to improve overall model quality and robustness.

### 💰 The Cost & Latency Optimizers (API Developers)
**Why you care:** MTP brings multiplicative acceleration to inference speed. By accepting multiple tokens per forward pass, you drastically reduce the Time-Between-Tokens (TBT) and increase overall generation throughput.
**Action:** Enable MTP decoding in your serving engine (e.g., vLLM or SGLang). For example, setting `--speculative_config` with method `mtp` in vLLM allows compatible models to stream tokens much faster, reducing user latency and serving costs.

### 💻 The Everyday Prompt Engineers
**Why you care:** MTP models feel noticeably "snappier" when generating text because they are outputting chunks of words at a time rather than individual pieces.
**Action:** No specific prompting changes are needed. Enjoy the faster generation speeds when using APIs powered by MTP-enabled models.

---

## References
*   [DeepSeek-V3 Technical Report (DeepSeek, 2024)](https://github.com/deepseek-ai/DeepSeek-V3)
*   [NVIDIA Megatron Core: Multi-Token Prediction](https://docs.nvidia.com/megatron-core/developer-guide/latest/user-guide/features/multi_token_prediction.html)
