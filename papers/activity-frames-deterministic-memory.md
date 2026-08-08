# Activity Frames: Deterministic Screen-Activity Compilation for Agent Memory and Replay

**Category:** Frontier Research & Papers

## TL;DR
Computer-use agents typically rely on expensive frontier models (like Claude or GPT-4V) to re-evaluate and summarize raw screen captures or actions that users have already performed. This is because agent memory today records unstructured screen events or spoken descriptions, not deterministic, reusable "what the user did" routines.

"Activity Frames" introduces a zero-model compilation pipeline that parses passive local screen capture directly into structured, bounded activity frames. It identifies applications, sites, timing, and inputs deterministically, mapping everything back to raw data without using an LLM in the loop. The result is a massively compressed (86x smaller) context block that agents can read in milliseconds, allowing them to answer questions about a user's day with 98.4% accuracy (matching frontier models) while costing almost nothing to generate. Furthermore, compiled routines can replay deterministically without calling a model, dramatically reducing token consumption for repetitive tasks.

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
Researchers building autonomous computer-use agents can use deterministic framing to drastically improve recall accuracy. By compressing raw screen streams into typed, bounded episodes, agents can read days of context in a single prompt and achieve near-perfect query accuracy (98.4%) about past actions, far outperforming standard LLM-based summarization of raw logs.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
This is a game-changer for token cost and latency. The compiler runs locally and requires **zero model tokens** to segment and summarize screen activity. It reduces raw capture to context blocks that are 86x smaller. Even better, routine tasks can be replayed deterministically without the model in the loop, establishing a modeled token overhead reduction of 60-343x for delegated routines.

🧑‍💻 **THE EVERYDAY PROMPT ENGINEERS:**
If you use tools that interact with your screen or environment (like UI agents or automation tools), you will experience less "AI lag" and hallucination. The agent will have a flawless, deterministic memory of exactly what you clicked or typed, without needing to waste time re-analyzing screenshots.

## The Problem with Current Agent Memory
Today's agents read raw observations and use frontier model inference to derive what is happening. If a user does a routine task, the agent has to constantly re-evaluate the screen state to figure out what occurred.
1. LLM-based summarization of raw screen capture yields poor accuracy (66-80%).
2. Throwing full-res frames and raw logs into context windows is incredibly token-heavy and slow.
3. Routine tasks force the agent to repeatedly pay the "frontier inference tax" just to replay simple known actions.

## Deterministic Compilation Pipeline
The zero-model pipeline proposed completely shifts the paradigm:
- **Segmentation:** It bounds raw capture into distinct "episodes" based on typed activity (app, site, input volume, etc.).
- **Zero-Model:** The compilation relies entirely on mechanical parsing, meaning it is cacheable, deterministic, and auditable.
- **Traceability:** It maintains evidence pointers back to the raw rows.

When an agent needs to retrieve context, it reads these pre-compiled blocks rather than raw streams, allowing even mid-tier models to perform at the level of frontier models on memory-retrieval tasks.

## References
* [Activity Frames: Deterministic Screen-Activity Compilation for Agent Memory and Replay](https://arxiv.org/abs/2608.05784)

See also: [Are We Ready For An Agent-Native Memory System?](agent-native-memory-system.md), [Remember When It Matters: Proactive Memory Agent for Long-Horizon Agents](proactive-memory-agent.md)
