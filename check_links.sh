#!/bin/bash
files="README.md papers/areal.md papers/flash-attention-4.md concepts/group-relative-policy-optimization.md concepts/flash-attention.md"
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
