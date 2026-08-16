# Context-Matched Distillation: Teacher Causality for Autoregressive Video Distillation

## TL;DR
Interactive autoregressive video generation requires both low-latency rollouts and precise online control, imposing a causal constraint where frames must depend only on history and controls available during generation. Standard distribution matching distillation (DMD) pipelines often supervise students using bidirectional teachers that score complete clips, misaligning with the student's causal constraints by scoring targets based on future, unavailable frames. **Context-Matched Distillation (CMD)** solves this by using a causal teacher to evaluate each target without future access, and a Prefix Scoring mechanism that matches supervision to the student's realized rollout context. This simple causal formulation improves performance on autoregressive video benchmarks and significantly enhances adherence to time-varying camera controls.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
This method is critical for building state-of-the-art interactive video models or embodied AI simulators where causal adherence to controls is required. Using CMD ensures that distilled autoregressive generation does not "cheat" by learning non-causal dependencies that fall apart during actual online rollout.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
CMD accelerates generation through few-step distillation without breaking causality. This means you can deploy autoregressive video or continuous world models in production with significantly lower compute budgets and latency, while maintaining strict responsiveness to user inputs or continuous control signals.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
While this is a backend distillation architecture, it ultimately powers faster and more coherent interactive generation tools. Future interfaces allowing real-time camera manipulation or scene interaction in video synthesis will directly benefit from the causal responsiveness enabled by this approach.

See also: [Transformer Architecture: The Engine of Modern AI](../concepts/transformer-architecture.md)

## References
* [Context-Matched Distillation: Teacher Causality for Autoregressive Video Distillation](https://arxiv.org/abs/2608.13391)
