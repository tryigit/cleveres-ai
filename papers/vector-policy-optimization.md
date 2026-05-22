# Vector Policy Optimization: Training for Diversity Improves Test-Time Search

**Category:** Frontier Research & Papers
**Key Concepts:** Reinforcement Learning (RL), Test-Time Search, Group Relative Policy Optimization (GRPO), Inference Scaling, Out-of-Distribution Generalization

## TL;DR
Language models are increasingly deployed in novel environments where they must work inside inference-scaling search procedures (like AlphaEvolve). These procedures select rollouts based on a variety of task-specific reward functions. The standard paradigm of post-training models with a pre-specified scalar reward often results in low-entropy response distributions, meaning the model struggles to produce the diverse solutions that inference-time search requires.

**Vector Policy Optimization (VPO)** is a reinforcement learning algorithm that explicitly trains policies to anticipate diverse downstream reward functions and produce diverse solutions. It leverages the fact that rewards in practice are often vector-valued (e.g., per-test-case correctness in code generation, or multiple different user personas). By functioning as a drop-in replacement for the [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md) advantage estimator, VPO trains the LLM to output a set of solutions that specialize to different trade-offs in the vector reward space.

---

## How VPO Works

### 1. The Problem with Scalar Rewards
Standard RL post-training methods optimize a single scalar reward. While this pushes the model to be very good at that specific metric, it often leads to "mode collapse" or low-entropy distributions. The model learns one "best" way to answer and repeats it. When placed inside a test-time search procedure that requires a variety of options to test against a novel reward function, the model fails to provide sufficient diversity.

### 2. Exploiting Vector-Valued Rewards
In many real-world scenarios, the underlying reward is not a single scalar but a vector. For example:
*   **Code Generation:** A solution might pass Test Case 1 but fail Test Case 2, while another solution passes Test Case 2 but fails Test Case 1. The reward is a vector of correctness scores.
*   **Alignment:** A response might be highly helpful (Reward A) but slightly less harmless (Reward B), while another response prioritizes harmlessness over helpfulness.

VPO leverages these vector-valued rewards explicitly during training rather than flattening them into a single scalar average.

### 3. Training for Diverse Specialization
VPO trains the LLM to output a *set* of solutions. Crucially, it encourages individual solutions within that set to specialize in different trade-offs across the vector reward space.
Instead of trying to find one solution that weakly satisfies all criteria, VPO produces a diverse portfolio of strong solutions. When passed to a test-time search procedure, the search algorithm can select the specific solution that perfectly matches the downstream requirements.

### 4. Performance and Unlocking Capabilities
Across multiple tasks, VPO matches or beats the strongest scalar RL baselines on test-time search metrics (such as `pass@k` and `best@k`). Notably, the performance gap between VPO and scalar baselines widens as the search budget grows. For complex evolutionary search procedures, VPO models unlock problems that standard GRPO-trained models cannot solve at all.

---

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
**Why you care:** If you are building agents that utilize heavy inference-scaling or evolutionary search (like AlphaEvolve), standard GRPO models will bottleneck your performance due to lack of generation diversity. VPO directly optimizes for the diverse rollouts your search algorithms need to find the global optimum.
**Action:** Replace your standard GRPO advantage estimators with VPO when fine-tuning your reasoning models. Feed vector-valued rewards (like individual unit test results rather than an aggregated pass rate) directly into the optimization step to maximize test-time scaling returns.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
**Why you care:** At first glance, inference-time search seems like the opposite of cost optimization. However, by training a smaller model with VPO, you generate a highly diverse set of initial candidates in parallel. A lightweight verifier can then pick the best answer from this diverse pool faster and cheaper than running a massive monolithic model to try and guess the single right answer.
**Action:** Consider architectures where a smaller, VPO-tuned model generates `N` diverse candidate solutions (e.g., code snippets), and a fast, deterministic verifier (like a compiler or simple test suite) selects the correct one, bypassing the need for ultra-large models for specific tasks.

### 💻 THE EVERYDAY PROMPT ENGINEERS
**Why you care:** When models are trained exclusively on scalar rewards, prompting them to "give me 5 *different* ways to solve this" often results in 5 variations of the exact same underlying logic. Models trained with techniques like VPO will natively understand how to span the solution space.
**Action:** When using models optimized for diversity, take advantage of generating multiple `N` responses (setting `n > 1` in the API or regenerating in the UI). You are far more likely to see genuinely distinct reasoning paths and trade-offs in the responses.

---

## References
*   [Vector Policy Optimization: Training for Diversity Improves Test-Time Search (arXiv:2605.22817v1)](http://arxiv.org/abs/2605.22817v1)

See also: [Group Relative Policy Optimization (GRPO)](../concepts/group-relative-policy-optimization.md)
See also: [Inference-Time Compute: The New Scaling Law](../concepts/inference-time-compute.md)
