# From Inaudible Inputs to Model Failures: Low-Frequency Safety Risks in LALMs

## TL;DR
Large audio-language models (LALMs) process diverse acoustic inputs, including low-frequency signals that are completely inaudible to humans. This creates a critical safety vulnerability where malicious actors can manipulate models without detection. This research introduces **Intermittent Low-Frequency Lockout (ILL)**, an inaudible red teaming method that uses continuous-phase, low-frequency waveforms to attack LALMs in a black-box setting, reducing task accuracy by up to 67 percentage points. To counter this, the authors propose **Distributional Requery Guard (DRG)**, a defense mechanism that detects low-frequency distribution shifts and mitigates attacks by conditionally requesting a second, clean recording for semantic recovery.

## Real-World Application & Who Should Care

(Rocket) THE PERFORMANCE MONSTERS (SOTA Seekers):
If you are developing multi-modal systems like advanced audio agents, robust audio understanding is paramount. Recognizing the impact of out-of-band signals on internal attention mechanisms is essential for pre-training robust audio encoders that resist imperceptible adversarial perturbations.

(Money) THE COST & LATENCY OPTIMIZERS (API Developers):
Deploying LALMs for voice assistants or transcription pipelines exposes your system to stealthy manipulation. Implementing detection mechanisms like DRG adds a necessary layer of security to prevent adversarial hijacking without introducing major latency for typical clean audio queries.

(Person at Computer) THE EVERYDAY PROMPT ENGINEERS:
If you are passing audio into consumer models (like Advanced Voice Mode), be aware that hidden frequencies can alter the model's behavior or cause it to fail silently. While you cannot hear these attacks, understanding that the model's audio perception extends beyond human hearing helps diagnose strange transcription or reasoning errors.

See also: [Transformer Architecture: The Engine of Modern AI](../concepts/transformer-architecture.md)

## References
* [From Inaudible Inputs to Model Failures: Low-Frequency Safety Risks in LALMs](https://arxiv.org/abs/2608.09158)
