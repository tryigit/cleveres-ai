# Distilled Reinforcement Learning for LLM Post-training

## TL;DR
**Distilled Reinforcement Learning (Distilled RL)** is a novel post-training paradigm that integrates fine-grained teacher supervision directly into the Reinforcement Learning (RL) objective. By addressing the weaknesses of standard RL (difficult credit assignment due to coarse-grained outcome supervision) and On-Policy Distillation (OPD) (unconditional imitation and inability to learn from substantially different teachers), Distilled RL selectively transfers new knowledge without forcing the student to blindly copy the teacher.

## The Problem: The Post-Training Dilemma
LLM post-training typically relies on two primary paradigms:
1. **Reinforcement Learning (RL):** Uses coarse-grained outcome supervision (e.g., a final score or human preference). This makes credit assignment across a long chain of reasoning very difficult, limiting the model's ability to acquire genuinely new knowledge.
2. **On-Policy Distillation (OPD):** Unconditionally matches the logits of a stronger teacher model using KL divergence. This creates a "Goldilocks" problem: a teacher that is too similar provides no new knowledge, but a teacher that is substantially different provides guidance that is too hard to follow, effectively restricting OPD to within-family models.

## The Solution: Distilled RL
Distilled RL bridges this gap by embedding teacher supervision into the RL objective itself. Rather than blindly matching logits, it provides fine-grained guidance to selectively transfer new knowledge. The framework relies on three core components:

*   **Reverse Importance Sampling with Clipping:** Modifies the learning objective to prevent the student from over-penalizing itself when exploring paths the teacher didn't take, while still gaining from the teacher's stronger insights.
*   **Negative Sample Reset:** Ensures that the student isn't overly penalized for making bad initial choices, allowing it to recover and learn more effectively from its mistakes.
*   **Sequence-Level Geometric Normalization:** Stabilizes the training process across long sequences, ensuring that the gradient updates remain manageable even when the student and teacher diverge significantly.

By combining these mechanisms, Distilled RL effectively transfers previously unavailable knowledge from a teacher to a student, substantially outperforming both standard RL and OPD in `pass@1` and `pass@k` metrics, across both within-family and cross-family distillation settings.

## Real-World Application & Who Should Care

*   🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):** Researchers building frontier reasoning models can use cross-family Distilled RL to transfer capabilities from massive closed-source teachers to open-source student models without the standard OPD degradation.
*   💸 **THE COST & LATENCY OPTIMIZERS (API Developers):** Teams training smaller, specialized models for production can distill capabilities from giant, expensive models much more effectively, ensuring the smaller model actually learns the reasoning path rather than just mimicking the output token distribution.
*   🧑‍💻 **THE EVERYDAY PROMPT ENGINEERS:** Not directly applicable to end-user prompt engineering. This is a foundational training methodology for AI engineers.

## References
* [Distilled Reinforcement Learning for LLM Post-training](https://arxiv.org/abs/2607.17247)

See also: [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md)
