# CritICL: Inference-Time Weak-to-Strong Generalization from Small Language Model Failure Modes

**Category:** Frontier Research & Papers
**Date:** August 2026

## TL;DR
CritICL is a new inference-time framework that enhances the reasoning capabilities of Large Language Models (LLMs) by learning from the mistakes of weaker models in the same family. Instead of relying on expensive, repeated generation (test-time scaling) or external verifiers, CritICL uses failure modes derived from smaller models as critique-based in-context examples to guide the strong model. It introduces two variants: **CritICL-dynamic**, which adaptively retrieves critiques based on input-specific failure modes, and **CritICL-static**, which relies on a global failure mode profile. This method achieves performance that is competitive with or superior to standard test-time scaling methods, but with significantly fewer generations and reduced token costs.

## How It Works
Recent efforts in inference-time scaling improve reasoning but typically demand extensive sampling and external verification, driving up computational costs. CritICL shifts the paradigm by recognizing that LLM failure modes are structured and predictable across different scales of models within a given family.

Rather than ignoring failures, CritICL frames them as valuable negative examples. By analyzing the common mistakes made by a weaker (smaller) model on reasoning tasks, the framework generates critique-based guidance. The stronger model is then prompted with the task alongside these specific critiques (in-context learning), steering it away from known pitfalls and improving the final generation without requiring multiple rollouts.

## Real-World Application & Who Should Care

🚀 THE PERFORMANCE MONSTERS (SOTA Seekers):
For those pushing the absolute limits of open-weight LLM reasoning, CritICL offers a structured way to guide models away from common logical traps. By actively pre-empting failure modes through dynamic critiques, you can achieve higher reasoning accuracy without the immense latency of sampling thousands of reasoning paths.

💰 THE COST & LATENCY OPTIMIZERS (API Developers):
This is highly relevant. Standard inference-time scaling (like generating 100 paths and verifying them) is prohibitively expensive for large-scale API deployment. CritICL achieves comparable or superior reasoning improvements with significantly fewer generations and lower token cost, making advanced System 2-like reasoning viable for budget-conscious production environments.

💻 THE EVERYDAY PROMPT ENGINEERS:
While the automated retrieval of failure modes is a system-level feature, you can apply the core philosophy immediately: instead of just providing positive examples (few-shot prompting), deliberately include examples of common mistakes your LLM makes on your task, followed by a critique of *why* it's wrong, and then the correct solution. This manual weak-to-strong negative prompting can drastically improve reasoning reliability today.

## References
* [CritICL: Inference-Time Weak-to-Strong Generalization from Small Language Model Failure Modes](https://arxiv.org/abs/2608.27455)

See also: [Inference-Time Compute: The New Scaling Law (System 2 Thinking)](../concepts/inference-time-compute.md), [Weak-to-Strong Generalization via Direct On-Policy Distillation](direct-on-policy-distillation.md)