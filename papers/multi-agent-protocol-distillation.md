# From Proprietary to Open-Source: Bridging the Distribution Gap via Multi-Agent Protocol Distillation in Agentic Search

## TL;DR

Agentic search allows Large Language Models to handle knowledge-intensive tasks through multi-step reasoning and retrieval. However, relying purely on Reinforcement Learning (RL) yields sparse supervision, and traditional distillation from proprietary models fails due to hidden logits and tokenizer mismatches. Multi-Agent Protocol Distillation (MAPD) is a joint distillation and RL framework that uses a structured, style-normalized protocol as an intermediate representation. This approach successfully transfers reasoning competence without stylistic artifacts, achieving significant performance gains on smaller open-source models like Qwen3-1.7B and Qwen3-4B.

## How MAPD Works

Conventional knowledge distillation often struggles with the "distribution gap" between proprietary teachers and open-source students. Raw trajectory imitation tends to transfer superficial stylistic quirks rather than core reasoning abilities. MAPD solves this with a multi-step pipeline:

1.  **Offline Multi-Agent System (MAS):** An offline system decomposes queries, retrieves evidence, and repairs failed searches.
2.  **Structured JSON Protocol:** The resulting exploration trace is converted into a standardized JSON protocol containing the task type, reasoning plan, and extractive grounding facts.
3.  **Privileged Distillation:** During training, this clean protocol is fed only to a privileged branch of the student policy.
4.  **Joint Training:** The token distributions from this privileged branch provide a dense distillation signal, which is combined with a sparse RL objective.

Extensive evaluations across seven QA benchmarks show that MAPD consistently outperforms standard distillation and RL methods. It achieves average success rates of 39.4% on Qwen3-1.7B and 44.4% on Qwen3-4B, while preventing style drift and verbosity degeneration.

## Real-World Application & Who Should Care

*   🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):** AI researchers can use the MAPD framework to build highly capable, small-parameter search agents by efficiently extracting reasoning logic from massive proprietary models without inheriting their verbosity.
*   💸 **THE COST & LATENCY OPTIMIZERS (API Developers):** By utilizing MAPD, developers can distill complex search and reasoning capabilities into small, cheap-to-run models (like 1.7B or 4B parameters). This drastically reduces the cost and latency of deploying agentic search at scale compared to querying a massive proprietary API.
*   👨‍💻 **THE EVERYDAY PROMPT ENGINEERS:** This topic is primarily focused on model training methodology and knowledge distillation; it does not offer direct, actionable techniques for everyday prompt engineering.

## References
* [From Proprietary to Open-Source: Bridging the Distribution Gap via Multi-Agent Protocol Distillation in Agentic Search](https://arxiv.org/abs/2607.24280)
