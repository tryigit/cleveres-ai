# OasisKV: Scaling In-Decode KV Cache Beyond HBM with Lookahead Sparse Prefetching

## TL;DR
OasisKV is a memory-centric LLM inference system designed to tackle the High Bandwidth Memory (HBM) capacity bottleneck during the decoding phase of large-scale or long-context reasoning models. Rather than storing the entire KV cache in scarce HBM, OasisKV offloads it to higher-capacity memory tiers (like host RAM) and uses lookahead tokens generated via speculative decoding to predict and prefetch only the most relevant KV blocks into HBM right when they are needed.

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
For researchers scaling up multi-agent simulations or long-horizon reasoning tasks where context sizes balloon quickly, OasisKV allows you to effectively bypass hardware memory walls, ensuring your GPU memory doesn't constrain the logical depth of your generations.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
This is a game-changer for inference serving infrastructure. By reducing the HBM footprint per request, OasisKV drastically increases the allowable batch size, delivering up to 1.69x-2.1x throughput improvements over dense implementations like vLLM, heavily optimizing your compute cost-per-token.

💻 **THE EVERYDAY PROMPT ENGINEERS:**
While mostly a backend infrastructure upgrade, this means your chosen AI providers can support massive "infinite" context window models natively without spiking API prices or dramatically slowing down response times when you upload dozens of PDFs.

---

## References
* [OasisKV: Scaling In-Decode KV Cache Beyond HBM with Lookahead Sparse Prefetching](https://arxiv.org/abs/2608.08097)

See also: [PagedAttention: Eliminating KV Cache Waste](../concepts/paged-attention.md), [Speculative Decoding: Breaking the Autoregressive Bottleneck](../techniques/speculative-decoding.md)
