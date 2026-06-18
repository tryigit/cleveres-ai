# Sumi: Open Uniform Diffusion Language Model from Scratch

## TL;DR
Sumi ("ink" in Japanese) is a fully open 7B parameter Uniform Diffusion Language Model (UDLM) pretrained from scratch on 1.5T tokens. While autoregressive models and masked diffusion models already exist at scale, Sumi provides a clean reference point for studying the scaling behavior, generation dynamics, and trade-offs of native uniform diffusion. It performs competitively with autoregressive models on knowledge, reasoning, and coding benchmarks, demonstrating the viability of this approach at scale.

## Background: The Shift to Uniform Diffusion
Diffusion models have emerged as a promising alternative to the dominant autoregressive paradigm. However, the space is divided:
1.  **Autoregressive Models**: Generate text strictly token-by-token (left-to-right).
2.  **Masked Diffusion Models**: Diffuse information over discrete tokens, often fixing some while predicting others.
3.  **Uniform Diffusion Language Models (UDLMs)**: Permit any token to be updated at any step during generation.

Until Sumi, no UDLM had been pretrained from scratch at both a large parameter scale (7B) and a large token budget (1.5T). The community lacked a comparable reference point to established models in the other two categories.

Sumi fills this gap. It provides a foundational model to study how native uniform diffusion behaves dynamically when generating text, how it scales, and how it can be controlled, while avoiding the limitations of left-to-right generation. Sumi utilizes the [Transformer Architecture: The Engine of Modern AI](../concepts/transformer-architecture.md) at its core, similar to other diffusion text models like [Looped Diffusion Language Models](../papers/looped-diffusion-language-models.md).

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
**A New Playground for Generation Dynamics.** If you are researching alternative generation paradigms, Sumi provides a fully open 7B baseline. Because UDLMs allow any token to update at any step, they offer unique opportunities for non-causal generation, structured text completion, and iterative refinement that are impossible with standard autoregressive models.

### 💰 For The Cost & Latency Optimizers (API Developers)
**Scaling Diffusion Efficiency.** While Sumi is a research baseline, its release opens the door for the community to optimize uniform diffusion at scale. API developers should watch this space: if techniques to compress or accelerate the diffusion steps mature, UDLMs could offer highly parallelized text generation, potentially reducing latency for massive structured outputs.

### 💻 For The Everyday Prompt Engineers
**No Immediate Changes.** Sumi is a foundational research model exploring a new underlying generation architecture. It does not currently change how you interact with commercial chatbots like ChatGPT or Claude. You can continue using standard prompting techniques.

## References
* [Sumi: Open Uniform Diffusion Language Model from Scratch (arXiv)](https://arxiv.org/abs/2606.19005)
