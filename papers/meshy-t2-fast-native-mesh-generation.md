# Meshy T2: Fast Native Mesh Generation with Flow Matching

## TL;DR
Generating high-quality 3D meshes usually requires slow, autoregressive decoding that accumulates errors. Meshy T2 solves this by introducing a fast, native mesh generation framework built on [Flow Matching: Simulation-Free Continuous Normalizing Flows](../concepts/flow-matching.md). It uses a vertex-set mesh VAE to encode meshes into continuous latent tokens and employs a cascaded flow-matching process to sketch a coarse shape and then populate it with vertices. This approach allows for interactive generation speeds (median 6 seconds), precise vertex count control, and native support for multi-part assets, performing an order of magnitude faster than autoregressive baselines.

## The Challenge of 3D Asset Generation

Polygonal meshes are the standard representation for 3D objects in gaming, film, and interactive applications. Mainstream generative approaches typically serialize a 3D mesh into a long sequence of tokens and decode it autoregressively (one token after another). This method has several drawbacks:
*   **Speed:** Autoregressive decoding is inherently slow, making interactive asset creation impractical.
*   **Error Accumulation:** Mistakes made early in the token sequence compound, leading to degraded geometry or broken topology.
*   **Loss of Precision:** Many methods rely on vertex quantization (snapping vertices to a grid), which destroys the fine geometric details and artist-authored topology needed for professional workflows.

## Meshy T2: Flow Matching for Meshes

Meshy T2 abandons the autoregressive paradigm in favor of continuous flow matching (similar in spirit to [Token Time Continuous Diffusion for Language Modeling](token-time-continuous-diffusion.md)), processing the entire 3D structure in parallel:

1.  **Vertex-Set Mesh VAE:** Instead of sequential tokens, a Variational Autoencoder (VAE) encodes the entire mesh into one continuous latent token per vertex. It can decode the 3D coordinates, edge connectivity, and face winding order in a single pass. This preserves high-precision geometry without quantization.
2.  **Cascaded Flow Matching:** Generation happens in a coarse-to-fine pipeline conditioned on an input image:
    *   **Voxel Flow:** First, an image-conditioned model sketches the overall shape as a coarse, volumetric occupancy scaffold.
    *   **Mesh Flow:** Next, a second flow model populates this scaffold with the per-vertex latent tokens, explicitly conditioned on a requested vertex budget.

This architecture enables three major breakthroughs: interactive generation speed (under 6 seconds), precise control over the final polygon count, and the ability to generate multi-part assets whose distinct components emerge naturally from the generated connectivity.

## Real-World Application & Who Should Care

*   🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):** Game developers and VFX artists can use this architecture to generate production-ready 3D assets with high-fidelity, artist-style topology directly from images, without worrying about quantization artifacts ruining the geometry.
*   💰 **THE COST & LATENCY OPTIMIZERS (API Developers):** By replacing slow autoregressive decoding with parallel flow-based synthesis, Meshy T2 operates over an order of magnitude faster. This drastically reduces the compute cost and latency required to offer 3D generation via API endpoints.
*   💻 **THE EVERYDAY PROMPT ENGINEERS:** For creators using web-based 3D generation tools, this technology means you can upload an image and get a usable 3D model back in 6 seconds instead of waiting minutes, allowing for rapid iteration and prototyping.

## References
* [Meshy T2: Fast Native Mesh Generation with Flow Matching](https://arxiv.org/abs/2607.28675)
