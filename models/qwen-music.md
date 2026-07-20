# Qwen-Music Technical Report

**Category:** Frontier / Models
**Key Concepts:** Text-to-Music Generation, Cover Song Generation, Music Semantic Tokens, Melody-CoT, Autoregressive Modeling, Direct Preference Optimization (DPO)

## TL;DR
Qwen-Music is a powerful autoregressive model for high-fidelity music generation capable of producing complete vocal songs. It supports text-to-music generation from descriptions and lyrics, as well as cover song generation that reinterprets existing music with different styles. The architecture combines a discrete music tokenizer, a central LLM employing a novel melody-token-based chain-of-thought (Melody-CoT) mechanism to plan melodies before full generation, and a generative stereo renderer to enrich acoustic details. Trained on over 5 million hours of multilingual data, it leverages quality-aware pre-training and progressive post-training (including supervised initialization, offline DPO, and online GSPO) to achieve state-of-the-art results across numerous objective metrics and human evaluations.

## How Qwen-Music Works

The system integrates three core components to address the challenges of generating musical, high-fidelity audio from text and reference tracks:

1. **Qwen-Music-Tokenizer:**
   This component compresses audio into a 25 Hz single-codebook stream of Music Semantic Tokens. These discrete tokens are designed to preserve essential semantic and melodic information while providing a compact representation suitable for large language model prediction.

2. **Qwen-Music-LLM and Melody-CoT:**
   Acting as the central intelligence, the LLM performs autoregressive music semantic modeling based on the tokenizer's output. A key innovation is **Melody-CoT**, which functions similarly to [Chain-of-Thought (CoT): Eliciting Reasoning in LLMs](../concepts/chain-of-thought.md). Instead of text reasoning, Melody-CoT plans out the melodies *before* engaging in full-song generation. This structural planning improves creativity, musicality, coherence, and allows for accurate melody cloning when using reference audio for cover song generation.

3. **Qwen-Music-Render:**
   Since discrete semantic tokens often lack fine acoustic details, the renderer performs generative stereo rendering. This step overcomes fidelity limitations by enriching the generated semantics with high-fidelity stereo waveforms.

## Training Pipeline
The model is trained on a massive dataset of over 5 million hours of multilingual music. The training follows a sophisticated pipeline:
*   **Pre-training:** Uses a quality-aware curriculum to establish foundational capabilities.
*   **Progressive Post-training:** To improve instruction-following and musicality, post-training includes supervised initialization, offline Direct Preference Optimization (DPO), and online Group-Relative Self-Distillation Policy Optimization (GSPO).

## Real-World Application & Who Should Care

### 🚀 The Performance Monsters (SOTA Seekers)
For researchers and AI music enthusiasts pushing the boundaries of generative audio, Qwen-Music sets a new bar. Achieving state-of-the-art results in 13 out of 16 objective musicality and audio-quality metrics, its Melody-CoT mechanism ensures structural coherence that many previous autoregressive music models struggle to maintain over long generations. The model is highly effective for accurate reference melody preservation during cover song generation.

### 💰 The Cost & Latency Optimizers (API Developers)
API providers offering music generation services can benefit from the architectural efficiency of Qwen-Music. By compressing audio into a 25 Hz single-codebook stream, the autoregressive modeling overhead is managed effectively. The clear separation between semantic generation (LLM) and acoustic upsampling (Renderer) provides opportunities for optimized inference pipelines where the heavy lifting is distinct from high-fidelity rendering.

### 🧑‍💻 The Everyday Prompt Engineers
For creators using interfaces to generate songs, Qwen-Music offers powerful control. You can provide text descriptions, lyrics, and musical attributes to create entirely new tracks with complete vocal singing. Additionally, its cover song generation capability means you can upload an existing song and ask the model to reinterpret it in entirely different styles or with new vocal characteristics, knowing the underlying melody will remain faithful to the original.

---

## References
* [Qwen-Music Technical Report](https://arxiv.org/abs/2607.11699)
