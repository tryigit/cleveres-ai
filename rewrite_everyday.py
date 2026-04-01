import sys

def rewrite(file_path, old_text, new_text):
    with open(file_path, 'r') as f:
        content = f.read()

    if old_text in content:
        content = content.replace(old_text, new_text)
        with open(file_path, 'w') as f:
            f.write(content)
        print(f"Successfully updated {file_path}")
    else:
        print(f"Old text not found in {file_path}")

# concepts/1-58-bit-llm.md
llm_old = """### 💻 For The Everyday Prompt Engineers
**Why you care:** This technology means that powerful, frontier-level AI models will soon run flawlessly and privately on your standard laptop CPU or smartphone without draining the battery in 10 minutes.
**Action:** When searching for local models to run via tools like Ollama or LM Studio, look out for "1.58-bit" or "BitNet" architectures for the fastest possible local inference on consumer hardware."""

llm_new = """### 💻 For The Everyday Prompt Engineers
This topic does not apply to you. 1.58-bit and BitNet architectures are foundational training and inference optimizations. They do not change how you write prompts or interact with web interfaces like ChatGPT or Claude."""

rewrite("concepts/1-58-bit-llm.md", llm_old, llm_new)

# news/qonqrete.md
qonqrete_old = """### 💻 For The Everyday Prompt Engineers
**Why you care:** Copy-pasting code back and forth from a web browser into your IDE, while worrying if the AI just hallucinates a destructive bash command, is stressful. QonQrete runs right inside your IDE (VS Code or IntelliJ) and automatically tests the code it writes in a safe, isolated container before you ever commit it to your main branch.
**Action:** Install the QonQrete plugin for your preferred IDE, drop a high-level objective into `tasq.md`, and let the local agents write and test the boilerplate code while you focus on the high-level architecture."""

qonqrete_new = """### 💻 For The Everyday Prompt Engineers
This topic does not apply to you. QonQrete is a local IDE-integrated multi-agent developer framework and does not affect everyday prompting strategies in conversational web interfaces like ChatGPT or Claude."""

rewrite("news/qonqrete.md", qonqrete_old, qonqrete_new)
