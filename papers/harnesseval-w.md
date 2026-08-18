# HarnessEval-W: Agentifying the Evaluation of Visual Worlds

## TL;DR
Evaluating world models currently relies on scalar scores computed via brute-force metrics, which fail to explain whether generated rollouts respect physics, causality, or correct world states. HarnessEval-W introduces an "agentified" evaluation pipeline inspired by the LLM ecosystem's harness paradigms. It moves away from static rubrics by using a parent agent to interpret each evaluation case, decompose the context into measurable subproblems, and spawn specialized sub-agents with specific tools. These sub-agents reason over their assigned tasks and pass evidence back to the parent agent, which summarizes it into a verifiable, fine-grained verdict. Applied across 18 world models and 330 test cases, this hierarchical approach aligns closely with human judgments while providing an explicit reasoning chain for every score.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For researchers building the next generation of visual world models, HarnessEval-W provides a transparent, debuggable framework. Instead of a black-box scalar score, you get an evidence tree detailing exactly where a rollout failed - whether it was a physics violation, a temporal inconsistency, or a failure to maintain object permanence. This enables targeted architectural improvements rather than blind iteration.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
If you are deploying world models in production pipelines (e.g., for synthetic data generation or simulation), you need automated ways to guarantee the quality of the generated outputs. HarnessEval-W offers an automated, verifiable pipeline to filter out bad rollouts without relying on expensive human reviewers, ensuring your downstream tasks only consume physically sound data.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
While you might not evaluate world models directly, the existence of Agentified evaluation frameworks means that the video and simulation tools you use will rapidly improve in consistency. When your video generation prompts finally start producing characters that don't clip through walls or forget their environment, it will be because frameworks like HarnessEval-W caught those errors during development.

## See also
* [Qwen-AgentWorld: Language World Models for General Agents](qwen-agentworld.md)

## References
* [HarnessEval-W: Agentifying the Evaluation of Visual Worlds](https://arxiv.org/abs/2608.16859)
