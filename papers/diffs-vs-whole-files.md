# Diffs vs. Whole Files: An Empirical Comparison of Iterative Edit-Based and Direct Generation for Flutter/Dart Code Models

## TL;DR
When training code models, developers can choose between "direct generation" (generating the entire modified file at once) or "iterative diff-based generation" (emitting search/replace edits sequentially). In this comparison of two custom models fine-tuned on a Flutter/Dart dataset with unequal token budgets and no feedback, direct whole-file generation outperformed diff-based generation across the reported metrics, including pass rates and correctness. Within that setup, task locality explained when diffs were competitive: they worked on short, spatially localized edits (like basic refactoring or edge-case fixes) that required very few steps.

## Real-World Application & Who Should Care

### (Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
**Why you care:** For the two custom models in this Flutter/Dart, unequal-token-budget, no-feedback comparison, whole-file generation performed better except on highly localized sub-tasks. This result does not by itself prescribe training objectives for foundational models or other model-training settings.

### (Money) THE COST & LATENCY OPTIMIZERS (API Developers):
**Why you care:** In the evaluated no-feedback setup, the lower output-token cost of diff-based generation came with lower reported quality on less-local Flutter/Dart tasks. The results do not establish that format routers are required, or that the same trade-off applies in other deployments.

### (Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
**Why you care:** These findings should not be generalized to feedback-driven agents, other programming languages, or other repositories; the study evaluated two custom models on Flutter/Dart without feedback.

## References
* [Diffs vs. Whole Files: An Empirical Comparison of Iterative Edit-Based and Direct Generation for Flutter/Dart Code Models](https://arxiv.org/abs/2609.05779)

See also: [When Models Edit Too Much: On the Fidelity of Minimal Code Edits](edit-fidelity-in-code-repair.md)
