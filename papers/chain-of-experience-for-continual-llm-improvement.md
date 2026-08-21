# Chain-of-Experience for Continual LLM Improvement

## TL;DR
**Chain-of-Experience (CoE)** is a framework that allows large language models (LLMs) to continuously improve themselves beyond zero-shot inference by learning from test-time interactions. Instead of relying solely on the capabilities acquired during pre-training, CoE enables models to accumulate "experiential traces" through iterative interactions with self-generated feedback or environmental signals (like code execution results). This creates a continual improvement loop where models refine their reasoning paths, leading to higher accuracy per token than existing test-time strategies like simple re-sampling or standard self-reflection.

Traditional evaluations often ignore an LLM's capacity to adapt at inference time. CoE bridges this gap by demonstrating that leveraging iterative experience consistently outperforms feedback-free baselines. This applies across diverse domains such as math, coding, and general knowledge. The framework shows that even without external ground-truth labels, models can achieve substantial gains using self-feedback alone, reducing overall API costs while improving performance. Furthermore, CoE reveals a positive correlation between a model's foundational capabilities and its capacity to improve through experience, while remaining robust even if the feedback is weak or spurious.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For researchers and power users maximizing reasoning capability, CoE represents a significant step up in [Inference-Time Compute: The New Scaling Law (System 2 Thinking)](../concepts/inference-time-compute.md). By structuring test-time compute into an experiential loop, you can achieve higher performance ceilings on complex reasoning and coding benchmarks compared to simple prompt engineering or best-of-N sampling, especially when combining self-feedback with environmental execution signals.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
CoE offers a compelling efficiency argument: it achieves higher accuracy per token than brute-force test-time scaling strategies. The research indicates up to a 19% lower API cost across tasks and models when using CoE, because the model learns to correct its trajectory rather than blindly generating independent samples until one passes. Most gains emerge early in the iteration cycle, meaning you can cap the loop quickly to maintain latency targets while still reaping accuracy benefits.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
When using powerful models (like GPT-5 or Claude-4.5 Sonnet) via web interfaces, you can manually simulate the CoE loop. Instead of just asking for a solution and accepting it or starting over entirely, prompt the model to review its previous attempt, identify errors (or provide it the error message from your code runner), and generate a revised attempt based explicitly on that "experience." This structured iteration is fundamentally more effective than one-shot prompting for hard tasks.

## References
* [Chain-of-Experience for Continual LLM Improvement](https://arxiv.org/abs/2608.18027)