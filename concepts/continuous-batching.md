# Continuous Batching (Iteration-Level Scheduling)

**Category:** Core Concepts & Architecture
**Key Concepts:** KV Cache, Memory Management, LLM Serving, Inference Optimization, Iteration-Level Scheduling

## TL;DR
**Continuous Batching**, also known as **Iteration-Level Scheduling**, is a transformative scheduling technique for Large Language Model (LLM) inference. First introduced in the 2022 OSDI paper describing the **Orca** system, it abandons the traditional "static batching" approach where all requests in a batch must finish before a new batch begins. Instead, continuous batching operates at the granularity of a single forward pass (an iteration). When one request in a batch emits its final token, it is immediately evicted, and a new request is slotted into the batch for the very next iteration. This ensures near 100% GPU utilization and significantly boosts overall system throughput.

---

## The Problem: Static Batching Inefficiencies

To maximize GPU hardware utilization, inference servers group multiple user requests together into a "batch."

In traditional **Static Batching**, the server gathers a group of requests, processes them simultaneously, and waits until every single request in the batch has finished generating its output before starting the next batch.

The major flaw in static batching is that output sequence lengths vary wildly. For instance, if you batch Request A (generating 10 tokens) and Request B (generating 500 tokens), Request A will finish almost immediately. For the remaining 490 iterations, the GPU is only computing Request B. The compute slot originally occupied by Request A sits completely idle, wasting precious processing power.

## How Continuous Batching Solves It

The Orca system introduced a paradigm shift called **Iteration-Level Scheduling**:

1. **Iteration Granularity:** The scheduler does not wait for an entire response to finish. Instead, it evaluates the batch after *every single iteration* (every generated token).
2. **Immediate Eviction:** As soon as any sequence in the active batch hits its End-Of-Sequence (EOS) token, the system instantly ejects it from the active batch.
3. **Continuous Ingestion:** The scheduler immediately pulls a new request from the incoming queue and slots it into the newly vacated space for the next iteration.

This means the batch is constantly evolving, fluidly swapping finished requests out and new requests in, ensuring the GPU is always working on a full batch of tokens.

### Synergy with PagedAttention
While continuous batching eliminates *compute* fragmentation, it does not inherently solve *memory* fragmentation (the KV Cache). The true breakthrough in modern serving occurred when continuous batching was combined with memory-management techniques like **[PagedAttention](paged-attention.md)** (popularized by vLLM). Together, they eliminate both compute waste and memory waste, enabling massive scaling of inference workloads.

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
**Why you care:** Continuous batching fundamentally alters how you measure throughput. By operating at the iteration level, you can achieve up to 36x higher throughput compared to static batching without degrading the latency of individual tokens.
**Action:** When designing custom serving pipelines for extremely high volume, ensure your serving engine supports iteration-level scheduling. This is particularly crucial when dealing with high-variance workloads where response lengths are unpredictable.

### 💰 For The Cost & Latency Optimizers (API Developers)
**Why you care:** Compute idle time directly translates to wasted money. Continuous batching ensures your expensive GPUs are saturated, drastically lowering the cost per generated token and maximizing your hardware ROI.
**Action:** Adopt modern inference engines like vLLM, Hugging Face TGI, or TensorRT-LLM, which have continuous batching built in. This allows you to serve significantly more concurrent users on a smaller hardware footprint.

### 💻 For The Everyday Prompt Engineers
**Why you care:** This technology is why you don't experience massive queue delays when using popular AI interfaces, even when millions of other users are generating complex code or long essays simultaneously.
**Action:** Understand that API latency may fluctuate slightly based on the total system load, but thanks to continuous batching, short prompts get processed and returned rapidly without being blocked by someone else's 10,000-word generation request.

---

## References
*   [Orca: A Distributed Serving System for Transformer-Based Generative Models (OSDI '22)](https://www.semanticscholar.org/paper/Orca%3A-A-Distributed-Serving-System-for-Generative-Yu-Jeong/9d7a75601e0e50dd68d40cfb8ef0e891dad797a6)
