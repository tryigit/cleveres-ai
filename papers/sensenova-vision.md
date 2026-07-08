# Vision as Unified Multimodal Generation

## TL;DR
SenseNova-Vision completely reformulates computer vision as a unified multimodal generation problem, dropping task-specific architectures and prediction heads entirely. By expressing heterogeneous visual tasks - like detection, segmentation, and pose estimation - within the native text and image generation spaces of a unified model, it proves that a single foundational model can match leading specialized systems. To achieve this, diverse computer vision annotations were converted into an instruction-response format, resulting in the SenseNova-Vision Corpus.

## Core Mechanism
Traditional computer vision models rely heavily on specialized prediction heads for different tasks (e.g., bounding box regressors for detection, mask heads for segmentation). SenseNova-Vision abandons this fragmentation.

Instead, tasks are defined using natural language instructions and optional visual prompts. The model generates responses in three unified spaces:
1. **Text:** Used for symbolic outputs (e.g., coordinates, bounding boxes, OCR).
2. **Images:** Used for dense spatial predictions (e.g., depth maps, surface normals).
3. **Mixed Text-and-Image:** Used for compositional tasks.

The model is trained primarily on the massive SenseNova-Vision Corpus, a translation of traditional CV datasets into instruction-response pairs. Without any architectural modifications to the off-the-shelf multimodal base model, this purely generative approach successfully handles detection, keypoint estimation, depth estimation, and complex multi-view visual geometry.

## Real-World Application & Who Should Care

*   🚀 **The Performance Monsters (SOTA Seekers):** This represents a massive shift towards true "General-Purpose Foundation Models." Researchers can leverage this unified approach to build highly scalable vision systems that seamlessly transfer learning across structured understanding and dense geometric prediction without juggling a dozen separate architectures.
*   💰 **The Cost & Latency Optimizers (API Developers):** Managing a single, unified generative model for all vision tasks massively simplifies MLOps, deployment, and infrastructure costs compared to hosting separate specialist models for OCR, segmentation, and depth estimation.
*   🧑‍💻 **The Everyday Prompt Engineers:** This framework makes it easier to combine complex vision instructions. You can use language-defined variants to specify category, color, and region in the same prompt, expecting the model to natively generate the right mix of text labels and image masks in a single response.

## References
* [Vision as Unified Multimodal Generation](https://arxiv.org/abs/2607.06560)

See also: [InternVideo3: Agentify Foundation Models with Multimodal Contextual Reasoning](../papers/internvideo3-agentify-foundation-models.md)
