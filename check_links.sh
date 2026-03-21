#!/bin/bash
files="models/gemini-3-1-pro.md models/claude-opus-4-6.md models/gpt-5-4-mini-and-nano.md models/hunter-alpha-mimo.md concepts/state-space-models.md models/mistral-small-4.md models/openmanus.md concepts/causal-vs-masked-language-models.md concepts/paged-attention.md concepts/grouped-query-attention.md concepts/rlhf.md models/grok-3.md README.md papers/areal.md papers/flash-attention-4.md concepts/group-relative-policy-optimization.md concepts/flash-attention.md models/deepseek-v3-2.md models/deepseek-v3.md"
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
