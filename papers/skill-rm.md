# Skill-RM: Unifying Heterogeneous Evaluation Criteria via Agent Skill

**Category:** Frontier Research & Papers
**Published:** 2026-06-02

## TL;DR
Reward models (RMs) are crucial for aligning Language Models via [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md), but they often struggle when evaluation relies on heterogeneous criteria like rule-based verifiers, complex rubrics, procedural checklists, and ground-truth references. "Skill-RM" reformulates reward modeling from a static evaluation task into the execution of a reusable, dynamic "Reward-Evaluation Skill." By treating reward computation as an agentic task, Skill-RM intelligently selects, orchestrates, and aggregates diverse forms of evidence, outperforming traditional static judge models on benchmarks and downstream applications like best-of-N selection.

---

## The Challenge: Fragmented Reward Criteria

In post-training pipelines involving RLHF or [Direct Preference Optimization (DPO)](../concepts/direct-preference-optimization.md), the quality of the aligned LLM is strictly bottlenecked by the quality of the reward signal.

Historically, different tasks require fundamentally different ways to calculate a "reward":
*   **Math/Code:** Often requires a deterministic rule-based verifier or exact ground-truth matching.
*   **Creative Writing:** Requires a subjective rubric evaluating style, tone, and formatting.
*   **Instruction Following:** Requires procedural checklists to ensure every specific constraint was met.

Traditional reward models are monolithic; they attempt to learn all these static evaluations directly from training data. They struggle to dynamically pull in external verifiers or switch evaluation strategies based on the specific constraints of the prompt, leading to inconsistent rewards and hallucinated evaluations.

## The Solution: Reward Modeling as an Agentic Skill

The researchers propose **Skill-RM**, which shifts the paradigm from "predict a score" to "execute an evaluation process."

Instead of forcing a single neural network to implicitly handle all heterogeneous criteria, Skill-RM models the reward process as a structured agentic workflow:
1.  **Dynamic Evidence Orchestration:** When presented with a prompt and a response, Skill-RM analyzes what *type* of evaluation is required.
2.  **Resource Selection:** It actively selects the necessary heterogeneous resources (e.g., calling a Python verifier for code, referencing a ground-truth dataset, or applying a specific rubric for formatting).
3.  **Aggregation:** It systematically aggregates the gathered evidence to produce a final, consistent, and highly transparent reward score.

By treating the reward model as an agent executing a "Reward-Evaluation Skill," the framework achieves superior performance, consistency, and transparency compared to traditional baseline judge models.

---

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers)**
Researchers building custom RL pipelines for complex, multi-modal, or highly specialized domains can use the Skill-RM framework to integrate their bespoke deterministic verifiers directly into the reward loop, achieving much higher alignment ceilings than using LLM-as-a-judge alone.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers)**
While running an agentic reward model is slower than a static forward pass, API developers can use Skill-RM during the *training* and *data curation* phases (e.g., scoring synthetic data) to create much higher-quality datasets, which are then used to train smaller, highly optimized deployment models.

💻 **THE EVERYDAY PROMPT ENGINEERS**
When building custom agentic workflows or complex prompt chains, everyday users can adopt this mental model: don't just ask an LLM to "grade this output." Instead, prompt the LLM to act as an evaluator agent that first identifies *how* to grade the output, gathers evidence (like running a code snippet), and then issues a final verdict.

---

**Sources:**
*   arXiv: https://arxiv.org/abs/2606.03980v1
*   Code: https://github.com/Qwen-Applications/Skill-RM
