# Video-DeepResearch: Towards the Next-Generation Multimodal Deepresearch Agent

**Category:** Frontier Research & Papers
**Date:** August 2026

## TL;DR
Current multimodal agents struggle when moving from static images to continuous video streams, often exhibiting "modality bias" (ignoring visual tools in favor of text search) and "parametric knowledge leakage" (relying on internal memory rather than tool-augmented execution). **Video-DeepResearch (Video-DR)** solves this by introducing a decoupled perception-exploration pipeline with stage-wise tool unlocking, forcing the agent to perform exhaustive cross-frame visual grounding before accessing web retrieval tools. Trained using Supervised Fine-Tuning followed by [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md), it breaks the imitation-learning ceiling. Its 35B variant achieves a new state-of-the-art on the complex Video-DR-Bench.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
Researchers building advanced multimodal autonomous agents for complex dynamic environments (like robotics or continuous monitoring) can use the decoupled perception-exploration pipeline. By forcing dense spatiotemporal grounding *before* web exploration, you can prevent agents from shortcutting to textual search or hallucinating from parametric memory.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
While this framework focuses on capability over efficiency, the 30B variant achieved performance competitive with proprietary frontier models. Adopting this decoupled pipeline and training with GRPO allows smaller, open-weight models to punch above their weight in video reasoning, potentially saving API costs compared to routing complex video analysis to frontier commercial models.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
When asking LLMs to analyze long videos alongside web research, structure your prompts to mirror this approach: explicitly ask the model to first exhaustively describe and analyze the keyframes in the video *before* it is allowed to search the web for related information. This staged approach reduces hallucinations and grounds the final answer in the actual visual evidence.

## References
* [Video-DeepResearch: Towards the Next-Generation Multimodal Deepresearch Agent](https://arxiv.org/abs/2608.03979)
