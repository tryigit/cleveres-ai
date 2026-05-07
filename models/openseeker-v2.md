# OpenSeeker-v2: Pushing the Limits of Search Agents with Informative and High-Difficulty Trajectories

**Category:** Frontier / Models
**Key Concepts:** Agentic Search, Supervised Fine-Tuning (SFT), ReAct Paradigm, Data Synthesis

## TL;DR
OpenSeeker-v2 is an open-source, 30B parameter frontier search agent developed by an academic team that achieves state-of-the-art performance using only a simple Supervised Fine-Tuning (SFT) approach. Trained on a remarkably small dataset of just 10.6k high-difficulty trajectories, it outperforms systems backed by massive industrial giants that utilize heavy pipelines combining Continual Pre-Training (CPT), SFT, and Reinforcement Learning (RL), such as Tongyi DeepResearch.

---

## The Paradigm Shift: Quality SFT over Heavy RL
Traditionally, creating a highly capable search agent requires a resource-intensive development cycle. The typical industry recipe includes:
1.  **Pre-training**
2.  **Continual Pre-training (CPT)**
3.  **Supervised Fine-tuning (SFT)**
4.  **Reinforcement Learning (RL)** (often including complex methods like [RLHF](../concepts/rlhf.md))

OpenSeeker-v2 challenges this norm. The authors demonstrate that when an SFT process is fueled by a highly curated set of *informative and high-difficulty trajectories*, the complex and computationally expensive RL phase can be bypassed entirely without sacrificing performance.

### Three Data Synthesis Modifications
The secret to OpenSeeker-v2's success lies in its data preparation. The team introduced three simple but highly effective modifications to the data synthesis pipeline:
1.  **Scaling Knowledge Graph Size:** Enabling richer exploration by giving the agent access to broader, more interconnected data structures during training.
2.  **Expanding the Tool Set Size:** Providing the agent with a broader range of functional tools, simulating more realistic and demanding search scenarios.
3.  **Strict Low-Step Filtering:** Filtering out simplistic trajectories that are solved in very few steps, forcing the model to learn complex, multi-step reasoning and search strategies.

## State-of-the-Art Performance
Trained on merely 10.6k data points, OpenSeeker-v2 (using a 30B-sized agent with the ReAct paradigm) achieved remarkable results across several benchmarks:
*   **BrowseComp:** 46.0% (surpassing Tongyi DeepResearch's 43.4%)
*   **BrowseComp-ZH:** 58.1% (surpassing Tongyi DeepResearch's 46.7%)
*   **Humanity's Last Exam:** 34.6% (surpassing Tongyi DeepResearch's 32.9%)
*   **xbench:** 78.0% (surpassing Tongyi DeepResearch's 75.0%)

This makes OpenSeeker-v2 the first SOTA search agent within its scale and paradigm to be developed entirely by an academic team relying exclusively on SFT.

---

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
OpenSeeker-v2 provides an open-weight, highly capable 30B agent that can act as a foundation for building custom, deep-research workflows. Researchers can build upon this SFT-only baseline without needing the massive compute clusters required for complex RL training loops.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
The findings of this paper offer a massive cost-saving blueprint. By focusing on synthesizing a very small amount (10.6k) of high-quality, high-difficulty trajectory data for SFT, engineering teams can build highly capable internal search agents without paying for the massive compute overhead associated with Reinforcement Learning pipelines.

### 💻 THE EVERYDAY PROMPT ENGINEERS (Regular Users)
Understanding that smaller, highly curated data can beat massive datasets implies that when building your own custom agents (e.g., via GPTs or Claude tools), focusing on a few extremely difficult, multi-step examples in your system prompt or knowledge base will likely yield better search and reasoning results than flooding the agent with simple examples.

---

## Sources
*   [OpenSeeker-v2: Pushing the Limits of Search Agents with Informative and High-Difficulty Trajectories (arXiv:2605.04036)](https://arxiv.org/abs/2605.04036)
