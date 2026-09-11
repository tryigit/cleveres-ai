# NCP-ArchPreview Technical Report: Moving towards Latent Space Language Models through Next Concept Prediction

**Category:** Frontier Research & Papers
**Date:** September 2026

## TL;DR
**NCP-ArchPreview** represents a significant step towards latent-space language models. Unlike standard models trained exclusively on next-token prediction (NTP), this architecture introduces a complementary objective: **Next Concept Prediction (NCP)**. The model builds a product-quantized concept vocabulary directly from its hidden states and learns to predict discrete, multi-token concepts. These predicted concepts are then fed back to the token level to guide subsequent token-by-token generation. Scaled to 8.9B parameters and trained on 5.73T tokens, NCP-ArchPreview matches the pretraining loss of a standard baseline (OLMo-3-7B) using only 51.3% of the tokens, and outperforms it on downstream tasks (e.g., +5.99 points on GSM8K).

## How it Works
The architecture works by integrating a latent space directly into the autoregressive loop:
1. **Concept Vocabulary:** It constructs a discrete concept vocabulary from hidden states using product quantization.
2. **Concept Prediction:** A dedicated Concept Module predicts future concepts, which span multiple tokens.
3. **Dual Objective:** The model is trained jointly end-to-end on both standard NTP and the new NCP objective.
4. **Token Guidance:** The predicted macroscopic concepts act as conditioning to guide the standard microscopic token generation.

This approach makes the pretraining objective more challenging but significantly improves sample efficiency and downstream capabilities. Furthermore, the learned latent space (a lightweight 17M-parameter VQ module) can be used for domain adaptation or injected into drafter models to improve speculative decoding acceptance rates.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
By predicting higher-level abstractions (concepts) rather than just raw tokens, researchers can build models that maintain long-horizon coherence much better. If you are building models that require structured planning, the NCP objective provides a clear path to forcing the model to "think ahead" before committing to specific tokens.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
The reported sample-efficiency result is that NCP-ArchPreview reached the reference pretraining loss using 51.3% of the baseline's pretraining tokens; this token-budget comparison does not measure total training cost. Additionally, the lightweight concept representations can be injected into speculative decoding drafters (like DFlash2), improving the mean accepted length by over 4% with minimal overhead; the report does not establish a direct end-to-end serving speedup or latency reduction.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
In the reported evaluation, NCP-ArchPreview improved GSM8K by 5.99 percentage points over the OLMo-3-7B baseline. NCP-ArchPreview is a pretrained base model without conversational alignment, so its instruction-following reliability has not been established.

## References & See Also
* [Demystifying Hidden-State Recurrence: Switchable Latent Reasoning with On-Policy Reinforcement Learning](switch-latent-reasoning.md)
* [Beyond Retrieval: Progressive Latent Memory Evolution for Streaming Video Understanding](latentstream-progressive-memory.md)
