# The AI Scientist: Towards Fully Automated Open-Ended Scientific Discovery

- BibTeX key: `lu2024aiscientist`
- Local PDF: `resources/2408.06292.pdf`
- arXiv: <https://arxiv.org/abs/2408.06292>
- Authors: Chris Lu, Cong Lu, Robert Tjarko Lange, Jakob Foerster, Jeff Clune, David Ha (Sakana AI / UBC / Vector Institute / Canada CIFAR)
- Submitted: August 12, 2024; revised September 1, 2024

## Summary

First end-to-end framework for fully automated scientific discovery in ML. Given a research direction and a starting codebase, the system independently generates ideas, writes and executes code, visualizes results, produces a conference-style paper, and runs automated peer review — all without human intervention. Papers cost under $15 each. The automated reviewer achieves near-human performance on ICLR 2022 data.

---

## Three-Stage Pipeline

### Stage 1: Idea Generation

- LLM "brainstorms" a diverse set of novel research ideas from the provided template.
- Each idea is checked for novelty via the **Semantic Scholar API** (rejects ideas too similar to existing literature).
- Ideas are scored on **Interestingness**, **Feasibility**, and **Novelty** (each 1–10).
- Multiple rounds of chain-of-thought and self-reflection refine and diversify ideas.
- A running archive of already-generated ideas prevents re-proposal.
- Up to ~50 novel ideas are generated per template per run.

### Stage 2: Experimental Iteration

- Given an idea and a code template, the system produces an experiment execution plan.
- **Aider** (an LLM-based coding assistant backed by Claude/GPT-4o) implements plan-directed code-level changes to the template.
- Experiments execute automatically; results (numerical scores + plots) are fed back to Aider for re-planning.
- Up to **5 experiments** per idea; each failed experiment triggers a re-attempt.
- Aider generates a Python plotting script to visualize all results.

### Stage 3: Paper Write-Up

- Produces an ~11-page conference-style LaTeX manuscript.
- Written **section by section** — introduction, background, experimental setup, results, related work.
- Uses Semantic Scholar API to find relevant references for the Related Work section; citations are appended to the `.bib` file automatically.
- A **refinement pass** removes duplicated information and streamlines arguments.
- A **compilation step** feeds LaTeX errors back into Aider to fix them.
- Only real results from code/figures are used (no fabricated data by design — though hallucination of details still occurs).

---

## Automated Peer Review

- A GPT-4o-based reviewer agent generates structured reviews in NeurIPS review format.
- Uses **5 rounds of self-reflection**, **5 ensembled reviews**, and a **meta-aggregation** step.
- Evaluated against 500 ICLR 2022 papers: achieves **70% accuracy** (1-shot) on accept/reject decisions.
- Balanced accuracy: **65% vs. 66% for human reviewers** — near-human level.
- False Negative Rate (FNR) is higher than human (0.52 vs. 0.17) — the reviewer is more prone to rejecting good papers than accepting bad ones.
- Cost: **$0.25–$0.50 per review**.
- Claude Sonnet 3.5 and GPT-4o-mini are also viable but require score calibration (Sonnet 3.5 shows persistent over-optimism bias).
- Llama-3.1 405B could not reliably follow the review output template.

---

## Experimental Setup & Results

Tested across **3 ML research templates** × **4 LLMs** (Claude Sonnet 3.5, GPT-4o, DeepSeek Coder, Llama-3.1 405B):

| Template | Best LLM | Mean Score | Max Score | Total Cost |
|---|---|---|---|---|
| 2D Diffusion Modeling | Sonnet 3.5 | 3.82 | 6.0 | ~$250 |
| NanoGPT Language Modeling | Sonnet 3.5 | 4.05 | 5.0 | ~$250 |
| Grokking Analysis | Sonnet 3.5 | 3.44 | 5.0 | ~$250 |

- ~50 ideas generated per LLM per template; 15–49 novel ideas pass the novelty check.
- Claude Sonnet 3.5 consistently produces the highest-quality papers across all domains.
- GPT-4o is second; DeepSeek Coder (~$10 total) is cheapest and competitive.
- Llama-3.1 405B performs worst overall (mean ~2.0–2.3).
- NeurIPS acceptance threshold is roughly score ≥ 6 ("Weak Accept").

### Notable Generated Papers (Diffusion template, Sonnet 3.5)

- **DualScale Diffusion** — splits denoiser into global and local branches with learnable timestep-conditioned weighting. Novel visualization of weight evolution.
- **Multi-scale Grid Noise Adaptation** — dynamically scales diffusion noise using two spatial grids (5×5 coarse, 20×20 fine).
- **GAN-Enhanced Diffusion** — adds a discriminator to guide generation, improving sample diversity.
- **DualDiff** — dual-expert mixture-of-experts approach with explicit diversity loss.

### Notable Generated Papers (NanoGPT template, Sonnet 3.5)

- **StyleFusion** — per-token style adapter modulates Transformer state at each layer.
- **Adaptive Learning Rates via Q-Learning** — uses RL to dynamically adjust learning rate mid-training.

### Notable Generated Papers (Grokking template)

- **Unlocking Grokking: Weight Initialization Strategies** — Xavier and Orthogonal inits consistently cause faster grokking.
- **Grokking Accelerated: Layer-wise Learning Rates** — higher LR for higher layers speeds grokking.

---

## Strengths of the Generated Papers

- **Precise mathematical descriptions** — algorithmic changes described with proper notation.
- **Comprehensive experiment write-ups** — hyperparameters, baselines, datasets all listed; numerical results matched to 3 decimal places.
- **Empirically good results** — sample quality visibly improved vs. baseline in many cases.
- **Novel visualizations** — generated plotting code often goes beyond the template baseline.
- **Coherent future work sections** — identifies plausible next steps.

---

## Failure Modes & Pathologies

These are documented directly in the paper (Section 5 case study + Section 8):

- **Idea duplication** — very similar ideas generated across different runs or iterations.
- **Implementation errors** — e.g., the upscaling layer in the dual-scale case only preserved the first two dimensions, effectively nullifying the local branch's purpose.
- **Hallucinated experimental details** — claimed V100 GPUs were used; H100s were actually used. PyTorch version guessed without checking.
- **Positive spin on negative results** — e.g., reports "3.3% improvement (from 0.090 to 0.093)" on Moons dataset as a positive finding; KL divergence *increased*.
- **Experimental log artifacts** — refers to runs as "Run 2" in the paper (a logging artifact, not a scientific label).
- **Intermediate results in papers** — presents every experiment run, which is unusual for conference submissions.
- **Minimal reference lists** — related work sections typically contain only ~9 citations, often missing important comparisons.
- **Failed LaTeX references** — occasionally fails to correctly reference figures in the manuscript.
- **Language modeling "cheating"** — a few ideas achieve improved perplexity by leaking future token information (hard for the system to detect).
- **Hallucinated entire results** (rare but observed in early prompt versions).
- **Challenging ideas exceed implementation capability** — the system generates ideas that are too complex for it to implement correctly.

---

## Overall Quality Assessment

> "We judge the performance of The AI Scientist to be about the level of an early-stage ML researcher who can competently execute an idea but may not have the full background knowledge to fully interpret the reasons behind an algorithm's success."

- A human supervisor seeing these results would likely redirect the project (e.g., investigate MoE for diffusion), whereas the AI Scientist cannot do this autonomously in its current form.
- The automated reviewer partially catches the shortcomings but requires domain expertise to catch subtle issues (e.g., the upscaling dimension bug).

---

## Limitations (Section 8)

- **No vision capabilities** — cannot view generated figures; relies solely on text descriptions of plots. Future work: multimodal models.
- **Automated reviewer trained on ICLR 2022 data** — LLMs may have memorized some reviews from initial segments, inflating reviewer accuracy estimates.
- **Limited experiments per idea** — due to compute constraints; more experiments would increase paper quality.
- **No adversarial code checker** — a separate agent to verify correctness of implementations would catch more bugs.
- **Page layout issues** — tables sometimes exceed page width; overall formatting is suboptimal vs. human-polished submissions.
- **No internet access for experiments** — cannot download higher-dimensional datasets dynamically.
- **Ethical considerations** — potential for misuse (flooding venues with AI submissions), plagiarism detection challenges, and broader impacts on scientific labor discussed extensively.

---

## Useful Framing for the Deck

- **"What Is Autoresearch?" section** — the canonical existence proof. The Figure 1 pipeline diagram (Idea Generation → Experiment Iteration → Paper Write-Up) is the clearest single visual for what autoresearch means end-to-end.
- **"Tools and Techniques" section** — Aider as coding assistant, Semantic Scholar API for novelty checking and references, automated peer review as quality gate.
- **"Examples" section** — the DualScale Diffusion case study (Section 5) is a concrete, readable walk-through: idea JSON, code diff, paper excerpt, review JSON.
- **"Limitations and Risks" section** — the failure modes list is directly slide-ready. The GPU hallucination and positive-spin examples are memorable, concrete illustrations. The ethical considerations section is comprehensive.
- **Cost angle** — "$15 per paper" is a striking talking point for opening slides.
- **Quality framing** — "early-stage ML researcher" is a useful anchor for calibrating audience expectations.
