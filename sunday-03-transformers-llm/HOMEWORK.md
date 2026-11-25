<img src="../assets/logo_transparent.png" width="140" align="right" alt="Algo Professor"/>

# Week 3 homework — Domain Instruction-Tuned LLM

**After Sunday 3, Monday to Saturday · about 2–3 hours a day**

> Organisations want small, private models that follow their instructions well. You will adapt a real open model with LoRA, evaluate it rigorously and serve it.

**Data:** databricks-dolly-15k (instructions) + a small domain corpus you choose (e.g. your university handbook)  
**Submit:** commit every day; tag `week-3` and create a GitHub Release by **Saturday 23:59 local time**. Mentors review it before the next Sunday.

| Day | Assignment | Time |
|---|---|---|
| Monday | Tokenisers in practice | 2 h |
| Tuesday | Scale up MiniGPT | 3 h |
| Wednesday | LoRA / QLoRA on a real open model | 3 h |
| Thursday | A rigorous evaluation harness | 3 h |
| Friday | Serving, structured output and throughput | 2–3 h |
| Saturday | Chat UI, report and model card | 3 h |

## Monday — Tokenisers in practice
*2 h* · **Goal:** See how tokenisation shapes cost and quality.

1. Train a BPE tokenizer (Hugging Face `tokenizers`, 8k vocabulary) on your domain corpus.
2. Compare tokens per sentence against the GPT-2 and Qwen2.5 tokenizers on 200 sentences, including Indian-language text.
3. Explain why token counts matter for cost and context length.

- **Deliverable:** `notebooks/01_tokenizers.ipynb`, comparison table
- **Done when:** Tokenizer trained and saved; counts reported for all three tokenizers with examples of splits.
- **Stretch:** Measure how many tokens a Hindi or Telugu sentence needs compared with its English translation.

## Tuesday — Scale up MiniGPT
*3 h* · **Goal:** Turn the Sunday model into a stronger small LM.

1. Switch MiniGPT from characters to your BPE tokens; raise context to 256.
2. Add learning-rate warm-up, cosine decay and gradient clipping; train on a GPU.
3. Compare validation perplexity of character-level and BPE models fairly (convert to bits per character).

- **Deliverable:** Training script, loss curves, comparison table
- **Done when:** Bits-per-character used for a fair comparison; samples shown at two temperatures.
- **Stretch:** Add rotary position embeddings and measure the effect.

## Wednesday — LoRA / QLoRA on a real open model
*3 h* · **Goal:** Adapt a 0.5B-parameter model on one GPU.

1. Load `Qwen2.5-0.5B-Instruct` (or `SmolLM2-360M-Instruct`) with `transformers`.
2. Fine-tune with `peft` LoRA (r = 8 and r = 32) on a 2,000-example Dolly subset, masking the prompt tokens.
3. Track loss, GPU memory and time; save the adapters.

- **Deliverable:** Adapters on the Hugging Face Hub (private is fine) and `reports/finetune.md`
- **Done when:** Prompt masking verified; both ranks compared on validation loss and memory.
- **Stretch:** Run QLoRA (4-bit) and compare memory and quality.

## Thursday — A rigorous evaluation harness
*3 h* · **Goal:** Know whether the fine-tune actually helped.

1. Hold out 200 Dolly items; compare base vs LoRA with an LLM-as-judge, swapping answer order to remove position bias.
2. Run `lm-evaluation-harness` on two tasks before and after fine-tuning to check for forgetting.
3. Check n-gram overlap between your training and test items (contamination).

- **Deliverable:** `reports/evaluation.md` with win-rate, benchmark and overlap tables
- **Done when:** Order-swapped judging reported; forgetting measured; contamination check documented.
- **Stretch:** Have two humans rate 30 answers and compare with the judge.

## Friday — Serving, structured output and throughput
*2–3 h* · **Goal:** Run the model like a product.

1. Serve the merged model with vLLM or Ollama behind an OpenAI-compatible API.
2. Force JSON output with a schema for one task (e.g. extracting fields from a notice).
3. Benchmark latency and tokens/second at batch sizes 1, 4, 16 and 32.

- **Deliverable:** Serving config, JSON-schema demo, benchmark table
- **Done when:** Invalid JSON rate measured; throughput curve plotted; hardware stated.
- **Stretch:** Compare 4-bit and 16-bit serving speed and quality.

## Saturday — Chat UI, report and model card
*3 h* · **Goal:** Package and present.

1. Build a small chat UI (Gradio) that calls your served model.
2. Write `MODEL_CARD.md` including evaluation, known failure cases and safety notes.
3. Record a 5-minute demo; push, tag `week-3`, create a Release.

- **Deliverable:** UI, model card, demo link, Release `week-3`
- **Done when:** Model card lists at least 5 tested failure cases with examples.
- **Stretch:** Add a refusal policy for out-of-domain questions and test it.
