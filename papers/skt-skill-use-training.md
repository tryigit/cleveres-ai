# SKT: Skill-Use Training at Scale via Verified Synthetic Data Generation

**TL;DR:** SKT is a verified data synthesis pipeline that addresses the gap between an agent having access to skills and actually knowing how to use them effectively. By generating high-quality, executable training trajectories across thousands of skills, fine-tuning on SKT data significantly improves a language model's ability to identify, apply, and coordinate procedural knowledge across diverse tasks and agent harnesses.

## The Skill-Use Gap in LLM Agents

Equipping language-model agents with reusable procedural knowledge (often called "skills" or "tools") has become standard practice. However, simply providing a list of available skills in the context window does not guarantee that current models can effectively identify the right tool for the job, apply it with the correct arguments, or coordinate multiple skills to solve a complex problem. The bottleneck is no longer skill availability, but rather **skill-use capability**.

## The SKT Pipeline

To bridge this gap, researchers introduced SKT, a verified data synthesis pipeline designed to construct skill-grounded tasks and executable trajectories from large collections of agent skills. The pipeline operates through a rigorous process:

1.  **Configuration Selection:** It selects suitable single-skill and multi-skill combinations from a pool of available skills.
2.  **Task Synthesis & Verification:** Tasks are synthesized and subjected to rule-based and agent-based verification, incorporating feedback-guided repair to ensure the tasks are solvable and well-formed.
3.  **Trajectory Filtration:** Crucially, SKT retains only successful trajectories that *substantially use every required skill*, filtering out shortcuts or hallucinations.

Using a base of 2,000 public skills, the SKT pipeline generated 4,000 task packages and 27,164 verified trajectories, providing a rich, high-quality dataset for supervised fine-tuning (SFT).

### SkillEval

Alongside the training pipeline, the researchers constructed **SkillEval**, a held-out, executable benchmark built from a disjoint test pool to rigorously evaluate skill use in a standardized manner.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers): Researchers building generalist agents can leverage SKT's verified synthesis pipeline to scale up their training data. By enforcing substantial skill usage during data generation, you can push the boundaries of complex, multi-step tool orchestration in frontier models.
(Money) THE COST & LATENCY OPTIMIZERS (API Developers): Training smaller models on SKT-generated trajectories can distill high-level skill orchestration capabilities into more efficient architectures, reducing the need for massive LLMs to handle routine API calling or tool use.
(Person at Computer) THE EVERYDAY PROMPT ENGINEERS: While you won't run the SKT pipeline directly, understanding that models struggle with skill coordination without explicit training can help you design better prompts. When providing multiple tools to an agent, explicitly guiding the model on *when* and *how* to chain them together will yield more reliable results.

*See also: [SkillOpt: Executive Strategy for Self-Evolving Agent Skills](skillopt.md)*

## References

* [SKT: Skill-Use Training at Scale via Verified Synthetic Data Generation](https://arxiv.org/abs/2608.02287)
