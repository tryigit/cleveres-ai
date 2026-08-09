# FactorJEPA: Factorizing Monolithic Futures into Layout-Agent-Interaction Channels

## TL;DR
World models, particularly Joint Embedding Predictive Architectures (JEPAs), excel at capturing physical dynamics. However, existing models struggle in DENSEWORLD environments—crowded, chaotic, and densely populated Global South urban settings characterized by persistent occlusion and extreme agent heterogeneity. FactorJEPA addresses this by factorizing the monolithic future representation into distinct layout, agent, and interaction channels using a visibility gate and separated subspaces. Evaluated on the newly introduced DENSEWORLD-115k dataset (1,000 hours of diverse urban footage), FactorJEPA significantly improves future-latent accuracy, intervention-sensitive prediction, and robustness to reduced visual evidence compared to standard V-JEPA baselines.

## FactorJEPA & DENSEWORLD
Most autonomous driving or world modeling benchmarks focus on lower-density, well-structured (lane-following) environments. DENSEWORLD represents the opposite: soft spatial boundaries, mixed traffic, and rapid social negotiation.

To handle this, FactorJEPA shifts away from predicting a single, monolithic future latent vector. Instead, it treats world structure as a "first-class predictive primitive." By composing predictions into independent layout, entities, and interaction subspaces, the architecture discourages the model from taking cross-factor shortcuts and helps preserve representations of partially observed or occluded agents.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
Robotics and autonomous vehicle researchers can utilize the DENSEWORLD-115k dataset and the FactorJEPA architecture to train world models that are robust to the chaotic, highly occluded environments found in developing nations, pushing beyond the sterile environments of standard driving datasets.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
By utilizing a factorized latent space, predictive models can be more parameter-efficient and robust to missing data. This could allow for running smaller, specialized predictive sub-models (e.g., just querying the "layout" or "interaction" channels) in edge-computing scenarios, reducing total inference costs for autonomous systems.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
While this is a deep architecture innovation, it signals a shift towards AI models that can better understand and simulate chaotic, heavily occluded video data. This will eventually power more reliable video-generation and video-reasoning tools available in consumer applications.

## See Also
* [Qwen-AgentWorld: Language World Models for General Agents](qwen-agentworld.md)

## References
* [FactorJEPA: Factorizing Monolithic Futures into Layout-Agent-Interaction Channels for Crowded and Chaotic Global South Urban Worlds](https://arxiv.org/abs/2608.01049)
