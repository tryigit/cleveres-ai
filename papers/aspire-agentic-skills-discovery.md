# ASPIRE: Agentic /Skills Discovery for Robotics

## TL;DR
Traditional robot programming struggles with multimodal perception, complex physical dynamics, and handling diverse execution failures. ASPIRE (Agentic Skill Programming through Iterative Robot Exploration) solves this by introducing a continual learning system that autonomously writes, tests, and refines robot control programs using a code-as-policy paradigm. ASPIRE operates in a closed loop, exposing fine-grained multimodal traces to diagnose failures and synthesize repairs. It continually distills these validated fixes into a reusable, transferable skill library, aided by an evolutionary search for discovering new task sequences. This approach dramatically outperforms prior methods - achieving up to a 77% improvement on complex manipulation tasks and enabling zero-shot generalization to unseen long-horizon scenarios (31% vs 4% success rate). Crucially, the skills ASPIRE discovers in simulation show strong initial evidence of sim-to-real transfer, heavily reducing the manual programming effort required for real robots.

## Real-World Application & Who Should Care

### (Rocket) The Performance Monsters (SOTA Seekers)
For robotics researchers and those building autonomous physical agents, ASPIRE is a massive leap forward. Instead of relying on static scripts or simple [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md) for single tasks, ASPIRE uses evolutionary search and a compounding skill library to autonomously explore and conquer long-horizon tasks. The 31% zero-shot generalization success rate on unseen complex tasks means your embodied agents can finally adapt to new environments without requiring constant, manual re-programming.

### (Money) The Cost & Latency Optimizers (API Developers)
If you are developing software infrastructure for robotics, ASPIRE offers a way to drastically cut down development and maintenance costs. Writing robot code is notoriously brittle and expensive when dealing with diverse hardware APIs. Because ASPIRE's code-as-policy approach distills robust skills that show strong sim-to-real transfer, you can train and debug behaviors cheaply in simulation and deploy them to real-world hardware with significantly less manual intervention and lower failure rates.

### (Person at Computer) The Everyday Prompt Engineers
This paper focuses primarily on physical robotics rather than standard text-based LLM interactions, so everyday prompt engineers using ChatGPT or Claude web interfaces won't apply this directly today. However, ASPIRE provides a glimpse into how future prompt engineering for robots will work: instead of programming joints, you will simply prompt the robot to perform a task, and systems like ASPIRE will write and refine the necessary code in the background.

## References
* [ASPIRE: Agentic /Skills Discovery for Robotics](https://arxiv.org/abs/2607.00272)
