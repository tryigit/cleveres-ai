# PRISM: Pre-alignment via Black-box On-policy Distillation for Multimodal Reinforcement Learning

**Category:** Frontier Research & Papers
**Date:** April 2026

## TL;DR
The standard recipe for training large multimodal models (LMMs) involves Supervised Fine-Tuning (SFT) followed by [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md) or Reinforcement Learning with Verifiable Rewards (RLVR). However, SFT introduces "distributional drift," which disrupts a model's original capabilities and fails to match the supervision distribution, especially in complex multimodal reasoning. **PRISM** introduces a crucial intermediate stage - distribution alignment - between SFT and RLVR. By casting alignment as an adversarial game between the policy and a Mixture-of-Experts discriminator, PRISM significantly improves downstream RLVR performance across multiple reinforcement learning algorithms like [GRPO](../concepts/group-relative-policy-optimization.md).

## The Problem: Distributional Drift in Multimodal RL
When moving from SFT to reinforcement learning, models suffer from distributional drift. In multimodal tasks, this drift compounds because perception errors (misinterpreting an image) and reasoning failures (flawed logic) follow different drift patterns.
Traditional On-Policy Distillation (OPD) is designed to mitigate some of these issues (as seen in research like [Demystifying OPD](demystifying-opd-length-inflation.md)), but applying it directly to multimodal domains without addressing the distinct modes of failure often leads to suboptimal RL initialization.

## The Solution: PRISM Pipeline
PRISM inserts an explicit distribution-alignment stage between SFT and RLVR:
1. **SFT Initialization:** Broad initialization using public demonstrations (e.g., 1.26M public examples).
2. **Distribution Alignment (The Core of PRISM):** Uses high-fidelity supervision (e.g., 113K curated dense visual grounding demonstrations). It casts alignment as a black-box, response-level adversarial game. The policy competes against a Mixture-of-Experts (MoE) discriminator equipped with dedicated experts for *perception* and *reasoning*. This disentangles corrective signals, steering the policy toward the supervision distribution without requiring access to teacher logits.
3. **RLVR Post-Training:** Finally, reinforcement learning is applied.

Experiments on Qwen3-VL showed that using PRISM before RLVR improves average accuracy by +4.4 to +6.0 points across multiple RL algorithms (GRPO, DAPO, GSPO) compared to a standard SFT-to-RLVR baseline.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
For AI researchers pushing the limits of multimodal reasoning (like mathematical analysis of images or complex spatial tasks), inserting PRISM's distribution alignment phase prevents the capabilities degradation that typically happens when transitioning directly from SFT to RLVR.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
Better initialization for RL means faster convergence during the highly expensive reinforcement learning phase. By using a black-box adversarial game that doesn't require teacher logits, PRISM provides a more memory-efficient distillation method for preparing models for final RL tuning.

### 💻 THE EVERYDAY PROMPT ENGINEERS
End users will experience multimodal models that are less prone to hallucinating visual details while reasoning. Because perception and reasoning are explicitly disentangled during alignment, the resulting models handle complex visual queries with far greater logical consistency.

## Sources
* [PRISM: Pre-alignment via Black-box On-policy Distillation for Multimodal Reinforcement Learning (arXiv:2604.28123)](https://arxiv.org/abs/2604.28123)
