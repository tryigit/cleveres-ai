# The Mirage of Optimizing Training Policies: Monotonic Inference Policies as the Real Objective for LLM Reinforcement Learning

**TL;DR:**
In large language model (LLM) post-training, reinforcement learning is often fragile due to a "training-inference mismatch" where separate engines for generation (inference) and training precision cause inconsistent trajectory probabilities. This paper identifies that an effective update to the training engine's policy does not guarantee improvement for the deployed inference policy. To solve this, researchers introduce Monotonic Inference Policy Improvement (MIPI) and a two-step framework called Monotonic Inference Policy Update (MIPU), which constructs sampler-referenced candidate updates and selectively accepts synchronized candidates using an inference-side gap proxy, ultimately improving both reasoning performance and training stability.

## Real-World Application & Who Should Care

### The Performance Monsters (SOTA Seekers)
For AI researchers and teams fine-tuning models with [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md) or [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md), MIPU provides a critical framework for avoiding policy collapse. By explicitly targeting the inference policy instead of just the training policy, developers can squeeze out higher reasoning capabilities and more stable optimization curves, especially when dealing with the high mismatch often found in large-scale setups.

### The Cost & Latency Optimizers (API Developers)
While this paper primarily targets training stability rather than direct inference latency, training a better inference policy ensures that the final model deployed behind an API performs reliably without needing excessive retry logic or oversized models to compensate for poorly aligned reasoning paths. A more stable RL phase leads to higher quality models that can be served efficiently.

### The Everyday Prompt Engineers
This technique operates strictly during the post-training phase of model development and does not directly change how you write prompts. However, models trained using MIPI/MIPU will exhibit more consistent logic and reasoning capabilities, meaning fewer "hallucinations" or logical breakdowns when answering complex queries in consumer interfaces.

## References
* [The Mirage of Optimizing Training Policies: Monotonic Inference Policies as the Real Objective for LLM Reinforcement Learning](https://huggingface.co/papers/2606.29526)
