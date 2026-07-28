# Kimi K3: Open Frontier Intelligence

## TL;DR

Kimi K3 is a massive 2.8 trillion-parameter [Mixture of Experts (MoE): Scaling Intelligence Efficiently](../concepts/mixture-of-experts.md) model that activates 104 billion parameters per token. It features native vision capabilities and a 1-million-token context window. By integrating Kimi Delta Attention, Attention Residuals, and Stable [LatentMoE: Serving-Aware Sparse Compute](../concepts/latent-moe.md), Kimi K3 achieves a 2.5x improvement in scaling efficiency over its predecessor. It delivers frontier-level performance across reasoning, coding, and long-horizon agentic tasks, and is fully open-weight to advance research.

## Architecture and Innovations

Kimi K3 leverages several cutting-edge architectural and infrastructure advancements:

*   **Kimi Delta Attention & Attention Residuals:** These mechanisms improve information flow across both sequence length and model depth, essential for effectively handling the 1-million-token context window.
*   **Stable LatentMoE:** The model routes tokens to 16 out of 896 available experts. This fine-grained sparse activation helps manage the immense 2.8T parameter scale while keeping activated parameters (104B) at a computationally tractable level.
*   **Advanced Reinforcement Learning:** Post-training involves RL across general, agentic, and coding domains. This includes managing multiple reasoning-effort levels to enable compositional generalization and robust execution of long-horizon tasks.
*   **Infrastructure Breakthroughs:** Training a model of this scale required algorithm-system co-design for Kimi Delta Attention, perfectly balanced expert-parallel training, and a million-token agentic RL pipeline with persistent rollout and sandbox states.

While its performance trails the very top proprietary models (like Claude Fable 5 and GPT-5.6 Sol), it consistently outperforms other open-source models, making it a powerful foundation for the open AI ecosystem.

## Real-World Application & Who Should Care

*   🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):** Researchers can leverage the open weights of this 2.8T model to build powerful long-horizon agents or conduct fine-grained multimodal research without the constraints of proprietary APIs.
*   💸 **THE COST & LATENCY OPTIMIZERS (API Developers):** The MoE architecture (activating only 104B of 2.8T parameters) combined with Stable LatentMoE provides a blueprint for running massively capable models with relatively efficient serving costs compared to dense counterparts.
*   👨‍💻 **THE EVERYDAY PROMPT ENGINEERS:** Users dealing with extensive documents or codebases can take advantage of the native vision and 1-million-token context window for comprehensive, multi-step reasoning without hitting context limits.

## References
* [Kimi K3: Open Frontier Intelligence](https://arxiv.org/abs/2607.24653)
