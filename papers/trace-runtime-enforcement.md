# Getting Better at Working With You: Compiling User Corrections into Runtime Enforcement for Coding Agents

**Category:** Frontier / Research Paper
**Paper:** [Getting Better at Working With You: Compiling User Corrections into Runtime Enforcement for Coding Agents](https://arxiv.org/abs/2606.13174)

## TL;DR
Current LLM agents often fail to remember or apply user corrections across different sessions, creating a gap between preference access and preference compliance. Test-time Rule Acquisition and Compiled Enforcement (TRACE) is a skill-layer pipeline that solves this by mining user chat corrections, converting them into atomic rules, and compiling them into strict runtime checks. These checks must pass before the agent can complete future tasks, significantly reducing repeated-friction failures.

---

## The Problem: The Gap in Preference Compliance
When an interactive LLM coding agent makes a mistake, the user often corrects it via chat (e.g., "Don't use `eval()` here"). While the agent might apologize and comply in the current session, it often forgets or ignores the rule in the next session.

Traditional memory systems (like Mem0) simply store these corrections as text and inject them into the system prompt. However, simply *accessing* the preference does not guarantee *compliance*. In testing, standard memory systems still left 57.5% of applicable preference checks violated because the agent simply ignored the text instructions.

## The TRACE Pipeline
TRACE addresses this by shifting from passive memory to active runtime enforcement:

1.  **Mining Corrections:** TRACE analyzes the user's chat history to find friction points and explicit user corrections.
2.  **Rule Acquisition:** It rewrites these corrections into distinct, atomic rules (e.g., "Rule: Do not use the `eval` function in Python scripts").
3.  **Compiled Enforcement:** It compiles these rules into active runtime checks. Before the coding agent is allowed to mark a future task as complete, the TRACE layer runs these checks against the agent's proposed code. If the check fails, the agent is forced to rewrite the code until it passes.

Unlike standard runtime checks written manually by developers, TRACE skills are generated directly from the user's own chat corrections, creating a highly personalized, strict enforcement layer. On out-of-distribution tasks, TRACE reduced held-out preference violation from 100.0% to just 2.0%.

---

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
*   **Beyond RLHF:** Researchers can use TRACE-like mechanisms as a lightweight, test-time alternative or supplement to [Reinforcement Learning from Human Feedback (RLHF)](../concepts/rlhf.md). Instead of retraining the model's weights to prefer certain coding styles, TRACE structurally forces compliance at runtime.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
*   **Reducing Agent Retry Loops:** While TRACE adds a runtime check, preventing the agent from deploying code that violates known user preferences saves expensive rework. If an agent builds a whole project using a banned library, the cost to rewrite it is massive. Failing the agent early via TRACE saves tokens.

### 💻 THE EVERYDAY PROMPT ENGINEERS
*   **Prompting for Verification:** If you are using a standard chatbot without TRACE, you can simulate it manually. At the end of your prompt, add: "Before you output your final code, read through the code and explicitly verify that you did not violate Rule X or Rule Y. Show me your verification step."

---

## References
*   [Getting Better at Working With You: Compiling User Corrections into Runtime Enforcement for Coding Agents](https://arxiv.org/abs/2606.13174)
