# Teaching Language Models to Think in Code

**Category:** Frontier Research / Papers
**Key Concepts:** Tool-integrated reasoning (TIR), Code-centric reasoning, ThinC Framework

## TL;DR
Tool-integrated reasoning (TIR) has been a dominant paradigm for mathematical problem solving, mixing natural language (NL) reasoning with code execution. However, this often leads to code acting merely as a post-hoc verifier while intermediate NL calculations remain error-prone. The **ThinC (Thinking in Code)** framework replaces this interleaved approach by using code itself as the primary reasoner. A brief NL planning step is followed entirely by code blocks connected via their execution outputs. ThinC models (1.7B and 4B) achieve impressive results on competition-level math benchmarks, with ThinC-4B even surpassing the massive 235B Qwen3 model.

## How ThinC Works

Current paradigms use code execution tools, but the primary reasoning still occurs in natural language (like [Chain-of-Thought (CoT)](../concepts/chain-of-thought.md)). This leads to overlapping roles and error accumulation.

ThinC reframes this:
1. **Initial Planning:** The model begins with a short natural language planning phase.
2. **Code as Reasoner:** From that point, all reasoning is offloaded to code. The model writes code, executes it, and uses the exact output of the interpreter as the ground truth for the next step.
3. **Recovery:** Because the model relies directly on interpreter feedback, it recovers reliably from execution failures without needing to fall back on error-prone intermediate NL reasoning.

The authors distilled 12.2k code-centric trajectories from a teacher model and trained ThinC models using supervised fine-tuning and [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md)-style techniques (RL). In testing, 99.2% of the model's final answers were definitively grounded in the code interpreter output.

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
For researchers building mathematical or logical reasoning agents, replacing natural language reasoning traces with pure code execution eliminates hallucinations in intermediate steps. This proves that smaller models (4B parameters) tightly coupled with exact code execution can outperform massive models (235B parameters) that rely on NL reasoning.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
ThinC offers a compelling efficiency argument: you can achieve state-of-the-art mathematical reasoning using a 4B parameter model instead of paying for API calls to a 200B+ parameter behemoth, drastically reducing deployment costs for math-heavy applications.

💻 **THE EVERYDAY PROMPT ENGINEERS:**
When prompting advanced models (like GPT-4 or Claude) for complex math or logic, force the model to "write and execute code for every step of the calculation instead of calculating it yourself." This mimics the ThinC approach and prevents the LLM from making basic arithmetic mistakes in its text generation.

## Sources
* Paper: [Teaching Language Models to Think in Code](https://arxiv.org/abs/2605.07237)
