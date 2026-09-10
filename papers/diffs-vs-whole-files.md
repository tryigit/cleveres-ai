# Diffs vs. Whole Files: An Empirical Comparison of Iterative Edit-Based and Direct Generation for Flutter/Dart Code Models

## TL;DR
When training code models, developers can choose between "direct generation" (generating the entire modified file at once) or "iterative diff-based generation" (emitting search/replace edits sequentially). While diffs seem more token-efficient and human-like, this empirical comparison reveals that direct whole-file generation substantially outperforms diff-based generation across all metrics, including pass rates and correctness. The study found a single mechanism explaining when diffs *are* competitive: "task locality." Diff-based generation only succeeds on short, spatially localized edits (like basic refactoring or edge-case fixes) that require very few steps.

## Real-World Application & Who Should Care

### (Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
**Why you care:** If you are training new foundational code models (like a specialized Qwen-Coder or Starcoder variant), this paper provides strong empirical evidence that you should default to whole-file generation objectives for maximum performance, reserving diff-based objectives strictly for highly localized sub-tasks.

### (Money) THE COST & LATENCY OPTIMIZERS (API Developers):
**Why you care:** Diff-based generation is deeply attractive because it uses far fewer output tokens, saving immense API costs and latency. However, this paper warns that using diff-based generation to save money will severely degrade code quality on complex tasks. You must build routers that use whole-file generation for complex edits and only route to diff-based generation when you detect high "task locality."

### (Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
**Why you care:** When prompting tools like Claude or GPT for code, asking the model to "just output the git diff" or "only show the changed lines" might actually cause it to make more mistakes on complex tasks compared to letting it rewrite the entire file.

## References
* [Diffs vs. Whole Files: An Empirical Comparison of Iterative Edit-Based and Direct Generation for Flutter/Dart Code Models](https://arxiv.org/abs/2609.05779)

See also: [When Models Edit Too Much: On the Fidelity of Minimal Code Edits](edit-fidelity-in-code-repair.md)