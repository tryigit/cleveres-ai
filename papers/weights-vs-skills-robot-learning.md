# Weights or Skills? A Survey of Robot-Learning Techniques

## TL;DR
Robot learning is diverging into two primary paradigms: static policies that bake competence into frozen weights (like Vision-Language-Action, or VLA, models), and dynamic agents that write and refine their own executable skills as code. This focused survey categorizes 77 representative systems across this "weights versus skills" axis. It highlights that out of five distinct senses of the word "skill," only the code sense allows for self-improvement without requiring gradient updates. The survey also addresses the emerging commercial robot-skill marketplaces, pointing out critical open problems like adaptation, safety verification, and cross-embodiment portability since most current marketplaces only ship static playback rather than adaptable code.

## Weights vs. Skills
The survey structures the field of robot learning through a specific taxonomy:
- **Weights (VLA Models):** Competence is frozen into the neural network weights during training. They act as monolithic policies mapping observations directly to actions.
- **Skills (Code-as-Policy):** Agents write, execute, and refine their own skills. The survey categorizes these methods by their degree of self-improvement, ranging from zero-shot program synthesis to closed-loop self-repair, persistent skill memory, and evolutionary search.

The survey concludes that the most open-ended and self-improving systems are those that combine execution feedback, skill memory, and evolutionary search (e.g., ASPIRE, ENPIRE).

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
Researchers in embodied AI can use this taxonomy to guide future architecture designs, pushing beyond static VLA models towards systems that utilize persistent skill memory and closed-loop self-repair for true open-ended self-improvement without the massive compute overhead of continuous gradient updates.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
For developers building commercial robot-skill marketplaces, this survey highlights a critical gap: shipping static playbacks limits scalability. Transitioning to distributing adaptable "skills as code" can drastically improve cross-embodiment portability and reduce the need for constant, expensive retraining across different robot hardware.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
While applied primarily to physical robots, the core concept of agents writing, testing, and saving their own executable code (tools/skills) is highly relevant to designing autonomous software agents using frameworks like LangChain or AutoGen.

## See Also
* [Agent-as-a-Judge: Evaluate Agents with Agents](agent-as-a-judge.md)

## References
* [Weights or Skills? A Survey of Robot-Learning Techniques: from Action-Predicting Weights to Robots that Write their Own Skills](https://arxiv.org/abs/2608.01851)
