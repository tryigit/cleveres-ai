# LongStraw: Long-Context RL Beyond 2M Tokens under a Fixed GPU Budget

## TL;DR
There is a growing gap between inference capabilities (which are approaching million-token contexts) and RL post-training workloads (which often remain at 256K tokens or below due to memory constraints). LongStraw is an architecture-aware execution stack designed for million-token RL post-training under a fixed GPU budget, specifically instantiated with Group Relative Policy Optimization (GRPO). By evaluating shared prompts without autograd, retaining only necessary model-specific state, and replaying short response branches one at a time, it drastically reduces the live training graph's memory footprint at the cost of additional replay time. It has been validated to execute RL across 2.1M token prompts on models like Qwen3.6-27B and GLM-5.2 on a limited number of H20 GPUs.

## Core Mechanisms
1. **Autograd-Free Prompt Evaluation:** The shared long prompt is evaluated without building the massive computational graph typically required for automatic differentiation.
2. **Minimal State Retention:** Only the essential model-specific state needed for processing subsequent tokens is kept in memory.
3. **Sequential Branch Replay:** Short response branches are replayed one at a time during the backward pass. This trades additional replay time for significant memory savings, effectively shrinking the live training graph to fit within fixed GPU budgets.

## Real-World Application & Who Should Care

*   **(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):** Researchers training highly advanced AI agents that rely on extremely long trajectories (e.g., thousands of tool outputs, long document histories) can use LongStraw to perform RL post-training on contexts exceeding 2 million tokens without needing to exponentially scale their GPU clusters.
*   **(Money) THE COST & LATENCY OPTIMIZERS (API Developers):** For organizations looking to train models on longer contexts without the massive infrastructure costs typically associated with such efforts, LongStraw offers a pathway to train on constrained hardware (like eight H20 GPUs) by optimizing memory at the expense of compute time.
*   **(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:** This does not directly change how one prompts a model on a daily basis. However, models trained using techniques like LongStraw will eventually handle significantly longer and more complex contextual histories without losing focus.

See also: [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md) for related concepts on efficient reinforcement learning.

## References
* [LongStraw: Long-Context RL Beyond 2M Tokens under a Fixed GPU Budget](https://arxiv.org/abs/2607.14952)
