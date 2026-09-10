# SAEScientist-Bench: Can AI Agents Conduct Autonomous SAE Interpretability Research?

## TL;DR
While recursive self-improvement pipelines have automated model training, reliable autonomous AI development requires post-hoc monitoring and auditing. This paper introduces SAEScientist-Bench, a benchmark evaluating whether AI agents can autonomously act as scientists using Sparse Autoencoders (SAEs) for mechanistic discovery. Agents must design contrastive probes and navigate a massive dictionary of over 131K features in Gemma-2-9B-IT to discover target concepts. The study finds that while frontier agents possess genuine discovery capabilities and can design contrasts to rule out spurious candidates, they frequently misinterpret experimental measurements. Consequently, they approach expert baseline levels in separating target concepts from contrastive controls, but lag substantially in causal generation steering.

## Real-World Application & Who Should Care

### (Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
**Why you care:** If you are building autonomous AI researchers or self-improving systems, this benchmark establishes experimental model understanding as a measurable capability for closed-loop AI R&D. It highlights a critical bottleneck: agents struggle to interpret their own experimental readouts during causal steering tasks.

### (Money) THE COST & LATENCY OPTIMIZERS (API Developers):
This research focuses on mechanistic interpretability and autonomous research capabilities rather than direct inference optimization or deployment costs, making it less relevant for latency optimization.

### (Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
This paper primarily concerns internal mechanistic interpretability and the development of autonomous research agents, so it does not directly impact everyday prompting strategies in web interfaces.

## References
* [SAEScientist-Bench: Can AI Agents Conduct Autonomous SAE Interpretability Research?](https://arxiv.org/abs/2609.09113)

See also: [SAE Interventions are Unreliable: Post-Intervention Recovery of Suppressed Behavior](sae-interventions-unreliable.md)