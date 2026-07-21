# SWE-Pruner Pro: The Coder LLM Already Knows What to Prune

## TL;DR
**SWE-Pruner Pro** is a technique that directly utilizes a coding agent's internal representations to prune irrelevant context (such as noisy tool outputs) dynamically. By attaching a small classification head to the agent, it saves up to 39% of prompt and completion tokens while preserving task quality and occasionally boosting resolve rates, all without needing an external classifier.

## The Problem with Context Pruning
Managing long context in coding agents (like those benchmarked on SWE-Bench) is crucial because execution logs, grep outputs, and file reads can quickly overwhelm the context window. Previous methods like SWE-Pruner attempted to solve this by attaching a separate code classifier to prune the inputs. However, running a completely separate model adds unnecessary complexity and overhead to the pipeline.

## The Solution: Self-Pruning Agents
Researchers discovered that the coding agent itself already encodes internal representations indicating the relevance of code context when it reads tool output.

Based on this insight, **SWE-Pruner Pro** prunes tool outputs directly inside the agent:
1.  **Internal State Leverage:** It takes the agent's own internal representations and passes them through a small classification head.
2.  **Keep-or-Prune Labeling:** This small head turns those representations into a "keep-or-prune" label for each line of tool output.
3.  **Length-Aware Embedding:** The system uses a length-aware embedding keyed to each tool output's line count to make accurate pruning decisions.

Across open-weight backbones and multi-turn benchmarks, SWE-Pruner Pro saved up to 39% of prompt and completion tokens with bounded inference overhead. Additionally, on models like MiMo-V2-Flash, the technique raised the SWE-Bench Verified resolve rate by +3.8% and long-context Oolong accuracy by +2.2 points, proving that removing noise actively helps the model reason.

## Real-World Application & Who Should Care

*   🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):** Agent developers can implement in-agent pruning to not only save context window space but actually improve the reasoning capability and resolve rate of their autonomous coding agents by filtering out distracting logs.
*   💸 **THE COST & LATENCY OPTIMIZERS (API Developers):** Saving 39% on prompt and completion tokens across a swarm of multi-turn coding agents results in massive API cost reductions and latency improvements.
*   🧑‍💻 **THE EVERYDAY PROMPT ENGINEERS:** When using tools like Claude Code or Aider, aggressively clearing out irrelevant grep or test failure logs manually mimics this behavior, keeping the model focused on the actual bug.

## References
* [SWE-Pruner Pro: The Coder LLM Already Knows What to Prune](https://arxiv.org/abs/2607.18213)

See also: [Context Caching: The Cost-Cutting Superpower for Long-Context AI](../techniques/context-caching.md)
