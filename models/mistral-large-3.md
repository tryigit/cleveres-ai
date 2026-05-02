# Mistral Large 3: The 675B Multimodal MoE

**Category:** Frontier / Models
**Date:** March 2025 (Trending)

## TL;DR
**Mistral Large 3** is a state-of-the-art general-purpose **[Mixture of Experts](../concepts/mixture-of-experts.md)** model. It features a massive 675 billion total parameters, but maintains efficiency by only activating a subset of those parameters during inference. It is natively multimodal and multilingual, designed to deliver industry-leading accuracy and efficiency, particularly on hardware setups commonly owned by enterprises.

---

## Architecture & Capabilities

Mistral Large 3 uses a granular Mixture-of-Experts (MoE) architecture. This allows it to achieve frontier-class performance while remaining relatively efficient compared to dense models of similar size. It is explicitly designed to compete with models like **[DeepSeek-V3](deepseek-v3.md)** in the open-weights space.

Key capabilities include:
*   **Multimodal:** Capable of processing and analyzing image inputs alongside text.
*   **Multilingual:** Strong support for dozens of languages.
*   **Enterprise Focus:** Optimized for deployment on hardware like the NVIDIA GB200 NVL72, balancing massive parameter size with real-world deployability.

It serves as the larger sibling to the unified **[Mistral Small 4](mistral-small-4.md)**.

---

## Real-World Application & Who Should Care

**🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)**
Researchers pushing the boundaries of open-weight models will find Mistral Large 3's 675B parameters offer a formidable foundation for fine-tuning, complex reasoning tasks, and building sophisticated multimodal agents.

**💰 THE COST & LATENCY OPTIMIZERS (API Developers)**
While large, its MoE architecture means only a fraction of its parameters are active during any given inference step. For enterprises looking to host a frontier-level model on-premises, this provides a pathway to massive capability without the latency and compute costs associated with a dense 675B model.

**💻 THE EVERYDAY PROMPT ENGINEERS**
When using Mistral Large 3 via interfaces like Le Chat or various API endpoints, you can rely on its strong multilingual and multimodal capabilities. It excels at tasks requiring deep reasoning across both text and visual inputs.

---

## Sources
*   [NVIDIA Accelerated Mistral 3 Open Models Deliver Efficiency Accuracy at Any Scale](https://developer.nvidia.com/blog/nvidia-accelerated-mistral-3-open-models-deliver-efficiency-accuracy-at-any-scale/)
*   [mistralai/Mistral-Large-3-675B-Instruct-2512 - Hugging Face](https://huggingface.co/mistralai/Mistral-Large-3-675B-Instruct-2512)
*   [mistralai/Mistral-Large-3-675B-Base-2512 - Hugging Face](https://huggingface.co/mistralai/Mistral-Large-3-675B-Base-2512)
