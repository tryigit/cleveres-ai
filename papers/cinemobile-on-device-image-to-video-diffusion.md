# CineMobile: On-Device Image-to-Video Diffusion for Cinematic Camera Motion Generation

## TL;DR
The demand for image-to-video creation on mobile devices is growing, especially for cinematic motion effects like bullet time, dolly zoom, and slow motion. While Diffusion Transformers (DiTs) are highly capable, their massive parameter sizes and multi-step iterative denoising cause computational overhead that challenges mobile hardware limits. To bridge this gap, researchers propose **CineMobile**, an optimized on-device image-to-video diffusion framework. CineMobile uses a three-fold strategy: (1) distillation-guided pruning for a compact model, (2) optimizing to a 4-step generator via diffusion distillation and reinforcement learning, and (3) hybrid post-training [Quantization](../concepts/quantization.md) to compress the model to under 1 GB. Compared to its teacher model (Wan 2.1 architecture), CineMobile achieves a 40x generation speedup while maintaining visual quality, generating 49-frame 480p videos in roughly 20 seconds on a MediaTek Dimensity 8400 Ultimate 5G platform.

## Real-World Application & Who Should Care

*   🚀 **The Performance Monsters (SOTA Seekers):** Not directly applicable. This research sacrifices some theoretical ceiling capabilities for extreme mobile efficiency and footprint reduction.
*   💰 **The Cost & Latency Optimizers (API Developers):** The distillation, pruning, and quantization stack demonstrated here provides a powerful blueprint for shrinking massive multi-step diffusion transformer models down to sub-1GB sizes, heavily reducing VRAM requirements and compute costs.
*   👨‍💻 **The Everyday Prompt Engineers:** This technique is bringing high-quality cinematic video generation (like dolly zoom and bullet time) natively to mobile devices, meaning future creator apps will be able to perform these generations locally without cloud latency.

## References
* [CineMobile: On-Device Image-to-Video Diffusion for Cinematic Camera Motion Generation](https://huggingface.co/papers/2607.03803)
