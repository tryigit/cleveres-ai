# The Bitter Lesson of Tool Calling

**TL;DR:** An empirical study demonstrates that Programmatic Tool Calling (PTC) - where tools are exposed as Python stubs and invoked via code generation - systematically matches or outperforms rigid, native JSON tool calling across modern Large Language Models. This represents a paradigm shift from treating tool use as a structured JSON generation task to treating it as an executable coding task, unlocking natural chaining, parallelization, and greater robustness.

## The Core Problem: JSON is Rigid

Historically, integrating tools into Large Language Models meant forcing the model to output a strictly formatted JSON object (e.g., `{"name": "get_weather", "parameters": {"location": "London"}}`). This "native JSON tool calling" approach has severe limitations:
*   **Chaining is Clunky:** If a model needs to call Tool A, parse the result, and then pass it to Tool B, it requires multiple back-and-forth turns between the model and the application layer.
*   **Parallelization is Unnatural:** Asking a model to output multiple JSON objects simultaneously often degrades performance or leads to malformed syntax.
*   **Context Rot:** As conversational context grows and changes over time, models struggle to maintain the strict formatting rules required for JSON tool execution.

## The Solution: Programmatic Tool Calling (PTC)

Instead of relying on rigid JSON schemas, Programmatic Tool Calling exposes tools as typed Python functions. The LLM acts as an agent writing a script. The model generates code to execute the tools, handle the logic, and process the results in a single, autonomous turn.

In this paradigm, the model writes standard Python code:
```python
weather_london = get_weather(location="London")
weather_paris = get_weather(location="Paris")
return compare_weather(weather_london, weather_paris)
```

## Key Findings

The comprehensive evaluation across 14 language models on the BFCL v4 benchmark revealed significant advantages for PTC:
*   **Performance Tracking:** PTC matched or exceeded native JSON tool calling in 11 out of 14 models evaluated.
*   **Next-Gen Superiority:** The GPT-5.6 family achieved a massive 10.6% improvement over the JSON baseline when using programmatic calls.
*   **Parallel Execution:** PTC matched or outperformed the JSON baseline in 13 out of 14 models under parallel fan-out conditions.
*   **Robustness:** While standard JSON calling degraded by an average of 2.3% under "context rot" conditions (complex, lengthy conversational histories), PTC remained highly stable.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers):
If you are building advanced multi-step autonomous agents, abandon native JSON tool calling. Shift your architecture to executable code sandboxes. PTC allows models to handle their own intermediate logic, error catching, and complex tool chaining within a single turn, significantly increasing the ceiling of agentic capabilities.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers):
PTC drastically reduces the number of API round-trips required for complex tasks. Instead of the LLM calling you, waiting for a response, and calling you again, the LLM generates a complete script that executes the entire tool-chain locally within its sandbox. This single-turn execution model saves on network latency, token overhead, and inference costs.

### 🧑‍💻 THE EVERYDAY PROMPT ENGINEERS:
When interacting with code-capable models (like Claude 3.7 Sonnet or advanced GPT models), encourage the model to write and execute scripts rather than relying on UI-level tool integrations. Prompts like "Write a Python script to fetch the data, process it, and give me the summary" will generally yield more robust and complex results than relying on pre-configured, rigid JSON tool buttons.

## References
* [The Bitter Lesson of Tool Calling](https://arxiv.org/abs/2608.06370v1)

See also: [Model Context Protocol (MCP): The USB-C for AI](../concepts/model-context-protocol.md)