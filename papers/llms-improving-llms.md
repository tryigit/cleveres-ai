# LLMs Improving LLMs: Agentic Discovery for Test-Time Scaling

**Category:** Frontier Research & Papers

## TL;DR
**Test-Time Scaling (TTS)** allocates additional computation during inference to improve large language model performance. However, most TTS strategies rely on manual heuristics. **AutoTTS** introduces an environment-driven framework where LLMs act as agents to automatically discover optimal TTS strategies. By formulating the process as controller synthesis over pre-collected reasoning trajectories, the framework successfully finds strategies that beat hand-crafted baselines on mathematical benchmarks, completing the entire discovery process in 160 minutes for under $40.

See also: [Inference-Time Compute](../concepts/inference-time-compute.md)

---

## The Problem: Manual Search in a Massive Space
Current Test-Time Scaling strategies (such as deciding when to branch, when to probe, or when to stop reasoning) are heavily reliant on human intuition. Researchers manually design reasoning patterns and heuristics, leaving the vast majority of the computation-allocation space completely unexplored. Finding the optimal strategy via trial and error is prohibitively expensive because evaluating each new strategy requires repeated LLM calls.

## The Solution: AutoTTS
AutoTTS changes the researchers' role from designing heuristics to designing the *discovery environment*. The core innovation is formulating width/depth test-time scaling as **controller synthesis**.

### Key Innovations:
1.  **Environment Construction:** The environment provides pre-collected reasoning trajectories and probe signals. Controllers decide the next move (branch, continue, probe, prune, or stop) and can be evaluated cheaply without new LLM calls.
2.  **Beta Parameterization:** A technique to make the massive search space tractable and fine-grained.
3.  **Execution Trace Feedback:** The environment provides detailed feedback, helping the agent diagnose *why* a generated TTS program failed, allowing the LLM to iteratively refine its strategy.

## Results
*   **Superior Efficiency:** The discovered strategies improve the overall accuracy-to-cost tradeoff compared to strong, manually designed baselines.
*   **Generalization:** The strategies successfully generalize across held-out benchmarks and different model scales.
*   **Cost-Effective Discovery:** The entire agentic discovery process costs only $39.90 and takes 160 minutes.

---

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
Researchers building sophisticated agent frameworks or reasoning pipelines can use the AutoTTS methodology to automatically search for the absolute best test-time compute allocation for their specific domain, escaping the limitations of human-designed heuristics.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
By utilizing automatically discovered strategies, you can optimize when your system stops thinking or prunes a bad reasoning path, directly improving the accuracy-to-cost ratio of your inference budget.

💻 **THE EVERYDAY PROMPT ENGINEERS:**
While the framework is heavily technical, the core lesson is clear: rigid "think step-by-step" prompts are not always optimal. Using multi-agent tools that adaptively decide whether to continue thinking or start over (branching) will yield better results on complex tasks.

---
**Source:** [arXiv:2605.08083](https://arxiv.org/abs/2605.08083)
