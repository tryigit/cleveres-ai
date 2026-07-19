# Rethinking the Evaluation of Harness Evolution for Agents

## TL;DR
Automatic harness evolution aims to iteratively optimize the configuration or "harness" of an LLM agent to improve its performance. However, recent evaluation practices have a critical flaw: they often compare the evolved harness against standard baselines without accounting for the massive additional compute and task feedback used during the search. When compared fairly against simple test-time scaling baselines under matched budgets, harness evolution fails to consistently outperform and struggles to generalize to held-out tasks.

## The Core Concept: Redefining Harness Evolution Evaluation
Harness evolution is fundamentally an iterative search procedure. It evaluates and refines candidate agent configurations using feedback from tasks. Because this search uses inference compute - similar to agentic test-time scaling strategies explored in [LLMs Improving LLMs: Agentic Discovery for Test-Time Scaling](../papers/llms-improving-llms.md) - it is crucial to normalize the comparison. If a new harness evolution technique uses 1,000 extra inference steps and task feedback to find a better configuration, it must be compared against a standard agent running with 1,000 steps of standard test-time scaling, not just a zero-shot or fixed-budget baseline.

## The Real Problem: Confused Baselines and Overfitting
The study identifies two major concerns with current evaluation protocols:
1. **Unmatched Baselines:** The gains attributed to "better harness design" might actually just be the result of additional search compute. When matching feedback and inference budgets, simple task-level search often matches or beats the complex harness evolution.
2. **Benchmark Overfitting:** Existing methods frequently use the same public benchmark to both search for harness configurations and evaluate the final performance. Experiments on Terminal-Bench 2.1 using [OpenAI GPT-5.4 mini and nano: High-Volume Efficiency](../models/gpt-5-4-mini-and-nano.md) and [Claude Opus 4.6: The Long-Horizon Reasoning Engine](../models/claude-opus-4-6.md) demonstrate that improvements discovered via harness evolution on a specific task set rarely generalize to held-out tasks, confirming severe overfitting.

## Real-World Application & Who Should Care

(Rocket) **THE PERFORMANCE MONSTERS (SOTA Seekers):**
Researchers building autonomous agents should prioritize raw search compute or established test-time scaling over complex harness evolution if the goal is pure capability on held-out tasks. Relying on evolved harnesses may lead to false confidence if not evaluated on independent task splits.

(Money) **THE COST & LATENCY OPTIMIZERS (API Developers):**
Iterative harness evolution consumes significant API budgets during the search phase. Knowing that it does not consistently beat simple search when budgets are matched allows teams to avoid over-engineering agent scaffolding, saving time and compute costs.

(Person at Computer) **THE EVERYDAY PROMPT ENGINEERS:**
This specific evaluation protocol is targeted at developers building automated agent frameworks rather than manual prompting, so it is less directly applicable to daily chat interface usage.

## References
* [Rethinking the Evaluation of Harness Evolution for Agents](https://arxiv.org/abs/2607.12227)
