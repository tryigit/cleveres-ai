# Sample Count Is Not Enough: Candidate-Generation Strategy Shapes the Energy and Performance of LLM Test-Time Scaling

**Category:** Frontier Research & Papers
**Date:** September 2026

## TL;DR
Test-time scaling improves large language model reasoning by generating and combining multiple candidate responses. Traditionally, the inference budget for this has been described simply by the number of generated candidates ($N$). However, empirical research reveals that $N$ alone is an insufficient metric. A study using models like Phi-3-mini and Qwen2.5-1.5B demonstrates that while increasing $N$ strictly improves reasoning accuracy, the *generation schedule* dictates the true system cost. For example, executing 8 candidates serially (one by one) uses up to 4.86x as much GPU energy and introduces up to 6.12x more latency compared to generating all 8 candidates in a single batched call, despite yielding the same reasoning performance. Therefore, efficient multi-candidate test-time scaling requires maximizing batch sizes per generation call rather than simply increasing sequential iterations.

---

## Real-World Application & Who Should Care

### (Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
**Why you care:** When pushing the limits of test-time scaling on mathematical or logical reasoning tasks, your true bottleneck is not the model's theoretical maximum accuracy, but the latency and memory bandwidth of generating thousands of candidates.
**Action:** When designing environments for test-time scaling, prioritize heavily batched, independent candidate generation over sequential loops, assuming VRAM allows it. Optimize your sampling algorithms to execute in the widest possible parallel configurations to maximize throughput without sacrificing reasoning gains.

### (Money) THE COST & LATENCY OPTIMIZERS (API Developers):
**Why you care:** Test-time scaling is notoriously expensive. If you are deploying an agent that uses a "Best-of-N" or similar sampling strategy, executing those generations serially destroys your latency budget and burns massive amounts of GPU energy (and therefore cloud dollars).
**Action:** Never run test-time candidate generation sequentially unless the next step strictly depends on the previous output. Enforce maximum parallel batching for all independent candidate generation steps in your inference engine. Evaluate your systems using generation schedule and GPU-level metrics, not just raw candidate count.

### (Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
**Why you care:** If you use tools or scripts that automatically prompt a model multiple times to get the best answer (like self-consistency prompting), the way those tools are built affects how fast you get your answer.
**Action:** While you might not control the underlying API architecture, be aware that tools requesting 10 separate API calls sequentially will be significantly slower than advanced platforms capable of generating multiple divergent completions simultaneously.

---

## References
*   [Sample Count Is Not Enough: Candidate-Generation Strategy Shapes the Energy and Performance of LLM Test-Time Scaling](https://arxiv.org/abs/2609.19499)

See also: [Inference-Time Compute: The New Scaling Law (System 2 Thinking)](../concepts/inference-time-compute.md)
See also: [LoopCoder-v2: Only Loop Once for Efficient Test-Time Computation Scaling](loopcoder-v2.md)
