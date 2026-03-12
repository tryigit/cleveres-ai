# PagedAttention: Virtual Memory for LLMs

## TL;DR
**PagedAttention** is a memory management algorithm introduced by researchers at UC Berkeley (and powering the popular vLLM inference engine). It solves the massive memory fragmentation problem in LLM serving by borrowing the concept of "virtual memory" from traditional operating systems. By partitioning the KV cache into small, non-contiguous, fixed-size blocks, PagedAttention nearly eliminates memory waste and allows for 2-3x higher serving throughput compared to naive caching strategies.

---

## The Problem: The Inefficient KV Cache

During LLM text generation (inference), the model needs to remember the context of all previously generated tokens. It does this by storing their mathematical representations in the **KV Cache** (Key-Value Cache).

In traditional serving systems, the KV cache for a single user's request was allocated as one giant, contiguous block of GPU memory. Because the system didn't know in advance exactly how many tokens the user would generate, it had to pre-allocate a maximum possible size (e.g., 2048 tokens).

This contiguous allocation caused massive problems:
*   **Internal Fragmentation:** The model might pre-allocate memory for 2048 tokens, but the user only generates 100. The remaining memory is locked up and wasted.
*   **External Fragmentation:** As different requests with different memory sizes finish and free up space, holes appear in the GPU memory. A new request might not find a single contiguous block large enough to run, even if the total free memory is sufficient.
*   **Memory Wall:** Prior systems wasted 60-80% of KV cache memory due to these fragmentation issues, severely bottlenecking how many concurrent users a GPU could serve.

## The Solution: PagedAttention

The creators of PagedAttention looked at how operating systems solved this exact problem decades ago for RAM using virtual memory and paging.

Instead of storing the KV cache as one big chunk, PagedAttention breaks it down into small, fixed-size pages or "blocks" (e.g., each block storing exactly 16 tokens).

1.  **Logical vs. Physical Memory:** PagedAttention separates the *logical* view of the KV cache (which looks like a continuous sequence of tokens to the model) from the *physical* view (where those blocks are actually stored in GPU memory).
2.  **Dynamic Allocation:** When a request starts, it only gets the exact number of blocks needed for the prompt. As the model generates new tokens, it dynamically requests and fills new blocks one at a time.
3.  **Non-Contiguous Storage:** These blocks do not need to sit next to each other in physical GPU memory. They can be scattered wherever there is space. A mapping table translates between the logical sequence and the physical blocks.

### The Impact
By eliminating the need for large contiguous allocations and dynamic resizing, PagedAttention results in near-optimal memory usage. Waste is reduced to under 4% (which only occurs in the very last, partially filled block). This efficiency directly translates into the ability to batch far more requests simultaneously, driving up GPU utilization and drastically lowering the cost of serving.

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
If you are deploying large, high-capability models locally or on dedicated hardware, PagedAttention is what prevents out-of-memory (OOM) errors during heavy workloads.
*   **Concurrent Agents:** When running multiple autonomous agents simultaneously, PagedAttention ensures that the context windows of those agents don't artificially block each other from running due to memory fragmentation.
*   **Complex Decoding:** Advanced techniques like parallel sampling or beam search can share the exact same physical memory blocks for the initial prompt, diverging only when the generated sequences differ, massively saving memory.

### 💰 For The Cost & Latency Optimizers (API Developers)
PagedAttention is the underlying reason why API costs have plummeted across the industry.
*   **Maximizing ROI:** Whether you are building your own infrastructure using vLLM or relying on providers like Together AI or Anyscale, PagedAttention is the engine that allows 2-3x more users to share the same GPU, cutting the operational cost per request by a similar margin.

### 🧑‍💻 For The Everyday Prompt Engineers
While you don't interact with PagedAttention directly, its existence changes how you can use models.
*   **Long-Context Viability:** The reason you can drop a 100-page PDF into a model and not wait 5 minutes for a response is partially due to the efficient memory handling that systems utilizing PagedAttention provide. It makes massive context windows economically and computationally feasible for everyday use.

---

## References
*   [Efficient Memory Management for Large Language Model Serving with PagedAttention](https://arxiv.org/abs/2309.06180) - The original paper introducing the concept.
*   [vLLM Project](https://github.com/vllm-project/vllm) - The open-source serving engine powered by PagedAttention.