# CRISP: Cliff-awaRe Input-adaptive Sparse Prefilling

## TL;DR
**CRISP** is a dynamic routing method for sparse attention that tackles the computational bottleneck of the long-context prefilling phase in Large Language Models (LLMs). While previous dynamic sparse methods introduced high overhead and struggled with noise accumulation at long contexts, CRISP introduces a structural routing proxy ($C_{struct}$) and a sink-aware threshold. This allows it to match or exceed the quality of exact dense attention on retrieval-heavy benchmarks while achieving up to a 5.30x speedup at 512k tokens.

## The Structural Routing Proxy
Traditional sparse attention either uses fixed patterns (which lack flexibility) or dynamic routing based on Jensen-Shannon Divergence (JSD), which incurs significant overhead from pooled matrix multiplications and KL divergence calculations.

CRISP demonstrates that routing decisions can be directly determined from the structure of the proxy attention map. It replaces JSD with $C_{struct}$, a structural proxy that measures mass at vertical-slash compatible positions. This perfectly reproduces the routing decisions of JSD while completely eliminating the computational overhead of the pooled matmul and divergence math, making the prefilling phase significantly faster.

## Addressing the Mass Cliff
In extremely long contexts, standard dynamic methods struggle with the "post-softmax mass cliff." The paper theoretically proves that using strictly cumulative coverage thresholds to allocate attention budget results in the accumulation of $O(n)$ background noise as context length scales.

CRISP solves this by utilizing a **sink-aware threshold** grounded in the actual noise floor. By navigating the mass cliff carefully, CRISP eliminates this $O(n)$ noise during selection while preserving the structural integrity of the attention map. The empirical result is massive performance recovery (up to +28.0 percentage points) on retrieval tasks across InfiniteBench, RULER, and LongBench compared to previous baselines.

## Real-World Application & Who Should Care

🚀 **(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):**
If you are running massive context inference (like 512k tokens) for heavy retrieval or code analysis, CRISP allows you to utilize sparse attention without sacrificing the exact precision required to pull a specific needle out of a haystack, effectively solving the performance degradation seen in earlier sparse prefill methods.

💰 **(Money) THE COST & LATENCY OPTIMIZERS (API Developers):**
The prefilling phase is typically the most compute-heavy and latency-inducing part of serving long contexts. CRISP's 5.30x attention speedup directly translates to faster time-to-first-token (TTFT) and drastically lower compute costs for long-context API endpoints.

💻 **(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:**
While this operates under the hood, the impact of CRISP means that conversational AI systems can process gigantic documents, entire codebases, or extremely long chat histories nearly instantaneously without forgetting or hallucinating facts buried deep in the prompt.

## References
* [CRISP: Cliff-awaRe Input-adaptive Sparse Prefilling with Structural-Mass-Motivated Routing](https://arxiv.org/abs/2609.01925)

## See also:
*   [DeepSeek Sparse Attention (DSA)](../concepts/deepseek-sparse-attention.md)
*   [FlashPrefill V2: Block-Sparse Prefill Attention for Long-Context LLM Serving](flashprefill-v2.md)