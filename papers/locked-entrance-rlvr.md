# Locked at the Entrance, Open Inside: Where RLVR Narrows the Solution Space

## TL;DR
Reinforcement Learning with Verifiable Rewards (RLVR) significantly improves the single-sample accuracy (pass@1) of language models in reasoning tasks. However, this comes at the cost of diversity, causing the policy's solution space to contract and diminishing the benefits of test-time scaling. This paper investigates where exactly in a reasoning trajectory this diversity is lost. Through an analysis of the Countdown task (which can be exhaustively enumerated into discrete entrance families) on Qwen models optimized with PPO and GRPO, the authors discover that the contraction happens almost entirely at the very beginning of the generation. Specifically, the model fails to initiate diverse solution paths, but alternative paths remain fully executable if they are forced via an unselected entrance prefix.

The researchers demonstrated that late-layer parameter interpolation with early checkpoints increases solution coverage by 37% without sacrificing pass@1 accuracy. This early-step entropy collapse is a recurring issue across large math benchmarks, but it can be mitigated using staged SFT-DPO-RLVR training pipelines, proving that reasoning breadth is "lost at the door, not inside the room."

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
When training frontier models using RLVR or GRPO, researchers must be cautious of early-step mode collapse. By understanding that diversity loss is concentrated at the entrance of a trajectory, you can design better pre-training and post-training schedules (like staged SFT-DPO-RLVR) to preserve exploration, enabling much higher returns from test-time search and multi-path generation.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
If you depend on generating multiple candidate answers and routing/verifying them (test-time scaling) to improve reliability, a model suffering from entrance locking will just give you the same path repeatedly, wasting your API budget. Leveraging models trained with techniques that preserve entrance diversity ensures that your multi-sample API calls actually yield distinct reasoning chains.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
When asking a model to solve a complex math or logic problem, it might get stuck trying the same failed approach if you regenerate the response. It is a hypothesis that manually providing a specific "starting move" could expose a path the model can execute but does not initiate on its own; this has not been validated as an effective mitigation. The validated controlled interventions are solver-constructed, unselected entrance prefixes and late-layer parameter interpolation with early checkpoints.

## References
- **arXiv ID:** 2608.29188
- **GitHub Repository:** [https://github.com/ershiyidian/early-branch-locking](https://github.com/ershiyidian/early-branch-locking)

See also: [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md), [DRACO: Fine-Grained Credit Assignment with Dynamic Rubrics for Long-Horizon Agent Training](draco-dynamic-rubrics-credit.md)
