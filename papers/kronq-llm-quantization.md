# KronQ: LLM Quantization via Kronecker-Factored Hessian

## TL;DR
**KronQ** is a novel post-training quantization (PTQ) framework that fundamentally rethinks how to compress large language models (LLMs) without retraining. While traditional second-order PTQ methods (like GPTQ) rely exclusively on input activation statistics-assuming all output channels contribute equally-KronQ introduces the **gradient covariance** into the quantization pipeline. By using a Kronecker-factored Hessian approximation, the quantization loss becomes jointly dependent on both activation and gradient covariances. This dual-sided approach introduces bidirectional incoherence processing and a new sensitivity metric for inter-layer mixed-precision allocation, resulting in remarkably robust accuracy even at extreme compressions (e.g., achieving 7.93 perplexity on LLaMA-3-70B for 2-bit weight-only quantization, where methods like GPTQ produce degenerate models with >2000 perplexity).

---

## The Concept: Beyond Input Activations

Post-training quantization works by converting precise 16-bit floating-point parameters (FP16 or BF16) into smaller formats (like 4-bit or 2-bit) without needing the original massive training dataset or compute cluster.

Historically, the gold standard for this has been methods like GPTQ, which construct their quantization objectives by looking only at *input activation statistics*. GPTQ essentially asks: "Given what the input to this layer usually looks like, how can we compress the weights to minimize the change in the layer's output?"

### The Flaw in Existing Methods
The problem with the input-only approach is that it treats all output channels as equally important to the final model prediction. In reality, some output channels have a much larger impact on the final language modeling loss than others.

### The KronQ Solution
KronQ addresses this by incorporating **gradient covariance** via a Kronecker-factored Hessian.
1.  **Bidirectional Incoherence Processing:** KronQ extends standard input-side random rotation (which helps handle outlier features) to the output dimension using the gradient covariance. This reduces weight magnitude variance across both sides of the layer.
2.  **Hessian-Driven Mixed Precision:** KronQ derives a new sensitivity metric to decide which layers can survive being compressed to 2-bit and which layers need to stay at 3-bit or 4-bit. This allocation is driven jointly by the traces of both the gradient and activation Hessians, ensuring the most mathematically "sensitive" layers retain higher precision.

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
**Unlocking Sub-3-Bit LLMs.**
If you are trying to push massive open-weight models (like the 70B+ class) onto highly constrained hardware, KronQ represents a breakthrough. Reaching viable performance at 2-bit quantization means you can run models that were previously completely out of reach, trading a very small amount of perplexity for a massive reduction in VRAM.

### 💰 For The Cost & Latency Optimizers (API Developers)
**Maximizing Throughput per GPU.**
Quantization is the primary lever for increasing inference throughput because it alleviates the memory-bandwidth bottleneck. If KronQ's pipeline allows you to confidently deploy a 2-bit or mixed-precision model instead of a 4-bit model without the catastrophic failure modes of GPTQ, you can double your serving capacity per GPU and drastically slash your cost-per-token.

### 🧑‍💻 For The Everyday Prompt Engineers
**Better Local Inference.**
While you likely won't implement the Kronecker-factored Hessian math yourself, you will benefit from this downstream. When downloading local models via tools like LM Studio or Ollama, look out for quantization formats derived from KronQ (when they become available), as they will likely offer smarter, more coherent responses at the smallest file sizes compared to older GPTQ or AWQ versions.

---

## References
* [KronQ: LLM Quantization via Kronecker-Factored Hessian](https://arxiv.org/abs/2607.07964)

See also: [Quantization](../concepts/quantization.md)