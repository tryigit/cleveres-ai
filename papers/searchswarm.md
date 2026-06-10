# SearchSwarm: Towards Delegation Intelligence in Agentic LLMs for Long-Horizon Deep Research

**Category:** Frontier Research & Papers
**Link:** [SearchSwarm (arXiv:2606.09730)](https://arxiv.org/abs/2606.09730)

## TL;DR
As Large Language Models (LLMs) take on more complex, long-horizon tasks, they often hit the limits of their finite context windows. The **SearchSwarm** paradigm proposes a solution where a "main agent" acts as a manager, decomposing complex tasks and delegating subtasks to "subagents." These subagents handle the heavy lifting of specific queries and return only summarized results, significantly preserving the main agent's context budget. The researchers trained **SearchSwarm-30B-A3B**, a model specifically fine-tuned for "delegation intelligence", achieving state-of-the-art results on deep research benchmarks by learning exactly *when* and *what* to delegate.

---

## The Problem: Context Window Exhaustion
Even with massive advancements in model context sizes (e.g., millions of tokens), real-world tasks like open-ended deep research require reading dozens of long documents, synthesizing data, and continuously re-evaluating the goal. A single monolithic agent attempting to hold all this information in its working memory will inevitably suffer from:
1.  **Context Exhaustion:** Hitting the hard token limit.
2.  **Attention Dilution:** Struggling to focus on the core objective amidst a sea of irrelevant scraped text.
3.  **High Latency & Cost:** Re-processing a massive prompt prefix for every single step of reasoning. (See: [Context Caching](../techniques/context-caching.md) for related mitigation strategies).

## The Solution: Delegation Intelligence
The researchers introduce the concept of **Delegation Intelligence**: the specific capability of an agentic model to:
1.  Decompose a massive objective into digestible sub-tasks.
2.  Decide *when* it is appropriate to delegate a task to a subagent vs. handling it directly.
3.  Formulate clear instructions for the subagent.
4.  Seamlessly integrate the *summarized* results returned by the subagent back into the primary workflow.

### Training for Delegation (SearchSwarm-30B-A3B)
Because high-quality examples of this exact managerial behavior are scarce in standard text data, the team created a specialized training harness. This harness guides the model through proper task decomposition, enforcing constraints that require subagents to return concise results.
By generating trajectories that encode these correct delegation decisions, they created a Supervised Fine-Tuning (SFT) dataset. The resulting model, **SearchSwarm-30B-A3B**, successfully internalized this behavior and outperformed all comparable open-source models on benchmarks like BrowseComp.

---

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
**How to use it:** If you are building autonomous "Deep Research" agents, stop trying to shove everything into a single massive context window. Implement a hierarchical swarm architecture. Use a highly capable "manager" model that is explicitly prompted (or fine-tuned) to dispatch isolated research tasks to worker nodes, ensuring the manager only reads the final executive summaries.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
**How to use it:** Delegation intelligence is a massive cost-saver. Instead of paying for a 128k-token context window on a frontier model for every step of a web-scraping task, use smaller, cheaper models (or standard scrapers) as the subagents. The main, expensive agent only runs inference on a tightly compressed summary of the findings, drastically reducing token consumption.

### 💻 THE EVERYDAY PROMPT ENGINEERS
**How to use it:** You can simulate this behavior manually in ChatGPT or Claude. Instead of asking one chat session to "research X, Y, and Z and write a report," open three separate tabs. Ask Tab 1 to summarize X, Tab 2 to summarize Y, and Tab 3 to summarize Z. Then, copy *only* those short summaries into a final "Manager" tab to write the report. This prevents the model from getting confused by too much raw source material.

---

## References
*   [SearchSwarm: Towards Delegation Intelligence in Agentic LLMs for Long-Horizon Deep Research (arXiv:2606.09730)](https://arxiv.org/abs/2606.09730)
