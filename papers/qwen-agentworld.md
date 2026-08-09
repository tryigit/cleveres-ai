# Qwen-AgentWorld: Language World Models for General Agents

## TL;DR
A world model predicts environment dynamics based on current observations and actions, serving as a core cognitive mechanism for reasoning and planning. Qwen-AgentWorld introduces foundation models for agentic environment simulation via long [chain-of-thought](../concepts/chain-of-thought.md) reasoning, capable of simulating environments covering 7 domains. Using over 10M environment interaction trajectories, the models (Qwen-AgentWorld-35B-A3B and Qwen-AgentWorld-397B-A17B) are trained through a three-stage pipeline (CPT, SFT, and RL). The authors also introduce AgentWorldBench to evaluate these models. Furthermore, world modeling enhances general agents in two ways: as a decoupled environment simulator for agentic RL, yielding gains surpassing real-environment training, and as a unified agent foundation model where world-model training acts as a highly effective warm-up, improving downstream performance across agentic benchmarks.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
Researchers developing general agents can use Qwen-AgentWorld either as a decoupled environment simulator for scalable agentic reinforcement learning or use its training methodology (world-model training as a warm-up) to boost downstream performance on complex tasks without relying entirely on slow or expensive real-world environment interactions.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
Training agents in real-world or API-driven environments can be extremely expensive and slow. Using a language world model like Qwen-AgentWorld as a simulated environment allows for massively parallel, controllable, and cost-effective training and evaluation of agents before deploying them against real, paid APIs.

### 💻 THE EVERYDAY PROMPT ENGINEERS
While you might not train these models yourself, the existence of language world models means future agents you interact with will be much better at "simulating" the outcome of their actions before they take them. This translates to fewer broken steps and more reliable multi-step task execution in tools like chat interfaces.

## See also
* [Chain-of-Thought (CoT): Eliciting Reasoning in LLMs](../concepts/chain-of-thought.md)
* [FactorJEPA: Factorizing Monolithic Futures into Layout-Agent-Interaction Channels for Crowded and Chaotic Global South Urban Worlds](factorjepa-denseworld.md)

## References
* [Qwen-AgentWorld: Language World Models for General Agents](https://arxiv.org/abs/2606.24597)
