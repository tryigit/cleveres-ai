# CrossMath: Modality Gap in VLM Reasoning

## TL;DR
Recent findings from the CrossMath benchmark reveal a significant **modality gap** in Vision-Language Models (VLMs). Despite their impressive multi-modal capabilities, VLMs primarily rely on their textual reasoning pathways rather than genuine visual evidence. In many cases, adding images to a text prompt can actually degrade reasoning performance compared to providing the text alone. Fine-tuning models directly on controlled multi-modal reasoning datasets can help mitigate this gap and improve overall joint reasoning.

## The Modality Gap: Seeing Without Reasoning
There is an assumption that when a VLM is given an image and a text prompt, it combines both modalities to perform grounded visual reasoning. However, research using the **CrossMath** benchmark, which rigorously controlled tests across text-only, image-only, and image+text modalities, revealed a surprising truth: current state-of-the-art VLMs suffer from a substantial performance gap between textual and visual reasoning.

When identical task-relevant information is provided, VLMs excel at processing text-only inputs. However, when visual data is incorporated alongside text, performance frequently drops. This suggests that the models lean heavily on the reasoning abilities baked into their language models and struggle to synthesize visual data deeply during complex cognitive tasks. This phenomenon shares a thematic link with the growing focus on [Inference-Time Compute](../concepts/inference-time-compute.md), highlighting that generating more reasoning tokens doesn't inherently fix visual processing bottlenecks if the modality bridge is weak.

## Fine-Tuning for True Vision Grounding
To address this limitation, the researchers curated a specific training dataset designed to force the model to rely equally on both modalities. Empirical evaluations demonstrated that fine-tuning on this CrossMath training set significantly boosted reasoning performance across all individual and joint modalities, providing a path forward for developing more robust vision-language reasoning systems.

## Real-World Application & Who Should Care

🚀 **Performance Monsters (SOTA Seekers):** If you are building cutting-edge multi-modal reasoning agents, you cannot rely on out-of-the-box VLMs to perform true joint reasoning. You must implement custom fine-tuning pipelines using cross-modal datasets like CrossMath to force your model to actively process visual evidence rather than defaulting to its text priors.

💰 **Cost & Latency Optimizers (API Developers):** Passing images to an API dramatically increases token cost and latency. If the VLM is primarily reasoning via text and the image is actually degrading performance, you are wasting money and slowing down your app. Consider extracting the relevant text from images using cheap OCR first, and only sending text-only prompts for the heavy reasoning tasks.

💻 **Everyday Prompt Engineers:** When using tools like Claude, Gemini, or ChatGPT for complex problem-solving, do not assume adding a screenshot helps. If you can clearly articulate the problem in text, stick to text. Only provide images if they contain strictly visual spatial information that cannot be described easily.

---
**Sources:**
* [arXiv:2604.16256 - Do Vision-Language Models Truly Perform Vision Reasoning? A Rigorous Study of the Modality Gap](https://arxiv.org/abs/2604.16256)
* [CrossMath GitHub Repository](https://github.com/xuyige/CrossMath)
