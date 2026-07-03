# SkillCoach: Self-Evolving Rubrics for Evaluating and Enhancing Agentic Skill-Use

**Category:** Frontier Research & Papers

## TL;DR
Skills are becoming a reusable operational layer for LLM agents, encoding SOPs, domain rules, tool workflows, scripts, and validation routines. In realistic skill repositories, overlapping skills make reliable skill-use difficult. Final verifier success is too coarse for both evaluation and training, since an agent may pass through trial and error while selecting distractor skills, skipping required steps, composing workflows incorrectly or omitting final checks. SkillCoach is a self-evolving rubric framework for evaluating and enhancing agentic skill-use. It derives skill-grounded process rubrics from real rollouts and evaluates trajectories along four dimensions: skill selection, skill following, skill composition, and skill-grounded reflection. It keeps the external verifier as a separate outcome signal, allowing process quality to be distinguished from accidental task success. The evolved rubrics further serve as process supervision for selecting high-quality training trajectories. Experiments show that evolved rubrics substantially improve evaluation quality, expose failures hidden by final accuracy, and provide stronger supervision signals than outcome-only filtering for enhancing agentic skill-use.

---

## The Problem: Evaluating Agentic Skills
As LLMs evolve into autonomous agents, their capabilities are increasingly encapsulated in "skills" - reusable units of code, standard operating procedures, and workflows. Approaches like [MUSE-Autoskill: Self-Evolving Agents via Skill Creation, Memory, Management, and Evaluation](muse-autoskill.md) allow agents to create and manage these skills. However, accurately evaluating how well an agent *uses* these skills is challenging. Relying solely on final task success is inadequate because an agent might stumble into the correct answer after repeatedly calling the wrong skills or skipping essential steps. This "accidental success" provides poor supervision for training and masks fundamental flaws in the agent's reasoning process.

## The SkillCoach Solution
SkillCoach introduces a self-evolving rubric framework that moves beyond outcome-based evaluation to detailed process supervision. It evaluates agent trajectories across four critical dimensions:

1. **Skill Selection:** Did the agent choose the most appropriate skill for the current step, avoiding distractor skills?
2. **Skill Following:** Did the agent correctly execute the skill according to its specified parameters and constraints?
3. **Skill Composition:** Was the agent able to logically sequence multiple skills to achieve a complex goal?
4. **Skill-Grounded Reflection:** Did the agent effectively analyze the results of its skill usage and adapt if necessary?

By deriving rubrics from actual rollouts, SkillCoach generates high-quality process supervision data. This data is significantly more effective for training and evaluating agentic skill-use than simple outcome-only filtering.

---

## Real-World Application & Who Should Care

### (Rocket) The Performance Monsters (SOTA Seekers)
For researchers building advanced agents or working on reward modeling techniques like [Skill-RM: Unifying Heterogeneous Evaluation Criteria via Agent Skill](skill-rm.md), SkillCoach provides a robust mechanism for generating high-quality process supervision. This enables the training of agents that not only solve tasks but do so efficiently and robustly, minimizing random flailing and improving reliability in complex environments.

### (Money) The Cost & Latency Optimizers (API Developers)
Accidental task success via trial and error is extremely expensive in terms of token usage and latency. By using SkillCoach to train agents that are precise and deliberate in their skill usage, developers can significantly reduce the number of API calls required to solve a task, optimizing both cost and performance for deployed multi-agent systems.

### (Person at Computer) The Everyday Prompt Engineers
While SkillCoach is primarily a framework for training and evaluation, everyday prompt engineers can apply its core principles. When prompting agents to use tools or skills, explicitly instruct them to state *why* they are choosing a specific tool, verify they followed the tool's instructions, and reflect on the outcome before proceeding. This structured approach mirrors SkillCoach's rubrics and can lead to more reliable agent behavior.

## References
* [SkillCoach: Self-Evolving Rubrics for Evaluating and Enhancing Agentic Skill-Use](https://arxiv.org/abs/2607.01874)