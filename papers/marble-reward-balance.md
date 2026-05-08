# MARBLE: Multi-Aspect Reward Balance for Diffusion RL

**TL;DR:** When using Reinforcement Learning to align diffusion models, optimizing for multiple rewards simultaneously (like aesthetics, prompt alignment, and safety) usually fails if you just average the scores together. MARBLE (Multi-Aspect Reward BaLancE) is a gradient-space optimization framework that maintains independent advantage estimators for each reward and mathematically harmonizes their updates into a single direction without relying on manual weighting.

## The Multi-Reward Problem

[Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md) is the standard method for aligning generative models. However, evaluating images is a multi-dimensional problem. A generated image needs to be aesthetically pleasing, strictly adhere to the prompt, and be safe for work.

Historically, practitioners have attempted to handle this by:
1.  **Weighted Sums:** Averaging the rewards together (e.g., $R = 0.5 \times R_{aesthetic} + 0.5 \times R_{prompt}$).
2.  **Specialist Models:** Training a separate model for each reward.
3.  **Sequential Training:** Training on one reward first, then fine-tuning on another.

The authors of MARBLE point out that weighted sums suffer from a "sample-level mismatch". Most generated images in a batch are "specialist samples" that are highly informative for one reward but irrelevant for another. Averaging them simply dilutes the learning signal.

## How MARBLE Works

MARBLE discards the weighted-sum approach and operates directly in gradient space:

1.  **Independent Advantage Estimators:** MARBLE computes separate policy gradients for each specific reward dimension.
2.  **Quadratic Programming:** It solves a Quadratic Programming problem to harmonize these divergent gradients into a single, unified update direction that improves all rewards simultaneously without manual tweaking.
3.  **Amortized Cost:** Computing K different gradients usually costs K+1 backward passes. MARBLE uses an amortized formulation that exploits the affine structure of the Diffusion loss to reduce this compute cost to nearly the same as a single-reward baseline.
4.  **EMA Smoothing:** To prevent unstable updates caused by transient, single-batch fluctuations, MARBLE applies Exponential Moving Average (EMA) smoothing to the balancing coefficients.

When applied to Stable Diffusion 3.5 Medium across five distinct rewards, MARBLE consistently maintained positive gradient updates for all rewards and ran at 0.97X the speed of standard baseline training.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
*   **Unified Diffusion Alignment:** Researchers aligning complex multimodal models can use MARBLE to optimize conflicting objectives (e.g., highly detailed art styles vs. strict layout adherence) without the supervision signals canceling each other out.
*   **Eliminating Schedule Tuning:** It removes the need for tedious, hand-crafted stage scheduling when trying to sequentially teach a model different capabilities.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
*   **Near-Zero Overhead:** By exploiting the affine structure of the loss, MARBLE offers multi-objective RLHF fine-tuning at roughly the exact same computational cost (0.97X speed) as a naive single-reward baseline, avoiding the K+1 backward pass penalty.

### 💻 THE EVERYDAY PROMPT ENGINEERS (Regular Users)
*   *This technique happens during model training. For end-users, MARBLE-trained models will exhibit far fewer frustrating trade-offs. You won't have to sacrifice image quality to get the model to follow complex, multi-subject prompts accurately, as the model was trained to balance both simultaneously rather than averaging them out.*

## Sources
*   [MARBLE: Multi-Aspect Reward Balance for Diffusion RL (arXiv:2605.06507)](https://arxiv.org/abs/2605.06507)
