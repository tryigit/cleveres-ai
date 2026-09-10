# When Models Edit Too Much: On the Fidelity of Minimal Code Edits

## TL;DR
While large language models (LLMs) are highly capable of fixing code bugs, they often suffer from "over-editing", meaning they rewrite or refactor code far beyond what is strictly necessary to solve the issue. This paper investigates this phenomenon, revealing that even advanced models like GPT-5.5 tend to increase cognitive complexity and Levenshtein distance unnecessarily, despite achieving high Pass@1 rates. By establishing "edit fidelity" as a measurable axis of code-repair quality, the authors demonstrate that while supervised fine-tuning overfits, reinforcement learning (RL) successfully trains models to maintain a strong trade-off between out-of-domain edit fidelity and performance retention.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For those fine-tuning specialized coding agents, prioritizing edit fidelity alongside correctness via RL optimization yields models that produce much cleaner, minimal patches. This improves automated workflows where minimizing diff sizes is critical for stability.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
By employing system prompts or post-training strategies focused on preservation and minimal editing, developers may reduce the length of generated outputs for code repair tasks, potentially yielding faster inference times and lower API costs per issue resolved.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
When asking an LLM to fix a bug, explicitly instruct it to "make the minimal necessary changes and preserve the original structure" to prevent the model from completely refactoring your function and introducing unwanted complexity.

See also: [SWE-Review: Closing the Loop on Issue Resolution with Agentic Code Review](swe-review-agentic-code-review.md)

See also: [Diffs vs. Whole Files: An Empirical Comparison of Iterative Edit-Based and Direct Generation for Flutter/Dart Code Models](diffs-vs-whole-files.md)

## References
* [When Models Edit Too Much: On the Fidelity of Minimal Code Edits](https://arxiv.org/abs/2609.04061)
