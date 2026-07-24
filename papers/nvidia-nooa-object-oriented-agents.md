# NVIDIA-labs OO Agents: Native Python Object-Oriented Agents

## TL;DR
Traditional agent development is often fragmented across prompt templates, tool schemas, callback code, and workflow graphs. NVIDIA Object-Oriented Agents (NOOA) introduces a paradigm shift by representing agents as native Python objects. In this framework, an agent's methods are the actions the model can take, its fields represent state, its docstrings serve as prompts, and its type annotations act as contracts. This allows developers to build, test, and refactor AI agents using standard Python abstractions, seamlessly blending deterministic code with LLM-driven loops.

## The Pythonic Object-Oriented Paradigm
NOOA simplifies agent architecture by adopting a "code as action" philosophy. Where Python provides existing abstractions, NOOA uses them directly. This unifies the developer and agent interfaces:
*   **Methods as Actions:** The functions an agent can perform are simply methods on the object.
*   **State as Fields:** The agent's memory and current context are stored as standard object fields (pass-by-reference over live objects).
*   **Prompts as Docstrings:** Instructions for the LLM are naturally embedded within the docstrings of the methods and classes.
*   **Contracts as Type Annotations:** Typed input and output ensure reliability and structured interactions.

## Bridging Determinism and LLM Generation
A key innovation in NOOA is how it handles the execution loop. Methods with normal code bodies remain standard, deterministic Python. However, a method whose code body consists simply of `...` is completed at runtime by an LLM-driven agent loop. This enables programmable loop engineering where model-callable harness APIs manage context, events, and state rendering, while allowing developers to easily test and trace the agent's behavior just like any other software component.

## Real-World Application & Who Should Care

*   🚀 **The Performance Monsters (SOTA Seekers):** Researchers building complex, long-horizon agents can leverage NOOA's explicit object state and long-term memory integration. By maintaining state through native Python references rather than brittle JSON blobs, complex reasoning and multi-step interactions become more robust, as demonstrated on benchmarks like SWE-bench Verified.
*   💰 **The Cost & Latency Optimizers (API Developers):** API developers can significantly reduce overhead by offloading deterministic tasks to standard Python execution. By explicitly separating `...` (LLM-driven) methods from deterministic methods, you avoid unnecessary model calls for tasks that can be handled purely in code, saving tokens and reducing latency.
*   👨‍💻 **The Everyday Prompt Engineers:** Builders stringing together tools will find NOOA intuitive. Instead of wrestling with complex orchestration frameworks or managing separate YAML configurations for tool schemas, you can define your prompts directly in Python docstrings and let the framework handle the translation to tool calls.

See also:
*   [OpenAI Symphony: Open-Source Agentic Framework](../news/openai-symphony.md)
*   [Sema Code: Decoupling AI Coding Agents into Programmable, Embeddable Infrastructure](../news/sema-code.md)
*   [LedgerAgent: Structured State for Policy-Adherent Tool-Calling Agents](ledgeragent.md)

## References
* [NVIDIA-labs OO Agents: Native Python Object-Oriented Agents](https://arxiv.org/abs/2607.20709)
