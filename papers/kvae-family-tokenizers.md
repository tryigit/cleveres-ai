# KVAE: Family of Tokenizers for Multimodal Generative Models

## TL;DR
Tokenizers are a crucial part of the generation process for latent diffusion models, mapping input signals to compressed representations and directly affecting learning speed and synthesis quality. The KVAE (Kandinsky VAE) family introduces a series of high-performance tokenizers for audio (continuous full-band 48 kHz), image (KVAE-2D with 8x compression), and video (KVAE-3D for 4x16x16 and 4x8x8 compression) designed specifically for text-conditioned generation. These tokenizers match or surpass frontier open-source alternatives like VAEs from Wan-2.2, FLUX.2, MovieGen, and StableAudio across various objective and subjective metrics.

## KVAE Tokenizers Overview
The latent diffusion modeling (LDM) paradigm relies heavily on tokenizers to map complex continuous signals into a compressed, workable space. The efficiency and quality of this step dictate the ultimate success of the downstream generative models. The KVAE family provides a robust, open-source set of tools for multimodal generation:

- **KVAE-Audio:** A continuous full-band 48 kHz tokenizer with a 50 Hz latent space across 64 channels.
- **KVAE-2D:** Compresses images by a factor of 8 with 32 channels.
- **KVAE-3D:** Offers two causal video tokenizers for varying compression ratios (4x16x16 and 4x8x8).

By open-sourcing the training details, model selection methods, and design ablations alongside the weights, the KVAE release lowers the barrier to entry for developing frontier multimodal models.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
Researchers building the next generation of multimodal or "omni" diffusion models can leverage these high-fidelity tokenizers instead of building custom ones from scratch, allowing them to focus entirely on the generative capabilities and architectural innovations (e.g., matching or beating FLUX.2 and Wan-2.2).

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
Highly efficient tokenizers directly translate to faster encoding/decoding during the inference pipeline, allowing API developers to serve multimodal generative models with reduced latency and compute costs.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
While not directly promptable, the integration of these high-quality tokenizers into open-source generative models means everyday users will soon see faster generation times and higher fidelity outputs (better audio, sharper images) in their favorite local or web-based AI tools.

## See Also
* [Multi-Token Prediction (MTP)](../concepts/multi-token-prediction.md)
* [Quantization: Shrinking Models for the Real World](../concepts/quantization.md)

## References
* [KVAE: Family of Tokenizers for Multimodal Generative Models](https://arxiv.org/abs/2608.05798)
