# KellyBench: Evaluating Long-Horizon Sequential Decision Making

**Category:** Frontier / Papers
**Date:** April 2026

## TL;DR
Language models are easily beating standard benchmarks for procedural tasks, but they struggle in long-horizon, non-stationary environments. KellyBench is a new benchmark that places AI agents in a sequential simulation of the 2023-24 English Premier League season, tasking them with maximizing long-term bankroll growth in sports betting markets. The results show a massive capability gap: all frontier models evaluated lose money on average, with the best model returning -8% and many experiencing total ruin.

---

## The Problem with Current Benchmarks
Existing benchmarks often test models on narrow, well-defined procedural tasks with clear objectives. However, as agents are increasingly deployed in real-world environments, they face "long-horizon" and "non-stationary" challenges. This means the environment changes over time, and a decision made now can have compounding effects far into the future. Current benchmarks fail to adequately measure a model's ability to adapt, manage risk, and identify edge cases over extended periods.

## The KellyBench Environment
To test true long-horizon reasoning, researchers introduced KellyBench. In this environment:
*   Agents are placed in a sequential simulation of a full sports season (the 2023-24 English Premier League).
*   Their goal is open-ended: maximize long-term bankroll growth.
*   They are provided with detailed historical data, advanced statistics, lineups, and public odds.
*   To succeed, agents must build machine learning models, identify market edges, and adapt their strategies as the season progresses.

## The Reality Check: Frontier Models Fail
The performance of current state-of-the-art models on KellyBench is starkly negative. Over the course of the simulated season (across five seeds), all evaluated frontier models lost money on average.
*   **Best Performance:** The best performing model achieved an average return of -8%.
*   **Frequent Ruin:** Many models experienced total ruin (losing their entire bankroll) across different seeds.
*   **Lack of Sophistication:** When graded by human experts, the agents' strategies were deemed highly unsophisticated compared to human baselines. Even advanced models like [Claude Opus 4.6](../models/claude-opus-4-6.md) scored poorly on human expert rubrics assessing strategy, indicating significant room for improvement in sequential decision-making.

---

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
*   **New Architectures Needed:** The failure of frontier models on KellyBench indicates that simply scaling current LLM architectures is insufficient for complex, open-ended sequential decision-making. Researchers must focus on new paradigms integrating reinforcement learning, continuous adaptation, and long-term risk management.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
*   **Proceed with Caution in Financial Apps:** Developers building autonomous trading or financial management agents using current LLMs must implement strict guardrails. The models' demonstrated inability to manage a bankroll or avoid ruin in a simulated environment suggests they are not yet reliable for unmonitored financial decisions.

### 💻 THE EVERYDAY PROMPT ENGINEERS
*   **Understanding Limits:** When using AI for tasks that require long-term planning and adapting to changing conditions (like managing a complex project over months), do not rely on the model to self-correct its overarching strategy. Human oversight remains crucial for steering long-horizon tasks.

**Source:** [KellyBench: A Benchmark for Long-Horizon Sequential Decision Making](http://arxiv.org/abs/2604.27865v1)
