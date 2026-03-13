# cleveres-ai
A smart knowledge base about artificial intelligence.

## Frontier Models
*   [Grok 3: The Age of Reasoning Agents](models/grok-3.md) - *xAI's newest frontier model focusing on test-time compute and advanced mathematical reasoning.*
*   [GLM-5: The 744B Frontier MoE Model](models/glm-5.md) - *Zhipu AI's flagship open-weights model featuring DeepSeek Sparse Attention and asynchronous RL for complex agentic tasks.*
*   [Claude 3.7 Sonnet: The Hybrid Reasoning Engine](models/claude-3-7-sonnet.md) - *Anthropic's hybrid model that toggles between instant responses and extended thinking.*
*   [Wan 2.1: The Open-Source Video Generator](models/wan-2-1.md) - *Alibaba's 14B parameter video generation model with advanced motion control.*
*   [Qwen 2.5-VL: The Vision-Language Flagship](models/qwen-2-5-vl.md) - *A multimodal model for native dynamic resolution, long-video comprehension, and visual agent tasks.*
*   [DeepSeek-R1: The Open-Source Reasoning Champion](models/deepseek-r1.md) - *The first open-weights model to rival o1 using Pure RL.*
*   [DeepSeek-V3: The Open-Source Titan Behind R1](models/deepseek-v3.md) - *The 671B MoE base model for R1 with innovative MLA and DeepSeekMoE.*
*   [DeepSeek-V3.2: The Sparse Attention Evolution](models/deepseek-v3-2.md) - *The 685B model that introduces DeepSeek Sparse Attention (DSA) for efficient long-context processing.*
*   [OpenAI o3-mini: High-Speed Reasoning for the Masses](models/o3-mini.md) - *A fast, cost-efficient reasoning model tailored for STEM and coding tasks.*

## Frontier Research & Papers
*   [FlashAttention-4: Adapting to Asymmetric Hardware Scaling](papers/flash-attention-4.md) - *Algorithm and Kernel Pipelining Co-Design to handle shifting bottlenecks in Blackwell (B200) architectures.*
*   [AReaL: Asynchronous Reinforcement Learning](papers/areal.md) - *A fully asynchronous RL system decoupling generation from training to maximize GPU utilization.*
*   [Agent-as-a-Judge: Evaluate Agents with Agents](papers/agent-as-a-judge.md) - *Evaluating autonomous agents by using other agents to verify their process.*

## Core Concepts & Architecture
*   [Reinforcement Learning from Human Feedback (RLHF)](concepts/rlhf.md) - *A technique to align an intelligent agent with human preferences by training a reward model to score responses and optimize the policy.*
*   [Direct Preference Optimization (DPO)](concepts/direct-preference-optimization.md) - *A lightweight alternative to RLHF that turns the language model itself into a reward model via contrastive pairs.*
*   [Group Relative Policy Optimization (GRPO): Efficient Reinforcement Learning](concepts/group-relative-policy-optimization.md) - *Streamlining RL by eliminating the value model and using group-based reward baselines.*
*   [Low-Rank Adaptation (LoRA): Efficient Fine-Tuning](concepts/low-rank-adaptation.md) - *Fine-tuning massive models efficiently by injecting small, trainable rank decomposition matrices.*
*   [Grouped-Query Attention (GQA)](concepts/grouped-query-attention.md) - *An optimization technique that balances the efficiency of Multi-Query Attention with the performance of Multi-Head Attention.*
*   [Retrieval-Augmented Generation (RAG): Bridging Knowledge and Generation](concepts/retrieval-augmented-generation.md) - *Reducing hallucinations by grounding model outputs in external data.*
*   [Transformer Architecture: The Engine of Modern AI](concepts/transformer-architecture.md) - *The core mechanism behind GPT, BERT, and most modern LLMs using Self-Attention.*
*   [Chain-of-Thought (CoT): Eliciting Reasoning in LLMs](concepts/chain-of-thought.md) - *How models solve complex problems by "thinking" before speaking.*
*   [Mixture of Experts (MoE): Scaling Parameters Without Scaling Costs](concepts/mixture-of-experts.md) - *How models like Mixtral and DeepSeek scale efficiently.*
*   [Inference-Time Compute: The New Scaling Law](concepts/inference-time-compute.md) - *Shift from training-time scale to test-time reasoning (System 2 thinking).*
*   [Rotary Position Embedding (RoPE)](concepts/rotary-position-embedding.md) - *Injecting relative positional information by mathematically rotating token embeddings in space.*
*   [Quantization: Shrinking Models for the Real World](concepts/quantization.md) - *Reducing model weights to lower precision formats (e.g., INT4) to drastically cut VRAM requirements with minimal accuracy loss.*
*   [FlashAttention: IO-Aware Exact Attention](concepts/flash-attention.md) - *A memory-efficient algorithm that reduces HBM/SRAM access overhead, turning quadratic memory complexity into linear.*
*   [Multi-Head Latent Attention (MLA): Compressing the KV Cache](concepts/multi-head-latent-attention.md) - *A low-rank factorization technique that shrinks KV cache size drastically, enabling longer context sizes and faster inference in DeepSeek models.*
*   [Ring Attention: Near-Infinite Context through Distributed Compute](concepts/ring-attention.md) - *A blockwise attention technique that scales context sizes linearly with the number of GPUs by forming a logical ring to overlap computation and communication.*

## Prompt Engineering Techniques
*   [Context Caching: The Cost-Cutting Superpower](techniques/context-caching.md) - *Reducing cost and latency by reusing the KV cache for large prompts.*
*   [Double Question Prompting: Overcoming Causal LLM Limitations](techniques/double-question-prompting.md)
*   [Speculative Decoding](techniques/speculative-decoding.md) - *Accelerating LLM inference by pairing a small draft model with a larger verification model.*

## Telegram
* [CleveresTech Telegram Group](t.me/cleverestech)

## Tools & Protocols
*   [Model Context Protocol (MCP): The USB-C for AI](concepts/model-context-protocol.md) - *Standardizing how AI models connect to data and tools, with Context7 as a prime example.*
