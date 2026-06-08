# Critic-R: Improving Agentic Search using Instruction-tuned Retrievers with Natural Language Introspective Feedback

**TL;DR:** Optimizing retrieval models for agentic search systems is difficult, usually demanding heavy co-training or manual relevance annotations. **Critic-R** introduces a framework that uses natural language introspective feedback from a reasoning agent to directly evaluate whether retrieved context supports the next reasoning step. This closes the feedback loop, improving both the retrieval quality and the downstream answer accuracy.

## The Challenge of Agentic Search

In traditional [Retrieval-Augmented Generation](../concepts/retrieval-augmented-generation.md) (RAG), the system retrieves information once and then answers. In **agentic search**, the agent iteratively interacts with retrieval models, searching, reading, and refining queries to answer complex, multi-hop questions.

However, optimizing the retriever specifically for this dynamic, iterative process is challenging. It usually requires either heavy co-training of the agent and retriever, or expensive "gold-standard" manual annotations, which limits real-world scalability.

## Enter Critic-R

Critic-R explicitly closes the feedback loop between the reasoning agent and the retrieval model without relying on manual annotations. It does this by evaluating the agent's **introspective reasoning trace** after consuming the retrieved evidence.

The framework operates through two complementary mechanisms:

1.  **Critic-R-Zero (Inference-Time Loop):** An inference-time query refinement process. The system evaluates whether the retrieved context is sufficient. If not, it iteratively rewrites the queries and retrieval instructions based on the failed reasoning trace.
2.  **Critic-Embed (Training-Time Optimization):** An optimization approach for the retrieval models themselves. It leverages both the successful and failed refinement trajectories from the inference loop as automatic supervision. This trains the retriever without requiring manual relevance annotations.

Evaluations on benchmarks like HotpotQA, 2WikiMultihopQA, MuSiQue, and Bamboogle show that Critic-R significantly improves both the quality of the retrieved information and the final accuracy of the agent's answers.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
For developers building complex, multi-step reasoning agents (like open-source alternatives to DeepResearch), Critic-R offers a scalable training methodology. By leveraging introspective feedback as automatic supervision (Critic-Embed), you can continuously train and align your embedding/retrieval models specifically for agentic workflows without paying human annotators.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
While Critic-Embed improves the underlying model, Critic-R-Zero (the inference loop) might increase latency due to iterative query rewriting. To optimize costs, developers could use smaller, cheaper models (like GPT-4o-mini or Claude 3 Haiku) specifically dedicated to the "critic" role of evaluating context sufficiency and rewriting queries, reserving larger models only for the final synthesis.

### 💻 THE EVERYDAY PROMPT ENGINEERS
When you use a tool like Perplexity or ChatGPT's Search feature and notice it "searching again" after failing to find the right information, you are seeing a basic version of this in action. To mimic this manually, if you provide documents to an LLM and it struggles, explicitly ask it to "evaluate if this document contains the answer, and if not, suggest three specific new search queries I should run to find it."

## Sources
*   [Critic-R: Improving Agentic Search using Instruction-tuned Retrievers with Natural Language Introspective Feedback](https://arxiv.org/abs/2606.00590) (Hugging Face Daily Papers)
