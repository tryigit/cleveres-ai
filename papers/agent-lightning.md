# Agent Lightning v1.0: Towards Harnessed Agentic RL

## TL;DR
Agent Lightning v1.0 introduces a disaggregated framework for "harnessed agentic RL," where the deploy-time agent harness directly participates in the model's post-training process. Unlike traditional agentic RL where the training engine owns the environment interaction loop, harnessed agentic RL delegates this loop to the harness, while the trainer observes only sequences of LLM request-response pairs. This lightweight framework (roughly 3,500 lines of code) supports arbitrary agent harnesses and helps address critical challenges in retokenization, sample merging, advantage calculation, and backend scheduling that affect training stability. When evaluated on SWE-bench Verified, applying RL via this framework improved the baseline model (Qwen3.5-9B) from 41.8% to 56.4% using only 6K training examples.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
Researchers focusing on complex tasks like coding or search can leverage harnessed agentic RL to dramatically boost agent success rates on rigorous benchmarks without modifying their existing complex execution environments. It allows them to apply advanced techniques like [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md) directly to multi-step agent trajectories.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
By moving the interaction loop out of the heavy training engine and into the lightweight harness, infrastructure teams can scale data collection more efficiently, running thousands of asynchronous agent rollout environments on cheaper CPU nodes while keeping the expensive GPU nodes strictly dedicated to policy updates.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
While this is primarily an infrastructure breakthrough for model trainers, prompt engineers will benefit downstream as next-generation models will natively understand how to use complex external tools (like IDEs or bash terminals) much better, reducing the need for elaborate "act as an expert developer" system prompts.

## References
* [Agent Lightning v1.0: Towards Harnessed Agentic RL](https://arxiv.org/abs/2608.17528)
