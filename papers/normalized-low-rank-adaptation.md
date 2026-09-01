# Normalized Low-Rank Adaptation (NoRA)

**TL;DR:**
Normalized Low-Rank Adaptation (NoRA) is a simple and broadly applicable enhancement to traditional Low-Rank Adaptation (LoRA). It addresses the problem of early optimization dynamics being largely governed by the down-projection due to the zero initialization of the up-projection. NoRA normalizes the down-projection matrices during training (or only at initialization), which consistently accelerates convergence, improves performance, boosts training stability, and mitigates catastrophic forgetting without requiring additional trainable parameters or inference-time computation.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For researchers fine-tuning massive models across pretraining, supervised finetuning, and reinforcement learning, NoRA offers a more stable and effective optimization dynamic. It acts as a strict upgrade over standard LoRA to achieve higher performance metrics and avoid catastrophic forgetting.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
Because NoRA requires no additional trainable parameters and adds zero computation cost at inference time, API developers can drop it into existing LoRA pipelines to get better model performance without increasing latency or deployment costs.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
This topic is less directly applicable for end-users, but models fine-tuned with NoRA will likely exhibit more stable and robust behaviors on downstream tasks.

## References
* [arXiv: Normalized Low-Rank Adaptation](https://arxiv.org/abs/2608.31036)

See also: [Low-Rank Adaptation (LoRA): Efficient Fine-Tuning](../concepts/low-rank-adaptation.md)
