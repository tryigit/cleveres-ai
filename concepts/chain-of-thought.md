# Chain-of-Thought (CoT): Eliciting Reasoning in LLMs

**Category:** Foundational / Concepts
**Key Concepts:** Intermediate Reasoning Steps, System 2 Thinking, Zero-shot CoT, Few-shot CoT

## TL;DR
Chain-of-Thought (CoT) is a technique that enables Large Language Models (LLMs) to solve complex reasoning tasks - like math word problems or common sense logic - by generating a sequence of intermediate reasoning steps. Instead of jumping directly from a question to an answer, the model is guided (or trained) to "show its work." This mimics human cognitive processes (System 2 thinking) and significantly improves performance on hard tasks.

---

## The Core Concept: System 2 Thinking
Psychologist Daniel Kahneman distinguishes between two modes of thought:
*   **System 1:** Fast, instinctive, and emotional (e.g., "What is 2+2?").
*   **System 2:** Slow, deliberative, and logical (e.g., "What is 17 x 24?").

Standard LLMs operate primarily in "System 1" mode - they predict the next token based on statistical likelihood. Chain-of-Thought forces the model into a "System 2" simulation. By generating intermediate text, the model effectively gives itself more computation time (more tokens = more time) to process the problem before committing to a final answer.

## The Breakthrough: Wei et al. (2022)
The term was popularized by the paper *"Chain-of-Thought Prompting Elicits Reasoning in Large Language Models"* by Jason Wei and colleagues at Google Brain. They found that standard prompting fails on tasks requiring multi-step logic.

**Example without CoT (Standard Prompting):**
> Q: Roger has 5 tennis balls. He buys 2 more cans of tennis balls. Each can has 3 tennis balls. How many tennis balls does he have now?
> A: The answer is 11.

**Example with CoT (Few-Shot):**
> Q: Roger has 5 tennis balls. He buys 2 more cans of tennis balls. Each can has 3 tennis balls. How many tennis balls does he have now?
> A: Roger started with 5 balls. 2 cans of 3 tennis balls each is 6 tennis balls. 5 + 6 = 11. The answer is 11.

By providing examples of *reasoning*, the model learns to output reasoning for new problems.

## Evolution: From Prompting to Training
While CoT started as a prompting technique ("Let's think step by step"), it has now evolved into a training methodology. Modern reasoning models like **[DeepSeek-R1](../models/deepseek-r1.md)** and OpenAI's o1 are explicitly trained with Reinforcement Learning to generate long, internal Chains of Thought automatically. They don't just mimic the style; they actually use the token generation process to search for solutions and self-correct.

---

## Real-World Application & Who Should Care

### 🚀 The Performance Monsters (SOTA Seekers)
**Why you care:** CoT is the single most effective way to boost performance on symbolic reasoning, coding, and mathematical tasks without changing the underlying model.
**Action:** Always implement CoT for complex tasks. If using a standard model (like GPT-4o or Claude 3.5 Sonnet), force it to outline its logic before answering. For maximum performance, switch to native reasoning models like DeepSeek-R1 that do this natively.

### 💰 The Cost & Latency Optimizers (API Developers)
**Why you care:** CoT comes with a cost. Generating reasoning steps consumes more output tokens, which increases both latency and API bills.
**Action:** Use CoT selectively. For simple queries ("Who is the president of France?"), standard prompting is cheaper and faster. For complex logic, the extra cost of CoT is often cheaper than the cost of a wrong answer that requires retry.

### 🧑‍💻 The Everyday Prompt Engineers
**Why you care:** You can instantly upgrade the intelligence of any chatbot (ChatGPT, Claude, Gemini) with a simple magic phrase.
**Action:** Append the phrase **"Let's think step by step"** to the end of your prompt (this is known as "Zero-shot CoT"). This simple instruction often triggers the model's reasoning capabilities without needing complex examples.

---

## References
*   [Chain-of-Thought Prompting Elicits Reasoning in Large Language Models (Wei et al., 2022)](https://arxiv.org/abs/2201.11903)
*   [Large Language Models are Zero-Shot Reasoners (Kojima et al., 2022)](https://arxiv.org/abs/2205.11916) - The origin of "Let's think step by step".
