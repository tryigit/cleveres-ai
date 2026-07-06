# Securing the AI Agent: A Unified Framework for Multi-Layer Agent Red Teaming

**TL;DR:**
As the ecosystem for AI agents expands across infrastructure, protocols, and language models, a single security paradigm is no longer sufficient. This paper introduces AI-Infra-Guard, an open-source framework that matches specific red teaming approaches to distinct layers of the attack surface. From deterministic rule matching for vulnerabilities to LLM-driven agentic auditing of [Model Context Protocol (MCP): The USB-C for AI](../concepts/model-context-protocol.md) servers, this framework provides a comprehensive defense foundation for modern agentic systems.

## Real-World Application & Who Should Care

### The Performance Monsters (SOTA Seekers)
Security teams and advanced AI developers building complex multi-agent orchestrations can use AI-Infra-Guard to systematically stress-test their architectures. The framework offers multi-turn black-box red teaming and a jailbreak harness with over 26 attack operators, enabling developers to discover and patch sophisticated vulnerabilities before deployment.

### The Cost & Latency Optimizers (API Developers)
For platform engineers managing agent tools and server backends (such as MCP implementations), this framework offers supply-chain auditing and deterministic rule matching across 75+ AI components. Identifying insecure skill packages early prevents costly data breaches or API abuse, ensuring that the infrastructure remains secure without introducing runtime latency bottlenecks from ad-hoc security patches.

### The Everyday Prompt Engineers
While this framework is primarily designed for developers and red teamers, everyday prompt engineers should be aware that the security of AI agents is becoming multi-layered. When interacting with agentic systems, you can have greater confidence that the tools and skills the agent uses have been rigorously audited for safety and protocol integrity.

## References
* [Securing the AI Agent: A Unified Framework for Multi-Layer Agent Red Teaming](https://huggingface.co/papers/2606.31227)
