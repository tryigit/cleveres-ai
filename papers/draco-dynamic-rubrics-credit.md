# DRACO: Fine-Grained Credit Assignment with Dynamic Rubrics for Long-Horizon Agent Training

**Category:** Frontier Research & Papers
**Date:** September 2026

## TL;DR

Reinforcement Learning from Verifiable Rewards (RLVR) thrives when a clear, programmatic success checker exists. However, for outcome-blind long-horizon agents - where ground-truth success signals are missing - training relies on trajectory-level heuristics or multi-criteria rubrics. Scoring a rubric once at the end of a long trajectory provides a sparse scalar reward that struggles to assign credit across tens of distinct steps.

To solve this, researchers introduced **DRACO** (Distributing Rubric-based Advantage for Credit Optimization). DRACO dynamically generates rubrics during training to monitor the policy's evolving capability. It scores these rubrics at the end of a trajectory but redistributes the judgment across the specific steps responsible for the annotated rubrics. This produces differentiated, per-step advantages suitable for optimization algorithms like GRPO, achieved entirely in closed-form without introducing a trained attribution module.

## The Credit Assignment Problem in Agentic RL

In long-horizon tasks (e.g., navigating a complex desktop OS or solving intricate coding issues), an agent takes dozens of actions before reaching a terminal state.
- **Sparse Rewards:** Only rewarding the final state makes it nearly impossible for the agent to figure out *which* specific action out of 50 led to success or failure.
- **Rubric-Based Rewards:** Providing a multi-criteria rubric (e.g., "Did the agent search the file?", "Did the agent modify the correct function?") helps, but traditionally this is evaluated once per trajectory. A single scalar score still fails to isolate the exact step that achieved a sub-goal.

## The DRACO Methodology

DRACO tackles this by reshaping how rubric advantages are calculated within the Group Relative Policy Optimization (GRPO) framework:

1. **Dynamic Rubric Generation:** Rather than using a static set of rules, DRACO dynamically generates rubrics tailored to track the specific capabilities the policy is currently struggling with or developing during training.
2. **Closed-Form Redistribution:** Once a trajectory finishes, the rubric is scored. DRACO then redistributes this final score across the sequence of steps, attributing credit to the specific actions responsible for fulfilling (or failing) the rubric's criteria.
3. **No Trained Attribution Module:** Crucially, this redistribution is done in a closed-form mathematical manner. By avoiding an additional attribution network (such as a critic) to estimate which step deserves credit, it reduces model-training complexity without necessarily reducing end-to-end compute.

**Performance Gains:**
- On **AppWorld**, DRACO achieved a 15.9-point gain over the base model, and a 5.3-point gain over a standard GRPO setup trained with sparse ground-truth rewards (notably without using verifiers itself).
- On the out-of-domain **Tau-Bench**, it gained 5.3 points over the base model, beating both ground-truth-reward training and other rubric-based methods, even without relying on a frontier judge.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
This is a breakthrough for researchers training highly capable, long-horizon autonomous agents (e.g., SWE-agents, OS-control agents). By solving the temporal credit assignment problem without adding heavy critic networks, you can train agents that execute complex, multi-step plans much more reliably in domains lacking clear programmatic verifiers.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
Because DRACO uses a closed-form redistribution mechanism instead of a trained attribution module, it avoids an additional attribution network and reduces model-training complexity. This primarily affects the training setup rather than inference and does not necessarily reduce end-to-end compute.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
While DRACO is an underlying RL training methodology, its success highlights the importance of breaking down complex tasks. When prompting agents, explicitly defining intermediate rubrics or sub-goals in your prompt can help guide the model's trajectory, mimicking the step-by-step credit assignment this paper automates.

## References & Further Reading
- **GitHub Repository:** [https://github.com/IBM/draco](https://github.com/IBM/draco)
- **arXiv ID:** 2609.04094

See also: [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md)
