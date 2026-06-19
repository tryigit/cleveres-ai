# FAPO: Fully Autonomous Prompt Optimization of Multi-Step LLM Pipelines

**Category:** Frontier / Papers
**Key Concepts:** Prompt Optimization, LLM Pipelines, Multi-Step Reasoning, Autonomous Agents, Claude Code

## TL;DR
**FAPO** (Fully Autonomous Prompt Optimization) is a state-of-the-art framework for optimizing multi-step LLM pipelines. Because multi-step pipelines can fail due to complex interactions among reasoning, retrieval, and formatting, traditional prompt-only optimizations often miss structural bottlenecks. FAPO uses an autonomous agent, like [Claude Code](../news/claude-code.md), inside a standardized codebase to repeatedly evaluate, diagnose, propose scoped changes (starting with prompts and escalating to structural changes if needed), and validate pipeline variants against a score function.

---

## The Core Concept: Moving Beyond Prompt-Only Optimization

When an LLM pipeline fails, it is often not just because of a bad prompt, but because of how different steps - such as reasoning, tool use, and formatting - interact. Typical prompt optimization methods only tune the text instructions, which may not be enough if the fundamental structure or tool sequence is flawed.

FAPO takes a broader approach by allowing an autonomous agent to rewrite both prompts and, critically, pipeline logic.

### 1. Diagnosis and Scoped Changes
FAPO operates by inspecting the intermediate steps of a failing pipeline. When it identifies a failure, it performs attribution to locate the bottleneck. It begins by proposing simple prompt edits. If it determines that the prompt optimization is insufficient, it escalates to changing the chain structure within a permitted scope.

### 2. Autonomous Iteration
Running within a standardized codebase, the framework repeatedly evaluates the current pipeline against a scoring function, proposes changes, and validates the new variant. This creates an automated loop of continuous improvement.

## Performance vs Baseline (GEPA)

FAPO significantly outperforms baseline methods like GEPA across a range of tasks:
*   **General Tasks:** FAPO beats GEPA in 15 of 18 model-benchmark comparisons. The mean FAPO-GEPA gain is +14.1 percentage points.
*   **Structural Advantages:** In 6 comparisons (HoVer and IFBench) where FAPO had to escalate to structural changes, it won all 6 with a mean gain of +33.8 percentage points.
*   **Security Tasks:** On CTIBench-RCM (a CVE-to-CWE task), FAPO lifted test accuracy by +4.0 pp on GPT-5, +7.1 pp on Foundation-Sec-8B-Instruct, and +2.0 pp on Foundation-Sec-8B-Reasoning.

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
**Unlocking Maximum Pipeline Robustness.**
If you are building complex multi-step agents or reasoning chains, FAPO provides a programmatic way to automatically discover the optimal structure and prompting strategy. It allows you to squeeze out every bit of accuracy by identifying when a structural change (like breaking a task into smaller steps) is needed over just changing a prompt.

### 💰 For The Cost & Latency Optimizers (API Developers)
**Automated Pipeline Efficiency.**
By analyzing where a pipeline fails or is inefficient, FAPO can autonomously restructure the chain - potentially combining steps or dropping unnecessary ones. This helps in building pipelines that are not only more accurate but hit the API less frequently by optimizing the tool-use structure.

### 💻 For The Everyday Prompt Engineers
**Learning from Autonomous Diagnostics.**
While FAPO is a developer tool, everyday prompt engineers can learn from its approach. When a complex prompt fails, do not just tweak the wording. Ask yourself if the structural flow of the reasoning or the order of operations needs to change.

---

## References
* [FAPO: Fully Autonomous Prompt Optimization of Multi-Step LLM Pipelines](https://arxiv.org/abs/2606.19605)
