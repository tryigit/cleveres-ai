# NatureBench: Can Coding Agents Match the Published SOTA of Nature-Family Papers?

## TL;DR
NatureBench is a cross-discipline benchmark consisting of 90 tasks distilled from peer-reviewed Nature-family publications. It is designed to evaluate whether AI coding agents can move beyond simple reproduction toward discovery on real scientific problems. Built on the automated NatureGym pipeline, it constructs standardized, containerized environments from source papers to solve the environment-fragmentation problem. An evaluation of ten frontier agent configurations under a strict web-search-disabled protocol reveals that the strongest model surpasses SOTA on only 17.8% of tasks under the g>0.1 criterion. Agents primarily succeed through methodological translation (converting scientific tasks into supervised prediction problems) rather than genuine scientific invention. Failures are mostly due to incorrect method choice and insufficient compute budget, not task misunderstanding.

## Real-World Application & Who Should Care

### 🚀 THE PERFORMANCE MONSTERS (SOTA Seekers)
Researchers and advanced developers can leverage NatureBench and the NatureGym pipeline to rigorously evaluate their custom agentic models against real, complex scientific tasks. It provides a standardized framework to test whether new agent architectures or reasoning frameworks can genuinely invent new scientific methods or if they are just translating tasks into supervised learning.

### 💰 THE COST & LATENCY OPTIMIZERS (API Developers)
While the benchmark itself is compute-intensive, understanding the failure modes (like insufficient compute budget leading to failure) is crucial. Developers building systems that deploy agents can use these insights to better allocate compute resources dynamically based on task complexity, ensuring that agents don't fail simply because they ran out of time or budget before trying the right method.

### 💻 THE EVERYDAY PROMPT ENGINEERS
When using coding agents for complex, novel problems, be aware that current models often struggle to invent new methods. Instead, they try to map your problem onto a familiar supervised prediction task. You can improve results by explicitly prompting the agent to consider alternative, non-standard methodologies if standard approaches fail, and by ensuring you give the agent sufficient context and budget to explore.

## See also
* [OpenThoughts-Agent: Data Recipes for Agentic Models](openthoughts-agent.md)

## References
* [NatureBench: Can Coding Agents Match the Published SOTA of Nature-Family Papers?](https://arxiv.org/abs/2606.24530)
