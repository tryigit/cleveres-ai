# Dynamic Important Example Mining for Reinforcement Finetuning (DIEM)

**TL;DR:**
Dynamic Important Example Mining (DIEM) is a fully automated framework for Reinforcement Finetuning (RFT) that adaptively utilizes data throughout training. While most data-centric RFT methods rely on static sample selection, DIEM continuously evaluates the non-stationary dynamics of policy learning. It introduces a gradient-alignment importance estimator to approximate a sample's marginal contribution to policy improvement, and a constrained batch reweighting scheme that maximizes aggregate utility while maintaining gradient magnitude stability.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For researchers pushing the boundaries of reasoning abilities in large models, DIEM provides a principled way to select the most valuable data points at every optimization step. This dynamic reweighting consistently outperforms strong static baselines on reasoning benchmarks by making sure the model always focuses on the most useful data relative to its current state.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
By dynamically selecting the most important examples during reinforcement finetuning, DIEM can lead to faster convergence and more efficient use of training data. This translates to reduced compute costs for organizations repeatedly finetuning large models.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
This technique improves the underlying intelligence of the base models you interact with, leading to models that have better logical and reasoning capabilities out-of-the-box.

## References
* [arXiv: Dynamic Important Example Mining for Reinforcement Finetuning](https://arxiv.org/abs/2608.29252)

See also: [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md)
