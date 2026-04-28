# OpenAI Symphony: Open-Source Agentic Framework

**TL;DR:** OpenAI has released Symphony, an open-source, Elixir-based framework designed to manage autonomous AI coding agents through structured, scalable "implementation runs" by connecting issue trackers directly to LLM agents.

Symphony bridges the gap between project management tools and code execution. Rather than being a general-purpose workflow engine, it strictly acts as a scheduler, runner, and tracker reader.

## System Architecture: Elixir and the BEAM
Built using Elixir and the Erlang/BEAM runtime, Symphony prioritizes fault tolerance and concurrency. Because autonomous agents perform long-running tasks that can fail or require retries, BEAM’s supervision trees allow Symphony to manage hundreds of isolated implementation runs simultaneously without system-wide crashes. It uses PostgreSQL (via Ecto) for state persistence and polls issue trackers-defaulting to Linear-to identify ready tasks.

## The Implementation Run Lifecycle
The framework automates a specific workflow:
1. **Polling:** Monitors the issue tracker for specific states (e.g., "Ready for Agent").
2. **Sandbox Isolation:** Creates a deterministic, per-issue workspace so agents don't interfere with concurrent runs.
3. **Execution:** Initializes an agent (typically using OpenAI models) to tackle the issue.
4. **Proof of Work:** Requires the agent to generate CI status reports, pass unit tests, provide PR review feedback, and create a walkthrough of changes before completion.
5. **Landing:** If verified, the agent submits or merges a Pull Request.

## Configuration via WORKFLOW.md
Agent behavior is configured via an in-repo `WORKFLOW.md` file. This technical contract contains system instructions, runtime settings, and specific rules. By storing this alongside source code, teams version-control their agent policies to match the specific codebase version being modified.

## Harness Engineering Requirements
Symphony requires a codebase optimized for machine interaction, known as "harness engineering". This includes:
* **Hermetic Testing:** Tests must run locally without external dependencies.
* **Machine-Readable Docs:** Scripts and docs must allow an agent to discover build, test, and deploy processes autonomously.
* **Modular Architecture:** Codebases with minimized side effects let agents make changes with high confidence.

## Real-World Application & Who Should Care

🚀 **Performance Monsters (SOTA Seekers):**
Teams pushing the limits of autonomous coding can use Symphony's BEAM-based architecture to run hundreds of agents concurrently in isolated sandboxes, scaling development pipelines drastically.

💰 **Cost & Latency Optimizers (API Developers):**
By standardizing the "Proof of Work" (requiring passing tests and CI before merging), Symphony reduces the wasted cost of agents spinning in loops or merging broken code, ensuring compute is spent on verified implementations.

💻 **Everyday Prompt Engineers:**
You can transition from manually prompting an LLM to generate code snippets to defining an autonomous policy in a `WORKFLOW.md` file, letting the agent handle the entire lifecycle from issue ticket to merged PR.

## Source Links
* [OpenAI Releases Symphony: An Open Source Agentic Framework](https://www.marktechpost.com/2026/03/05/openai-releases-symphony-an-open-source-agentic-framework-for-orchestrating-autonomous-ai-agents-through-structured-scalable-implementation-runs/)
* [Symphony GitHub Repository](https://github.com/openai/symphony)
