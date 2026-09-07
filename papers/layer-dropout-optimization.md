# Don't Drop Dropout: Optimizing Layer Sparsity for Efficient LLM Training and Inference

## TL;DR
Layer dropout (stochastic depth) has largely fallen out of favor in modern large language model (LLM) pre-training, despite its success in earlier architectures. This paper comprehensively re-evaluates layer dropout across extensive scales (up to 8.2B parameters and 160B tokens), proving that it remains a highly effective optimization technique. By properly tuning layer distribution and schedules, applying layer dropout yields lower or equal validation loss while saving up to 25% of training FLOPs. Furthermore, models trained with layer dropout are inherently robust to post-training optimizations like early exit and intermediate-layer skipping, unlocking up to 1.5x inference speedups with negligible accuracy drops.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For organizations pre-training foundational LLMs, re-integrating layer dropout into the training pipeline provides a significant compute advantage. Saving 25% of training FLOPs allows you to train longer on more tokens or scale up model size within the same fixed budget, achieving a better compute-optimal frontier.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
Models pre-trained with layer dropout natively support zero-shot dynamic inference techniques like early exit and layer skipping without requiring distillation or retraining. Post-training early-exit adapters, by contrast, require self-distillation or training. This allows developers to serve the same model at varying latency tiers or drastically speed up inference (up to 1.5x) for simpler queries.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
Not Immediately Applicable. This is a foundational training and inference optimization technique. However, it means that future models you interact with may be trained more efficiently and respond much faster, particularly for straightforward queries that leverage early exiting.

See also: [From Layers to Submodules: Rethinking Granularity in Replacement-Based LLM Compression](subfit-submodule-replacement-compression.md)

## References
* [Don't Drop Dropout: Optimizing Layer Sparsity for Efficient LLM Training and Inference](https://arxiv.org/abs/2609.05275)
