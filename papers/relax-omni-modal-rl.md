# Relax: An Asynchronous Reinforcement Learning Engine for Omni-Modal Post-Training at Scale

**TL;DR:** Relax (Reinforcement Engine Leveraging Agentic X-modality) is an open-source, asynchronous RL training engine developed by RedNote AI to overcome the bottlenecks of applying [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md) to multimodal and [Mixture of Experts (MoE)](../concepts/mixture-of-experts.md) architectures. It solves heterogeneous data flow challenges and scales fault-isolated RL roles to deliver up to a 2.00x end-to-end speedup.

## The Bottleneck in Multimodal RLHF

While RL post-training has driven major advancements in model reasoning and self-reflection, most existing systems (like veRL) were built primarily for text-centric pipelines. As the industry moves toward omni-modal inputs (vision, audio) and complex multi-turn agentic workflows, traditional RL systems face three major challenges:
1.  **Heterogeneous Data Flows:** Processing text, images, audio, and video simultaneously creates bottlenecks in standard training loops.
2.  **Operational Robustness:** Coordinating massive parallel clusters for RL role assignments frequently leads to synchronization stalls or global failures when a single node drops.
3.  **The Staleness vs. Throughput Tradeoff:** Strict on-policy execution forces GPUs to sit idle waiting for new rollouts, while naive off-policy methods can lead to reward collapse.

## The Relax Architecture

To resolve these challenges, Relax introduces three co-designed architectural layers:

1.  **Omni-Native Stack:** Multimodal support is built natively into data preprocessing, modality-aware parallelism, and inference generation, rather than being retrofitted over a text pipeline.
2.  **Fault-Isolated Services:** Each RL role (actor, critic, reward model, reference model) runs as an independent, fault-isolated service. If one component fails, it can be scaled, recovered, or upgraded without requiring a global training restart.
3.  **Asynchronous TransferQueue:** This decoupling is connected via a "TransferQueue" data bus. A tunable "staleness" parameter allows the system to smoothly transition between strict on-policy, near-on-policy, and fully asynchronous execution to maximize GPU throughput.

### Performance Gains and MoE Support

Relax demonstrates substantial performance improvements in empirical testing:
*   **1.20x Speedup:** On Qwen3-4B under strict on-policy execution compared to veRL.
*   **2.00x Speedup:** On Qwen3-Omni-30B when utilizing fully asynchronous mode, maintaining the exact same reward convergence.
*   **Efficient MoE Training:** Standard RL engines suffer massive degradation (up to 32% overhead) when routing MoE layers. Relax integrates R3 (Rollout Routing Replay) for [MoE](../concepts/mixture-of-experts.md) models, dropping the overhead to a mere 1.9%.

## Real-World Application & Who Should Care

🚀 **The Performance Monsters (SOTA Seekers)**
AI researchers training frontier multimodal agents or large MoE models can use Relax to push beyond the scaling limits of traditional synchronous RL systems, maintaining high utilization on massive clusters.

💰 **The Cost & Latency Optimizers (API Developers)**
For teams fine-tuning specialized multimodal models, the 2x throughput speedup directly translates into halved GPU rental costs during post-training, making omni-modal RLHF financially viable for mid-sized labs.

💻 **The Everyday Prompt Engineers**
While this is a training framework, prompt engineers will benefit from the resulting omni-modal models (like Qwen3-Omni) that are vastly better aligned across text, vision, and audio tasks because the underlying RLHF pipeline is no longer bottlenecked by modality.

***

**Sources:**
*   arXiv: [Relax: An Asynchronous Reinforcement Learning Engine for Omni-Modal Post-Training at Scale](https://arxiv.org/abs/2604.11554v1)
*   GitHub: [rednote-ai/Relax](https://github.com/rednote-ai/Relax)
