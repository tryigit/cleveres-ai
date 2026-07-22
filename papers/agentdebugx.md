# AgentDebugX: An Open-Source Toolkit for Failure Observability, Attribution, and Recovery in LLM Agents

## TL;DR
Debugging LLM agents is notoriously difficult because the error often surfaces far downstream from the actual root cause. AgentDebugX introduces a closed-loop framework (Detect, Attribute, Recover, and Rerun) powered by DeepDebug, achieving state-of-the-art root-cause diagnosis. It allows developers to structurally investigate agent trajectories, find the true point of failure, and automatically apply repairs.

## Summary
Agent failures in complex, multi-step LLM workflows are challenging to diagnose. Existing tools can replay execution traces but fail to pinpoint why an agent deviated or how to fix it.

AgentDebugX is an open-source debugging framework designed to make agent failures observable and actionable. Its core engine, DeepDebug, conducts a multi-turn diagnosis using global trajectory understanding, structure-guided investigation, and cross-examination. This approach accurately identifies the specific step that derailed the process, rather than just the step where the error became visible.

In benchmarks, DeepDebug demonstrates significant improvements. On the "Who and When" benchmark using qwen3.5-9b, it reached 28.8% exact agent-and-step attribution accuracy, outperforming the strongest single-pass baseline (21.7%). On the GAIA benchmark, DeepDebug successfully repaired 13 out of 73 failed tasks in a single rerun, increasing overall accuracy from 55.8% to 63.6% compared to standard self-correction baselines.

The toolkit is highly accessible, offering a Python library, a CLI, a web console, and an installable agentic skill. It also features an opt-in Error Hub, allowing developers to share failure-diagnosis-repair bundles as reusable "debugging memory" for the community.

## Real-World Application & Who Should Care

### (Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers)
For researchers building complex, multi-agent systems, AgentDebugX's exact step attribution provides granular visibility into reasoning failures. DeepDebug's multi-turn diagnosis helps you understand exactly where your custom prompt or logic breaks down, allowing for highly targeted refinements to push frontier capabilities without getting lost in endless trace logs.

### (Money) THE COST & LATENCY OPTIMIZERS (API Developers)
AgentDebugX allows engineers to build self-healing pipelines. By integrating DeepDebug's recovery mechanisms, your background agents can autonomously detect and correct failures during a rerun. The Error Hub also lets your team build a shared debugging memory, reducing the time and token cost spent re-diagnosing recurring architectural flaws across different microservices.

### (Person at Computer) THE EVERYDAY PROMPT ENGINEERS
While primarily an infrastructure tool, the underlying concept is highly relevant. When your complex prompts fail in ChatGPT or Claude, do not just look at the final incorrect output. Cross-examine the earlier steps of the model's reasoning process. Identifying the exact "pivot point" where the model misunderstood the task allows you to adjust your prompt much more effectively than just rewriting the final instruction.

## References
* [AgentDebugX: An Open-Source Toolkit for Failure Observability, Attribution, and Recovery in LLM Agents](https://arxiv.org/abs/2607.18754)
See also:
* [Agent-as-a-Judge: Evaluate Agents with Agents](../papers/agent-as-a-judge.md)
* [Securing the AI Agent: A Unified Framework for Multi-Layer Agent Red Teaming](../papers/securing-the-ai-agent.md)
