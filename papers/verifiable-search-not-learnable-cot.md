# A Verifiable Search Is Not a Learnable Chain-of-Thought

## TL;DR
It is commonly assumed that if a task can be solved by a short program, it can be taught to a language model as a chain-of-thought (CoT). This paper demonstrates that this assumption fails for an identifiable class of procedures: combinatorial search over information-free structure. Through experiments distilling Python solvers into a 30B model via LoRA, the author found that while forward-computable tasks install readily (e.g., arithmetic), backtracking search (like Cryptarithm) fails completely. Even with extensive CoT designs, RL from verifiable rewards, and self-training, the model cannot carry the search forward as a left-to-right derivation. The task only becomes learnable when the search is removed by precomputing the combinatorial core into a catalog, reducing the trace to recall plus verification. Ultimately, the paper proves that LLMs distill memorization and verification, not genuine search.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
When training or fine-tuning models on complex reasoning paths, do not try to force the model to learn raw backtracking search algorithms (like Sudoku or Cryptarithm) via left-to-right chain-of-thought fine-tuning. The architecture fundamentally resists this. Instead, reframe the task by precomputing the combinatorial core or offloading the actual search to external tools, training the model only on the verification step.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
If you are generating massive synthetic datasets to teach your models how to perform search-heavy tasks, you are wasting compute. Fine-tuning an LLM to blindly guess and backtrack left-to-right is highly inefficient and ineffective. Save money by routing search-based tasks to deterministic Python scripts, and use the LLM solely to format the input and verify the output.

### 💻 THE EVERYDAY PROMPT ENGINEERS
If you are prompting an LLM to solve a puzzle or a problem that requires combinatorial search (like "try A, if A fails, try B..."), the model will likely fail if you just ask it to "think step by step". You need to break the search down for it, provide the exact combinations to try, or give it explicit, forward-computable rules rather than expecting it to successfully navigate a complex decision tree purely via text generation.

## See also
* [Chain-of-Thought (CoT): Eliciting Reasoning in LLMs](../concepts/chain-of-thought.md)

## References
* [A Verifiable Search Is Not a Learnable Chain-of-Thought](https://arxiv.org/abs/2606.21884)
