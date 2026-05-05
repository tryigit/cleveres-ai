# Qwen3-Omni: The Natively End-to-End Multilingual Omni-Modal Foundation Model

**Category:** Frontier / Models
**Release:** March 2025

## TL;DR
Qwen3-Omni is Alibaba Cloud's natively end-to-end multilingual omni-modal foundation model. Designed to process diverse inputs, including text, images, audio, and video, it delivers real-time streaming responses in both text and natural speech. It maintains state-of-the-art performance across modalities while introducing novel architectural upgrades like an MoE-based Thinker-Talker design.

## Key Features

### 1. State-of-the-Art Across Modalities
Qwen3-Omni's early text-first pretraining and mixed multimodal training provide native multimodal support. It achieves state-of-the-art results on 22 of 36 audio/video benchmarks and open-source SOTA on 32 of 36. Its ASR, audio understanding, and voice conversation performance is comparable to proprietary models like Gemini 2.5 Pro. Crucially, unimodal text and image performance does not regress when expanding to omni-modal capabilities.

### 2. Massive Multilingual Support
The model is highly multilingual, supporting:
*   **119 Text Languages**
*   **19 Speech Input Languages:** Including English, Chinese, Korean, Japanese, German, Russian, Italian, French, Spanish, Portuguese, Malay, Dutch, Indonesian, Turkish, Vietnamese, Cantonese, Arabic, and Urdu.
*   **10 Speech Output Languages:** English, Chinese, French, German, Russian, Italian, Spanish, Portuguese, Japanese, and Korean.

### 3. Novel Architecture
Qwen3-Omni introduces an MoE-based Thinker-Talker design with AuT pretraining for strong general representations. Combined with a multi-codebook design, this architecture minimizes latency while maintaining high reasoning capabilities.

### 4. Real-Time Interaction
The model offers low-latency streaming with natural turn-taking and immediate text or speech responses, ideal for real-time applications.

## Real-World Application & Who Should Care

**🚀 THE PERFORMANCE MONSTERS (SOTA Seekers):**
Researchers building advanced multimodal agents can leverage Qwen3-Omni's SOTA audio/video capabilities and MoE architecture. Its ability to process text, image, audio, and video natively without performance regression in text/image makes it a powerful engine for complex, multi-sensory reasoning tasks.

**💰 THE COST & LATENCY OPTIMIZERS (API Developers):**
Engineers building real-time voice or multimodal APIs will benefit from the MoE-based Thinker-Talker architecture and multi-codebook design, which explicitly drive latency to a minimum while maintaining high quality, allowing for efficient scaling of streaming applications.

**💻 THE EVERYDAY PROMPT ENGINEERS:**
Users working with video and audio can now input varied multimodal data and receive natural, streaming speech or text responses. Its massive multilingual support (19 speech input, 10 speech output languages) enables seamless cross-lingual voice interactions and translations out of the box.

## Sources
*   [Qwen3-Omni GitHub](https://github.com/QwenLM/Qwen3-Omni)
*   [Hugging Face Collection](https://huggingface.co/collections/Qwen/qwen3-omni-68d100a86cd0906843ceccbe)

See also: [Mixture of Experts (MoE)](../concepts/mixture-of-experts.md)
See also: [Qwen 2.5-VL](qwen-2-5-vl.md)
