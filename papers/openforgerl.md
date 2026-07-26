# OpenForgeRL: Train Harness-native Agents in Any Environment

## TL;DR
OpenForgeRL is an open-source framework designed to train harness-based agents (like [Claude Code: Anthropic's Agentic CLI Assistant](../news/claude-code.md)) end-to-end in diverse environments. It overcomes the limitations of existing open infrastructure by decoupling training and inference using a lightweight proxy and a Kubernetes orchestrator. This allows for training on any harness at scale, improving agentic reliability through reinforcement learning techniques like [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md).

## Real-World Application & Who Should Care

*   **(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):** AI researchers building complex, stateful agents can use OpenForgeRL to perform multi-process training at scale. By integrating directly with real harnesses and environments, researchers can boost capabilities like self-verification and tool coverage.
*   **(Money) THE COST & LATENCY OPTIMIZERS (API Developers):** For teams running complex multi-step agents, training the agent end-to-end within its actual deployment harness can streamline the architecture and potentially reduce the number of redundant or erroneous calls, optimizing overall system cost.
*   **(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:** While primarily an infrastructure tool, the improvements brought by OpenForgeRL will eventually trickle down into more robust and reliable autonomous agents, meaning user prompts to agentic systems will yield higher success rates with fewer multi-step failures.

## Overview
Modern AI agents heavily rely on intricate inference harnesses to handle multi-turn reasoning and tool use. However, standard SFT and RL stacks often fail to support these stateful, multi-process operations natively. OpenForgeRL solves this by:

1.  **Lightweight Proxy:** Serving the harness's model calls while recording them as training data for a standard RL codebase.
2.  **Kubernetes Orchestrator:** Running each rollout in its own remote container.

This decoupling of training and inference enables researchers to train agents directly in the environments they are deployed with. Empirical results demonstrate that models trained with OpenForgeRL out-perform open baselines on rigorous benchmarks, validating that RL can significantly enhance agentic behaviors such as completing multi-step plans.

## References
* [OpenForgeRL: Train Harness-native Agents in Any Environment](https://arxiv.org/abs/2607.21557)
