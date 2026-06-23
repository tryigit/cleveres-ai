# Self-Compacting Language Model Agents

## TL;DR
Long agent traces, consisting of extensive [Chain-of-Thought (CoT): Eliciting Reasoning in LLMs](../concepts/chain-of-thought.md) and tool calls, accumulate "stale content" that anchors subsequent generations and eventually exhausts the context window. Existing solutions use fixed-interval compaction triggered at an arbitrary token threshold, often discarding critical partial results mid-search. "SelfCompact" is a scaffold that allows the model itself to decide when and how to compact its context. By pairing an inference-time compaction tool with a lightweight rubric that tells the model when to fire (e.g., when a sub-task resolves) and when to suppress (e.g., mid-derivation), models can effectively manage their own working memory. This approach matches or exceeds fixed-interval summarization while cutting per-question token costs by 30-70%.

---

## The Problem of Rotting Context

As autonomous agents work through long-horizon problems, they generate massive logs of intermediate reasoning.
1.  **Stale Anchors:** Irrelevant or outdated reasoning steps remain in the context, potentially distracting the model or anchoring it to failed hypotheses.
2.  **Context Exhaustion:** The sheer volume of tokens eventually exceeds the model's maximum context window.
3.  **The Blind Truncation Flaw:** Current scaffolds blindly summarize or truncate context every $N$ tokens. This ignores the structure of the trajectory, risking the deletion of vital information right in the middle of a complex derivation.

## The SelfCompact Scaffold

SelfCompact exposes a "meta-cognitive gap": unprompted models cannot reliably tell when their own context is rotting, but providing a lightweight rubric closes this gap without requiring any fine-tuning.

It relies on two essential, paired components:
*   **The Compaction Tool:** A function the model can invoke to summarize the accumulated context. (If provided alone, models use it erratically or unhelpfully).
*   **The Rubric:** A set of rules specifying *when* to compact (e.g., a sub-task is complete, or the trajectory is converging) and when *not* to compact (e.g., mid-derivation, or when the agent is stuck).

Together, they elicit adaptive compaction. In empirical tests on math and agentic search benchmarks, SelfCompact improved scores over a no-summarization baseline by up to 18.1 points while massively reducing token consumption.

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
If you are orchestrating long-horizon agents for deep research or complex coding tasks, implementing a SelfCompact-style rubric allows your agents to maintain cleaner, more relevant context windows. This directly translates to higher accuracy on complex benchmarks, as the model isn't continually distracted by its own stale, early-stage brainstorming.

### 💰 For The Cost & Latency Optimizers (API Developers)
This technique is a direct cost-saving measure. By allowing the model to aggressively compact its context only when safe to do so, you dramatically reduce the number of tokens processed in subsequent generation steps. SelfCompact demonstrated 30-70% lower per-question token costs compared to fixed-interval baselines, directly impacting your API bill.

### 🧑‍💻 For The Everyday Prompt Engineers
When designing complex multi-step prompts or custom GPTs, you can manually apply this principle by explicitly instructing the model: "When you finish analyzing a sub-component, summarize your findings so far, discard the raw logs, and only use the summary for the next step."

---

## References
*   [Self-Compacting Language Model Agents (arXiv:2606.23525)](https://arxiv.org/abs/2606.23525)
