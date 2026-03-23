# PagedAttention: Eliminating KV Cache Waste

**Category:** Core Concepts & Architecture
**Key Concepts:** KV Cache, Memory Management, LLM Serving, Inference Optimization

## TL;DR
**PagedAttention** is a memory management technique introduced by vLLM that drastically improves the efficiency of serving Large Language Models (LLMs). It solves the problem of Key-Value (KV) cache memory fragmentation and over-allocation by borrowing the concept of "virtual memory" and "paging" from operating systems. Instead of storing the KV cache in contiguous blocks of memory, PagedAttention stores it in non-contiguous "pages." This simple yet powerful architectural change reduces KV cache memory waste from 60-80% down to under 4%, enabling a 2-4x increase in inference throughput without sacrificing accuracy.

---

## The Problem: KV Cache Fragmentation
*See also: **[StreamingLLM & Attention Sinks](../concepts/streaming-llm.md)** for a deep dive into finite context windows and KV cache eviction.*


During autoregressive generation in a standard **[Transformer Architecture](transformer-architecture.md)**, the model must store the computed Keys and Values of all previous tokens to avoid recalculating them for every new word. This storage is called the **KV Cache**.

As context windows and batch sizes grow, the KV Cache becomes a massive memory bottleneck. A 70B parameter model with an 8K context can require roughly 20GB of KV cache memory per request. When serving a batch of 32 requests, this balloons to over 600GB, often exceeding the model weights themselves.

Traditional LLM serving systems allocate a contiguous block of memory for the maximum possible sequence length of a request. Because the final length of a generated response is unpredictable, this leads to two major problems:
1.  **Internal Fragmentation:** Memory is allocated but never used if the output is shorter than the maximum length.
2.  **External Fragmentation:** Memory blocks become fragmented as requests finish at different times, making it impossible to fit new large requests even if total free memory is sufficient.

In traditional systems, 60-80% of KV cache memory is wasted due to these issues.

## How PagedAttention Solves It: Virtual Memory for LLMs

PagedAttention, proposed by researchers at UC Berkeley (Kwon et al.) in the vLLM project, solves this by applying operating system concepts to the KV cache:

1.  **Paging:** Instead of allocating one large contiguous chunk, PagedAttention divides the KV cache into small, fixed-size "pages" or "blocks" (e.g., each page holding the keys and values for 16 tokens).
2.  **Virtual to Physical Mapping:** It maintains a block table that maps "virtual" logical token blocks to "physical" memory blocks on the GPU.
3.  **Non-Contiguous Storage:** The physical blocks do not need to be contiguous in GPU memory. They can be scattered wherever space is available.
4.  **Dynamic Allocation:** Memory is allocated on-demand. When a request generates a new token, the system fills the current page. Once full, it dynamically allocates exactly one new page.

When the attention kernel calculates the dot products, it uses the block table to fetch the scattered pages, treating them as a continuous logical sequence.

This approach almost entirely eliminates internal fragmentation, dropping memory waste to less than 4%. The saved memory allows the system to batch significantly more requests together, vastly increasing throughput.

---

## Alternative Solutions
PagedAttention solves the *fragmentation* of the KV Cache. Other cutting-edge approaches tackle the problem by compressing the *data* within the cache itself:
*   **[Multi-Head Latent Attention (MLA)](multi-head-latent-attention.md):** Compresses the Key and Value matrices into a single, much smaller latent vector.
*   **[Continuous Batching](continuous-batching.md):** Iteration-level scheduling technique implemented alongside PagedAttention in modern inference engines like vLLM.
*   **[Rotary Position Embedding (RoPE)](rotary-position-embedding.md):** While primarily for positional encoding, understanding RoPE's relative mathematical properties is crucial when implementing systems like PagedAttention that piece together non-contiguous prompt blocks.

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
**Why you care:** PagedAttention allows you to push the absolute limits of your hardware. By eliminating memory waste, you can run much larger batch sizes or handle significantly longer context windows (like massive multi-document RAG) on fewer GPUs.
**Action:** When deploying custom high-performance pipelines, ensure your inference engine (like vLLM) has PagedAttention enabled. You can further optimize by tuning the page size (block size) to perfectly match your specific hardware architecture and workload characteristics.

### 💰 For The Cost & Latency Optimizers (API Developers)
**Why you care:** This is the single most important technique for improving your inference economics. By increasing throughput 2-4x on the same hardware, PagedAttention slashes your cost-per-token and cost-per-user.
**Action:** Migrate your serving infrastructure to engines that support PagedAttention (like vLLM or TGI). Because memory is managed dynamically, you can safely set higher concurrency limits on your endpoints without triggering Out-Of-Memory (OOM) crashes during peak loads.

### 💻 For The Everyday Prompt Engineers
**Why you care:** PagedAttention works entirely behind the scenes, but it is the reason why modern web interfaces and APIs don't crash when you paste a 50-page document into the chat box.
**Action:** You can reliably rely on APIs that use engines like vLLM to process complex, long-context prompts efficiently. Because the backend isn't artificially limiting context to save memory, you get faster, more stable responses for your largest tasks.

---

## References
*   [Efficient Memory Management for Large Language Model Serving with PagedAttention (Woosuk Kwon et al., 2023)](https://dl.acm.org/doi/10.1145/3600006.3613165)
