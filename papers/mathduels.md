# MathDuels: Evaluating LLMs as Problem Posers and Solvers

**Category:** Frontier Research & Papers
**Tags:** Benchmarks, Evaluation, Self-Play, Reasoning

## TL;DR
MathDuels is a novel self-play benchmark that evaluates Large Language Models (LLMs) in a dual role: not just as solvers of math problems, but as *authors* of them. As frontier models increasingly max out static math benchmarks, this approach differentiates model capabilities by having them adversarially generate problems for each other. The difficulty scales automatically with the strength of the participating models, creating a continuously evolving evaluation landscape that reveals capability separations invisible in traditional, single-role benchmarks.

---

## The Challenge: Hitting the Ceiling
Existing evaluations for LLM reasoning typically rely on static sets of math problems (like MATH or GSM8K). However, frontier language models are achieving near-ceiling performance on these benchmarks. This causes a critical issue: existing evaluations can no longer effectively differentiate between the capabilities of top-tier models because they are all "maxing out" the test.

Furthermore, static benchmarks cast models solely as *solvers* of fixed problem sets, ignoring their potential ability to construct logical structures or identify edge cases in problem formulation.

## The MathDuels Framework: Dual-Role Evaluation
MathDuels addresses this by introducing a dynamic, self-play environment where models occupy dual roles:

1.  **Authoring (Problem Posing):** Under adversarial prompting, each model generates mathematical problems designed to challenge other models.
2.  **Solving:** Each model attempts to solve the problems authored by all other participants in the arena.

### The Generation Pipeline
To ensure the quality and validity of the generated problems, MathDuels uses a three-stage pipeline:
*   **Meta-prompting:** Initializing the problem-generation context.
*   **Problem Generation:** The model authors the mathematical problem.
*   **Difficulty Amplification:** The model is prompted to increase the complexity or introduce edge cases.

Crucially, an independent verifier validates the generated problems to exclude ill-posed or unsolvable questions.

### Dynamic Scoring with the Rasch Model
MathDuels uses a Rasch model to jointly estimate both the *solver abilities* and the *problem difficulties*. The quality of a model as an author is derived from the calculated difficulty of the problems it successfully posed.

## Key Findings
Experiments across 19 frontier models using the MathDuels framework revealed significant insights:
*   **Decoupled Capabilities:** A model's ability to solve problems is only partially correlated with its ability to author difficult problems.
*   **Revealing Hidden Separations:** The dual-role evaluation exposes capability separations between models that appear identical on static benchmarks.
*   **Co-evolving Difficulty:** As newer, stronger models enter the MathDuels arena, they generate even harder problems that can defeat previously dominant solvers. This means the benchmark's difficulty naturally scales with the state-of-the-art, preventing it from saturating at a fixed ceiling.

---

## Real-World Application & Who Should Care

### 🚀 The Performance Monsters (SOTA Seekers)
**Why you care:** If you are developing frontier models, static benchmarks are no longer sufficient to prove your model's superiority. MathDuels demonstrates that true reasoning capability includes the ability to *formulate* complex logic, not just resolve it.
**Action:** Incorporate self-play and adversarial generation into your training and evaluation pipelines. Consider how your model's "authoring" capabilities reflect its underlying understanding of [Chain-of-Thought](../concepts/chain-of-thought.md) reasoning.

### 💰 The Cost & Latency Optimizers (API Developers)
**Why you care:** Evaluating models using dynamic, self-play benchmarks is significantly more expensive than running a static test, requiring multiple generation passes, adversarial prompting, and independent verification.
**Action:** Use dynamic evaluation frameworks sparingly for final validation of major model updates. For continuous integration or minor tweaks, stick to static subsets or use techniques like [Agent-as-a-Judge](agent-as-a-judge.md) for offline evaluation of specific tasks.

### 💻 The Everyday Prompt Engineers
**Why you care:** MathDuels highlights that models capable of solving complex problems might also be uniquely suited to *creating* training data or challenging scenarios for you.
**Action:** Use strong reasoning models not just to answer your questions, but to generate edge cases, synthetic data, or practice problems. Prompt them adversarially to find the limits of your own logic or code.

---

## Sources
*   [arXiv: 2604.21916v1 - MathDuels: Evaluating LLMs as Problem Posers and Solvers](https://arxiv.org/abs/2604.21916)
