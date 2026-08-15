# Maglev: Sliding Recurrent Memory

## TL;DR
Maglev is a novel recurrent Transformer architecture that features a fixed-size memory and generalizes sliding-window attention while remaining highly parallelizable during training. The architecture couples two models: a prefiller that leverages full attention to produce memory targets, and a decoder that relies only on sliding-window attention alongside recurrent Key/Value injection for next-token prediction. By sharing parameters between the prefiller and decoder, Maglev reduces memory requirements and improves performance on validation loss and downstream pretraining benchmarks compared to standard sliding-window and latent recurrent transformer baselines.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For those building foundation models with immense context requirements, Maglev offers a pathway to break free from the quadratic bottlenecks of standard full attention. By utilizing a fixed-size memory that maintains parallelizable training, researchers can scale recurrent transformers to handle massive sequences without sacrificing downstream pretraining performance or training speed.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
Because the decoder in Maglev operates purely on sliding-window attention and recurrent Key/Value injection at inference time, it inherently bounds memory consumption during generation. Furthermore, parameter sharing between the prefiller and decoder shrinks the model footprint. This translates directly to higher throughput, lower VRAM requirements, and cheaper inference costs in production environments.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
Models trained with the Maglev architecture will be able to process much longer documents, codebases, and conversations natively without arbitrarily "forgetting" early context or running out of memory. This allows prompt engineers to stuff larger contexts into their prompts with confidence in the model's recall capabilities.

## References
* [Maglev: Sliding Recurrent Memory](https://arxiv.org/abs/2608.02870)

See also: [Transformer Architecture: The Engine of Modern AI](../concepts/transformer-architecture.md)