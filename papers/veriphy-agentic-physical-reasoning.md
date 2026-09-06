# VeriPhy: Agentic Physical Reasoning for World Model Evaluation and Refinement

## TL;DR
Evaluating the physical reliability of AI world models is incredibly difficult. Visual fluency does not imply physical accuracy, and scalar quality scores cannot explain exactly how or when a generated video violates physical laws. VeriPhy addresses this by introducing an auditable, physical-verification system for world models.

Before analyzing any video frames, a text-only planner compiles the prompt into a set of typed physical obligations and a statically validated execution plan. During execution, it uses frozen low-level experts (e.g., tracking, segmentation, counting, and depth estimation) to gather evidence. Resolvers then map these evidence records to a three-valued state: supported, contradicted, or unknown. Crucially, every verdict carries its full provenance, meaning each decision is fully traceable back to the exact evidence that produced it. Tested on a corpus of 1,500 human-annotated flaw records, VeriPhy accounted for 228 of the 304 core flaws, drastically outperforming standard monolithic LLM evaluators by providing fully auditable traces that can be used for critic-based refinement.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
Researchers building the next generation of video world models can use VeriPhy to create massive, automated data-filtering engines and reward signals. Because VeriPhy provides auditable, evidence-backed explanations of physical failures rather than black-box scores, it can be used to generate high-quality critique data for RLHF or self-correction loops to train physically grounded models.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
For engineers deploying video generation pipelines, VeriPhy offers a robust way to implement guardrails and quality checks. By compiling prompts into structured physical obligations *before* generation, you can rapidly filter out physically impossible or hallucinated outputs using deterministic rule-based checks alongside cheap low-level experts, rather than relying on massive, expensive VLM calls for open-ended QA.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
When you generate a video and it looks slightly "off," it can be hard to articulate why to the model. Understanding the concept behind VeriPhy can help you prompt video models better: break down your prompts into explicit physical constraints (e.g., "The red ball must stay on the left side of the screen, move at a constant speed, and never overlap the blue box"). Being highly specific about physical rules gives the model stronger priors to follow.

## References
- **arXiv ID:** 2609.03153

See also: [Qwen-AgentWorld: Language World Models for General Agents](qwen-agentworld.md)
