# Distill Where You Fail: Recovering Learning Signals of Negative RL-Groups from Adaptive Teacher Guidance

**Category:** Frontier Research & Papers
**Date:** August 2026

## TL;DR
Reinforcement Learning with Verifiable Rewards (RLVR), specifically [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md), often struggles with sparse rewards. If all generated responses in a group get identical (often zero) rewards, gradient signals are lost. While On-Policy Distillation (OPD) can inject dense supervision from a teacher model, blindly applying it suppresses exploratory behavior and degrades performance. RSTG (Recovering Learning Signals via Adaptive Teacher Guidance) solves this by selectively applying distillation *only* where it matters. It targets negative, zero-variance prompts at the sample level, and focuses on tokens with high student entropy or significant teacher-student divergence, alongside applying SFT on correct teacher trajectories.

## Real-World Application & Who Should Care

🚀 THE PERFORMANCE MONSTERS (SOTA Seekers):
If you're training models for complex mathematical reasoning or coding via RL, RSTG directly addresses the gradient starvation problem in GRPO. By adaptively blending RL with precise teacher distillation on failing trajectories, you can significantly boost reasoning capability without collapsing the model's exploratory diversity.

💰 THE COST & LATENCY OPTIMIZERS (API Developers):
This technique improves the sample efficiency and stability of post-training paradigms. Faster, more stable convergence during training translates to lower compute costs when building specialized small-to-medium reasoning models for your APIs.

💻 THE EVERYDAY PROMPT ENGINEERS:
This topic is an underlying training mechanism and does not directly change how you write prompts today.

## References
* [Distill Where You Fail: Recovering Learning Signals of Negative RL-Groups from Adaptive Teacher Guidance](https://arxiv.org/abs/2608.00782)
