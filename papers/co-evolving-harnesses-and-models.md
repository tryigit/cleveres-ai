# Co-Evolving Harnesses and Models: On-Policy Correction Helps Weaker Models Catch Up Where Imitation Fails

## TL;DR
Agent harnesses significantly impact task success, enabling smaller models to perform well. This paper investigates how to best combine harness evolution with lightweight fine-tuning for domain-specific tasks. The authors find that simply training a weaker model (like Qwen3-Coder or Gemma 4) on an expert model's successful trajectories under an evolved harness actually *backfires*, degrading performance. This happens because imitation disrupts model-harness fit: the weaker model learns the expert's planning style without the competence to execute it, breaking compatibility with the harness evolved for its native style. To solve this, the paper introduces an on-policy expert-correction pipeline (automated by a meta-level MLE agent) that isolates failing turns in the weaker model's rollout and asks the expert to rewrite only that turn, preserving the model's native planning style while capturing the benefits of harness evolution and model adaptation.

## Real-World Application & Who Should Care

### (Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
**Why you care:** If you are trying to squeeze maximum capability out of smaller, specialized models via automated scaffolding and fine-tuning, this paper identifies a pitfall in its evaluated setting: when weaker models imitate complete expert trajectories under the evolved harness on the reported enterprise tasks, behavioral cloning can degrade model-harness fit. In that setting, the evaluated on-policy correction pipeline performed better; the paper does not establish that this will hold for other models, harnesses, or tasks.

### (Money) THE COST & LATENCY OPTIMIZERS (API Developers):
**Why you care:** Combining harness evolution with targeted on-policy correction allows you to deploy much smaller, cheaper models on complex enterprise tasks that typically require expensive frontier models, significantly reducing inference costs without losing capability.

### (Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
This research is geared toward automated agent framework design and model fine-tuning pipelines rather than daily conversational prompting.

## References
* [Co-Evolving Harnesses and Models: On-Policy Correction Helps Weaker Models Catch Up Where Imitation Fails](https://arxiv.org/abs/2609.09134)

See also: [Rethinking the Evaluation of Harness Evolution for Agents](rethinking-harness-evolution.md)
See also: [Agent Lightning v1.0: Towards Harnessed Agentic RL](agent-lightning.md)
See also: [OpenForgeRL: Train Harness-native Agents in Any Environment](openforgerl.md)
