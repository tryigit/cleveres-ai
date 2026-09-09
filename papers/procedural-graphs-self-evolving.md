# Procedural Graphs: Self-Evolving Execution Structures for LLM Agents

## TL;DR
Current LLM agents often lose track of their objectives or repeat failed actions over long horizons because they rely solely on unstructured memory histories. **Procedural Graphs** solve this by organizing procedural knowledge into a self-evolving graph (similar to how a knowledge graph organizes facts). At each step, a guidance model localizes the agent on this graph and provides situational advice, steering the agent's actions without rigidly dictating them. Crucially, the graph self-evolves: an LLM refiner automatically updates the graph's structure based on successful and failed trajectories, matching or beating hand-designed execution structures over time.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For researchers building highly autonomous, multi-step agents, Procedural Graphs offer a powerful way to inject dynamic procedural knowledge. It bridges the gap between rigid state machines (which break easily) and unconstrained generation (which hallucinates or loops), leading to significantly higher task completion rates in complex environments.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
By preventing agents from getting stuck in loops or repeating unproductive actions, Procedural Graphs can drastically reduce the number of wasted API calls in agentic workflows. Furthermore, because the graph self-evolves, you save engineering time previously spent manually designing and tuning agent decision trees.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
While implemented under the hood, the concepts of Procedural Graphs can inspire how you prompt agents today. Instead of just giving an agent a goal and history, providing a structured "map" of procedures and their relationships can drastically improve reliability when chaining together complex prompts.

## Key Insights
*   **Structured Procedural Knowledge:** Instead of (entity, relation, entity) for factual knowledge, Procedural Graphs use (procedure, relation, procedure) triplets to map out what an agent should do, in what order, and under what conditions.
*   **Situational Guidance:** The framework doesn't force actions; it localizes the agent's current state on the graph and translates the surrounding subgraph into step-level guidance to bias the generation model's next decision.
*   **Self-Evolution:** An LLM acts as a refiner, contrasting successful and failed trajectories. It edits the graph's topology (adding/removing nodes and edges) and attributes, committing changes that improve validation performance.
*   **Retaining Failures:** The framework explicitly retains rejected paths to actively discourage the agent from repeating known mistakes in the future.
*   **Better than Hand-Designed:** Starting from a minimal skeleton, the self-evolution loop can build execution structures that outperform manually engineered expert priors across various datasets and models.

## See also:
*   [Chain-of-Thought (CoT): Eliciting Reasoning in LLMs](../concepts/chain-of-thought.md)
*   [Inference-Time Compute: The New Scaling Law (System 2 Thinking)](../concepts/inference-time-compute.md)
