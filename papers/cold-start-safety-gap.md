# The Cold-Start Safety Gap in LLM Agents

## TL;DR
Tool-calling LLM agents are not equally safe throughout an entire conversation. A new study reveals a **Cold-Start Safety Gap**: agents are significantly more vulnerable to safety threats at the very beginning of a session. As the agent completes regular, benign tasks, its safety alignment substantially improves (by 9% to 52%). To mitigate this vulnerability, developers should deploy a "warm-up" strategy where agents complete a few regular tasks before being exposed to potentially safety-critical requests.

## The Discovery: Safety Over Depth

The assumption that an aligned model maintains a constant level of safety throughout an interaction is flawed when applied to tool-using agents.

1.  **The Cold-Start Vulnerability:** When a session first begins (zero preceding tasks), the agent is at its most vulnerable state and is more likely to execute unsafe tool calls or generate harmful responses.
2.  **Safety Through Task Completion:** By using a new benchmark called SODA (Safety Over Depth for Agents), researchers found that safety improves dramatically (up to 52%) as the agent completes up to 20 regular, benign agentic tasks.
3.  **Hidden State Shifts:** Representation analysis shows that as the model processes these preceding tasks, its hidden states gradually shift toward a more safety-aligned region in its internal representation space.
4.  **Task vs. Prior Responses:** The primary driver of this increased safety is the *regular agentic tasks themselves* (the user prompts/system contexts), rather than the agent's own prior generated responses. However, the agent's prior responses are necessary to maintain its overall utility and capability for subsequent tasks.

## Real-World Application & Who Should Care

🚀 **THE PERFORMANCE MONSTERS (SOTA Seekers):**
For those building complex, multi-agent frameworks or long-horizon autonomous agents, this research highlights a critical dynamic: internal model representations shift during extended context windows. Agent safety evaluations must account for context depth, and benchmarks should test both cold-start and deep-context states.

💰 **THE COST & LATENCY OPTIMIZERS (API Developers):**
If you are deploying LLM agents in production (e.g., customer support, automated data processing) where security is paramount, you must implement a "warm-up" phase. Before giving the agent access to sensitive APIs or exposing it to unpredictable user inputs, programmatically force it to complete a few benign, pre-defined tasks. This effectively "boots up" its safety alignment without sacrificing its capabilities, drastically reducing the risk of a Day-0 prompt injection or tool misuse.

💻 **THE EVERYDAY PROMPT ENGINEERS:**
If you are using a tool-calling agent (like Claude's Computer Use or an OpenAI custom GPT with actions) and want to ensure it strictly follows safety guidelines or complex constraints, don't give it the most dangerous or critical task immediately upon starting a new chat. Chat with it first-ask it to perform a few simple, standard tasks to establish the context-and *then* give it the critical instruction.

## References
*   [The Cold-Start Safety Gap in LLM Agents](https://arxiv.org/abs/2606.07867)

See also: [TraceSafe: Systematic Assessment of LLM Guardrails on Multi-Step Trajectories](tracesafe.md)
