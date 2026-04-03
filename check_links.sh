#!/bin/bash
files="concepts/flow-matching.md concepts/deepseek-sparse-attention.md concepts/multi-token-prediction.md concepts/latent-moe.md models/nemotron-3-super.md models/nano-banana-2.md papers/schrodinger-bridges-generative-modeling.md concepts/streaming-llm.md models/gemini-3-1-pro.md models/claude-opus-4-6.md models/gpt-5-4-mini-and-nano.md models/hunter-alpha-mimo.md concepts/state-space-models.md models/mistral-small-4.md models/openmanus.md concepts/causal-vs-masked-language-models.md concepts/paged-attention.md concepts/grouped-query-attention.md concepts/rlhf.md models/grok-3.md README.md papers/areal.md papers/flash-attention-4.md concepts/group-relative-policy-optimization.md concepts/flash-attention.md models/deepseek-v3-2.md models/deepseek-v3.md concepts/continuous-batching.md news/dynatomics.md models/minimax-m2-7.md models/xiaomi-mimo-v2-pro.md models/zeroclaw.md models/gemma-3.md models/qwq-32b.md news/claude-code.md concepts/1-58-bit-llm.md news/qonqrete.md concepts/quantization.md models/voxtral-4b-tts.md models/granite-docling-258m.md papers/friends-and-grandmothers-in-silico.md"
for file in $files; do
  echo "Checking links in $file"
  # extract links that look like (relative/path.md)
  links=$(grep -Eo "\]\([^)]+\)" $file | grep -o "([^)]*)" | tr -d "()" | grep "\.md")
  dir=$(dirname $file)
  for link in $links; do
    # Resolve relative path
    target=$(realpath -m "$dir/$link")
    if [ ! -f "$target" ]; then
      echo "BROKEN LINK in $file: $link (resolved to $target)"
    fi
  done
done
echo "Done checking."
