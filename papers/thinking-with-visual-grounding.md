# Thinking with Visual Grounding

**Category:** Frontier / Papers
**Key Concepts:** Visual Grounding, Chain-of-Thought, Vision-Language Models, Reinforcement Learning

## TL;DR
**Thinking with Visual Grounding** introduces a reasoning process where Vision-Language Models (VLMs) interleave natural-language thoughts with explicit point or box groundings of the visual evidence used at each step. This allows the model to express intermediate reasoning in language while grounding key objects in the image regions they refer to. Across spatial reasoning benchmarks, visually grounded thinking allows a 4B parameter model to match or surpass a 27B parameter model from the same family.

---

## The Core Concept: Tying Thoughts to Pixels

While recent VLMs can produce natural-language reasoning traces (like [Chain-of-Thought (CoT)](../concepts/chain-of-thought.md)), these traces often leave the supporting image regions implicit. This makes them hard to verify and difficult to supervise. "Thinking with Visual Grounding" explicitly links the generated text to the image evidence.

### 1. Grounding-Aware Synthesis Pipeline
To train this behavior, the researchers constructed a scalable synthesis pipeline that:
1.  Distills correct visual reasoning traces.
2.  Extracts the visual objects required by the traces.
3.  Grounds them with a SAM3-based agent.
4.  Derives aligned point and box supervision from the resulting masks.

### 2. Grounding-Aware Reinforcement Learning
The model is then trained using grounding-aware reinforcement learning, which combines standard answer correctness rewards with dense grounding rewards. These grounding rewards score whether generated object references in the text match the correct image evidence.

## Performance: 4B Matching 27B

Adding visually grounded thinking to Gemma3-4B-IT consistently improves performance over the original model and the non-grounded thinking baseline across counting and spatial reasoning benchmarks.

Remarkably, on spatial reasoning tasks, the visually grounded thinking 4B models match, and in some cases surpass, the performance of the much larger [Gemma 3](../models/gemma-3.md) (27B-IT variant). The study found that point grounding is well suited to counting, while box grounding benefits most from explicit grounding rewards on spatial tasks.

---

## Real-World Application & Who Should Care

### 🚀 For The Performance Monsters (SOTA Seekers)
**Verifiable and Accurate Visual Reasoning.**
By forcing models to ground their thoughts in visual evidence, you can significantly boost accuracy on complex spatial and counting tasks. The explicit grounding also allows for easier verification of the model's intermediate steps.

### 💰 For The Cost & Latency Optimizers (API Developers)
**Small Models Beating Giants.**
This paper demonstrates that a 4B parameter model with visual grounding can match a 27B parameter model on spatial reasoning. This translates directly to massive cost and latency savings for developers running multi-modal APIs by allowing them to use much smaller, faster models.

### 💻 For The Everyday Prompt Engineers
**Prompting for Evidence.**
While you might not be training models, you can apply this concept when prompting. Explicitly ask multi-modal models to describe the location (e.g., coordinates, relative positions) of the objects they are reasoning about. This forces a form of "grounded thinking" that can reduce hallucinations.

---

## References
* [Thinking with Visual Grounding](https://arxiv.org/abs/2606.16122)
