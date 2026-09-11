# An Open Recipe for IMO Gold: Training Nemotron for Olympiad Mathematics

**Category:** Frontier Models
**Date:** September 2026

## TL;DR
NVIDIA has released an open recipe detailing how they trained **Nemotron 3 Ultra** to achieve gold-medal performance (30/42 points) at IMO 2026. The system operates entirely via natural language without relying on formal provers, external tools, or internet access. The pipeline utilizes the general-availability model alongside two specialist checkpoints (trained via supervised fine-tuning and reinforcement learning). At test time, an iterative search pipeline uses these models to generate, verify, and refine candidate proofs, followed by a separate high-compute stage that selects the final submission.

## How it Works
The methodology proves that natural language reasoning combined with scaled test-time compute can reach the highest levels of mathematical olympiad performance.

1. **Post-Training:** Starting from the Nemotron 3 Ultra base, they trained two specialist checkpoints using a combination of SFT and RL tailored for complex mathematical reasoning.
2. **Iterative Search Pipeline:** During inference, the models collaboratively engage in an iterative loop:
   - **Generate:** Draft candidate proofs.
   - **Verify:** Critique and check the mathematical soundness of the drafts.
   - **Refine:** Iteratively improve the drafts based on the verification critiques.
3. **High-Compute Selection:** A final resource-intensive stage evaluates the pool of refined candidate proofs and selects the definitive submission.
4. **Open Release:** NVIDIA open-sourced the specialist checkpoints, the training data, inference code, and a novel 200-problem benchmark (Nemotron-IMO-Bench).

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
This pipeline is a blueprint for scaling test-time compute for extreme reasoning tasks. If you are aiming for State-of-the-Art in logic or math, this open recipe demonstrates that you do not necessarily need rigid formal provers (like Lean). You can achieve gold-medal performance by orchestrating multiple specialized models in a generate-verify-refine loop, provided you allocate sufficient compute at inference time.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
This system design is inherently expensive because it relies on heavy test-time compute (multiple generation and verification passes). For production APIs, this approach should be reserved for high-value asynchronous queries where accuracy is paramount and latency constraints are loose. You might adapt the generate-verify-refine loop to use a cheaper model for the initial generation and only invoke the expensive specialist model for the final verification stage.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
When tackling complex logic or math problems in web interfaces, you can manually simulate this pipeline. Do not just ask for the answer. First, prompt the model to generate multiple possible approaches. Then, in a new prompt, ask it to rigorously critique its own approaches. Finally, ask it to refine the best approach into a final answer. This "System 2" thinking drastically reduces hallucinations on hard problems.

## References & See Also
* [Nemotron 3 Super: The Hybrid Mamba-MoE](nemotron-3-super.md)
* [Inference-Time Compute: The New Scaling Law (System 2 Thinking)](../concepts/inference-time-compute.md)
