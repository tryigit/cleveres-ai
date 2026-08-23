# Repo0: Design-Driven Zero-to-All Code Generation

**TL;DR:** Repo0 introduces a framework that allows LLM agents to construct entire software repositories from natural language requirements. Unlike systems that rely on a predefined architecture, Repo0 utilizes a "Dual-DAG" (Dual-Directed-Acyclic-Graph) architectural state. It iteratively evolves component boundaries through structural actions guided by modularity metrics until structural convergence is reached, which then guides test-driven development code generation.

## How It Works

Most AI coding agents struggle with "zero-to-all" generation because they lack the ability to effectively plan and maintain a repository's architecture over a long trajectory. Repo0 solves this through:

1.  **Dual-DAG Architectural State:** The system maintains two parallel directed acyclic graphs:
    *   **Requirement-level DAG:** Maps out the logical dependencies of the project's requirements.
    *   **Component-level DAG:** Maps out the physical file and module dependencies.
    *   An alignment relation bridges these two graphs.
2.  **Modularity-Guided Structural Evolution:** Starting from natural language, Repo0 iteratively refines the architecture. It takes structural actions (like creating, splitting, or merging components) driven by modularity metrics, aiming for high cohesion and low coupling.
3.  **Structural Convergence:** Once the architecture converges and stops changing significantly, the finalized structural blueprint is used to guide test-driven code generation, ensuring the resulting code actually matches the planned architecture.

When tested against baseline planning methods (like RPG), Repo0 showed significant improvements in Functionality Coverage (up to 20 percentage points) and Pass Rate (up to 29 percentage points) on real-world repositories from RepoCraft.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
For teams building the next generation of autonomous AI software engineers, explicit architectural state tracking is crucial. Implementing a Dual-DAG approach allows agents to break down massive zero-to-all code generation tasks into manageable, verifiable structural steps before writing a single line of code.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
While this framework focuses on the complex upfront planning required for zero-to-all generation, the resulting modularity reduces technical debt and makes the generated codebase easier (and cheaper) to maintain and modify later.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
When asking tools like Claude or ChatGPT to build an entire app from scratch, you can emulate this process manually. Ask the AI to first draft a component dependency graph and a requirement map, and only allow it to write code once you've both agreed the "architecture" is modular and well-defined.

## References

*   [Repo0: Design-Driven Zero-to-All Code Generation](https://arxiv.org/abs/2608.19854)

See also: [QonQrete: Sandboxed Agentic IDE](../news/qonqrete.md)
