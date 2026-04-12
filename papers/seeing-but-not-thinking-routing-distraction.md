# Seeing but Not Thinking: Routing Distraction in Multimodal Mixture-of-Experts

**Category:** Frontier Research & Papers
**Date:** April 2026

## TL;DR
Multimodal [Mixture of Experts (MoE)](../concepts/mixture-of-experts.md) models often suffer from a phenomenon called "Seeing but Not Thinking," where they accurately perceive image content but fail in subsequent reasoning tasks that they could solve if presented as pure text. Research reveals this is caused by "Routing Distraction," where visual experts and domain experts separate across layers. When an image is inputted, the routing mechanism diverges and fails to adequately activate the required reasoning domain experts, degrading cognitive capabilities.

## The "Seeing but Not Thinking" Phenomenon
Multimodal MoE models have achieved remarkable performance on vision-language tasks. However, researchers identified a puzzling weakness: these models accurately see image content, but then fail to apply basic reasoning to it, even though they easily solve identical problems presented purely in text.

Initial assumptions might blame a failure in "semantic alignment" between vision and text. But systematic analysis verifies that cross-modal semantic sharing actually exists in MoE architectures.

## The Root Cause: Routing Distraction
The failure occurs in the routing mechanism of the MoE. In middle layers, where reasoning occurs:
*   **Layer-wise Separation:** Visual experts and domain experts exhibit a distinct layer-wise separation.
*   **Routing Divergence:** Image inputs induce significant routing divergence compared to text inputs in these middle layers, where domain experts are concentrated.

**The Routing Distraction Hypothesis:** When processing visual inputs, the MoE's routing mechanism is "distracted" by the visual data and fails to adequately activate the task-relevant reasoning experts necessary to solve the problem.

By using a routing-guided intervention method to force domain expert activation, researchers achieved consistent improvements up to 3.17% on complex visual reasoning benchmarks across three multimodal MoE models. Furthermore, identifying these domain experts locates specific cognitive functions rather than sample-specific solutions, allowing for transfer across different tasks.

## Real-World Application & Who Should Care

🚀 **The Performance Monsters (SOTA Seekers):**
Researchers building advanced multimodal agents can use routing-guided interventions to squeeze higher reasoning performance out of existing MoE models without retraining. By enforcing domain expert activation during visual tasks, you can close the gap between textual and visual reasoning.

💰 **The Cost & Latency Optimizers (API Developers):**
This research doesn't directly lower API costs, but understanding routing inefficiencies could lead to future optimizations where visual tokens are pruned or routed more efficiently, saving compute in multimodal pipelines.

💻 **The Everyday Prompt Engineers:**
When working with multimodal MoEs, if the model fails a reasoning task based on an image, try extracting the visual information first ("Describe the image in detail"), and then in a separate prompt, ask it to solve the problem using only that text description. This bypasses the routing distraction by forcing the model to rely solely on its text reasoning pathways.

## Sources
*   [Seeing but Not Thinking: Routing Distraction in Multimodal Mixture-of-Experts (arXiv)](https://arxiv.org/abs/2604.08541v1)
