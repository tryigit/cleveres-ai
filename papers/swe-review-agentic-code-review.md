# SWE-Review: Closing the Loop on Issue Resolution with Agentic Code Review

## TL;DR
Coding agents increasingly generate pull requests (PRs) for real-world software issues, yet one-shot PR generation remains open-loop: the PR is proposed without systematic review, diagnosis, or revision. SWE-Review introduces a framework for closing this loop with agentic code review. Given an issue and an AI-generated PR, a reviewer agent explores the repository, decides whether the PR should be accepted, and provides structured feedback for revision.

## Real-World Application & Who Should Care

* 🚀 **The Performance Monsters (SOTA Seekers):** Agentic code review continuously improves PRs through a generate-review-revise loop, outperforming single-turn fixed-context review in both decision accuracy and resolve rate after revision. It also enables effective and efficient test-time scaling for issue-resolution models.
* 💰 **The Cost & Latency Optimizers (API Developers):** By improving decision accuracy and resolve rate, agentic code review can reduce the number of failed PRs and the overall cost of issue resolution, leading to a more efficient and automated software development process.
* 💻 **The Everyday Prompt Engineers:** For end-users of AI coding assistants, this means more reliable and robust code generation. The AI not only writes code but also systematically reviews and revises it, leading to higher quality outputs with less manual intervention required.

See also: [Agent-as-a-Judge: Evaluate Agents with Agents](agent-as-a-judge.md)

## References
* [SWE-Review: Closing the Loop on Issue Resolution with Agentic Code Review](https://arxiv.org/abs/2607.06065)
