# OpenThoughts-Agent: Data Recipes for Agentic Models

## TL;DR
The OpenThoughts-Agent (OT-Agent) project provides a fully open data curation pipeline for training agentic models. While agentic LLMs are expanding AI applications, little has been publicly known about curating training data for broadly capable agents, as existing efforts usually target single benchmarks. Through over 100 controlled ablation experiments, the project systematically investigates each pipeline stage, revealing the importance of task sources and diversity. Fine-tuning Qwen3-32B on their assembled 100K training set yielded an average accuracy of 44.8% across seven agentic benchmarks, improving upon the strongest existing open data agentic model (Nemotron-Terminal-32B at 40.9%). The data exhibits strong scaling properties, and the pipeline, data, and models have been publicly released.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
Open-source researchers and foundation model builders can utilize the publicly released 100K training set and data curation pipeline to train state-of-the-art agentic models. The strong scaling properties of this dataset mean that as you scale up compute and model size, you can expect predictable and robust performance gains across diverse agentic benchmarks.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
By leveraging open-source agentic models fine-tuned on diverse, high-quality data like OT-Agent, API developers can run highly capable agents locally or on cheaper infrastructure instead of relying exclusively on expensive, proprietary frontier models.

### 💻 THE EVERYDAY PROMPT ENGINEERS
This doesn't directly change your prompt writing, but it highlights an important trend: open-source models are getting much better at generalized agentic tasks. As models trained on data recipes like this become available in your tools, you'll find they need less explicit hand-holding and structure to successfully execute multi-step operations.

## See also
* [Chain-of-Thought (CoT): Eliciting Reasoning in LLMs](../concepts/chain-of-thought.md)
* [NatureBench: Can Coding Agents Match the Published SOTA of Nature-Family Papers?](naturebench.md)

## References
* [OpenThoughts-Agent: Data Recipes for Agentic Models](https://arxiv.org/abs/2606.24855)
