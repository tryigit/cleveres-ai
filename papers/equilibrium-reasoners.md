# Equilibrium Reasoners: Learning Attractors Enables Scalable Reasoning

## TL;DR
**Equilibrium Reasoners (EqR)** introduce a novel mechanistic framework for [Inference-Time Compute](../concepts/inference-time-compute.md). Rather than relying on external verifiers or hardcoded task specific priors, EqR scales reasoning by iteratively updating a latent state towards stable fixed points, or "task-conditioned attractors". By unrolling up to the equivalent of 40,000 layers, this approach dramatically boosts accuracy on complex tasks, jumping from 2.6% for standard feedforward models to over 99% on Sudoku-Extreme.

---

## The Concept: Latent Dynamical Systems and Attractors

Scaling test-time compute is a powerful paradigm, but the internal mechanisms enabling models to generalize beyond memorized patterns have remained elusive. The EqR framework hypothesizes that generalizable reasoning emerges from learning *task-conditioned attractors*.

In this context, reasoning is treated as a latent dynamical system. The model iteratively updates its internal state, navigating towards stable fixed points. These fixed points represent valid solutions to the problem at hand.

### Axes of Scaling
EqR scales internal dynamics along two primary axes:
1.  **Depth:** Running more iterations to allow the latent state to converge on an attractor.
2.  **Breadth:** Aggregating stochastic trajectories from multiple different initializations to find the most stable solution.

Empirically, the performance gains from test-time scaling are tightly coupled with stronger convergence toward these solution-aligned attractors.

---

## Adaptive Compute Allocation

A key benefit of the attractor perspective is the ability of neural networks to adaptively allocate test-time compute based on the specific difficulty of the task.

*   **Simple Cases:** The latent state converges rapidly, often within 1 to 5 iteration steps.
*   **Harder Cases:** The model benefits from massive test-time scaling. By unrolling the iterative process, the model can simulate the depth of tens of thousands of layers (up to 40,000 layers in experiments), solving problems that completely stump traditional feedforward architectures.

This learned attractor landscape provides a clear mechanistic lens for understanding how and why iterative latent models succeed at scalable reasoning.

---

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS
For researchers and engineers tackling the hardest reasoning benchmarks (like Sudoku-Extreme or advanced mathematics), EqR offers a pathway to massive performance gains. By heavily scaling depth and unrolling thousands of latent iterations, you can unlock reasoning capabilities far beyond the limits of standard feedforward models, without needing complex external verifiers.

### 💰 THE COST & LATENCY OPTIMIZERS
This framework natively supports adaptive compute. Because simple tasks converge to their attractors in just 1 to 5 steps, you do not have to pay the latency and compute cost of a massive model for easy queries. The system automatically spends compute only when the landscape requires it, optimizing your API deployment costs.

### 💻 THE EVERYDAY PROMPT ENGINEERS
While EqR is a backend architectural innovation, it reinforces the value of giving AI systems "room to think". Future models built on these principles will internally iterate through latent states. For prompt engineers, this means complex tasks will be handled more autonomously by the model's internal convergence mechanisms, reducing the need for elaborate step-by-step prompting chains.

---
**Sources:**
* arXiv ID: 2605.21488
