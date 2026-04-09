# The AI Scientist-v2: Workshop-Level Automated Scientific Discovery via Agentic Tree Search

- BibTeX key: `yamada2025aiscientistv2`
- Local PDF: `resources/2504.08066.pdf`
- arXiv: https://arxiv.org/abs/2504.08066
- Authors: Yutaro Yamada, Robert Tjarko Lange, Cong Lu, Shengran Hu, Chris Lu, Jakob Foerster, Jeff Clune, David Ha (Sakana AI / UBC / Vector Institute / Oxford)
- Submitted: April 10, 2025

## Summary

Substantially improved successor to AI Scientist v1 with two major architectural changes: (1) eliminates reliance on human-authored code templates — idea generation now begins from open-ended prompts at a higher level of abstraction; (2) replaces v1's linear experiment loop with a parallelized **agentic tree search** managed by an Experiment Progress Manager. Also adds Vision-Language Model (VLM) feedback throughout experimentation and manuscript writing. Evaluated by submitting three fully autonomous manuscripts to blind peer review at an ICLR 2025 workshop — one was accepted, marking the first instance of a fully AI-generated paper successfully passing peer review.

---

## Key Improvements over v1 (Table 1)

| Feature | AI Scientist-v1 | AI Scientist-v2 |
|---|---|---|
| Codebase | Topic-specific templates | Domain-general (no templates) |
| Execution Planning | Linear | Tree-based |
| Parallel Experiments | No | Yes |
| VLM Reviewer | No | Yes |
| Human Result Evaluation | No | Workshop-accepted |

---

## Architecture

### Idea Generation

- System starts from broad topic prompts, not pre-coded experiment templates.
- Engages in open-ended thinking about research directions before committing to specific implementations.
- Literature review tools (Semantic Scholar) integrated into the idea generation loop — novelty grounding happens before implementation begins, not after.
- Ideas assessed on novelty and feasibility before proceeding to experimentation.

### Tree-Based Experimentation (4 Stages)

An **Experiment Progress Manager** coordinates four clearly defined stages. The best-performing node at the end of each stage seeds the next stage.

- **Stage 1: Preliminary Investigation** — Establish feasibility with a minimal working prototype. Ends when a basic working prototype executes successfully.
- **Stage 2: Hyperparameter Tuning** — Optimize critical hyperparameters (learning rate, epochs) on two datasets. Ends when experiments stabilize across datasets.
- **Stage 3: Research Agenda Execution** — Systematically implement the core research agenda on the tuned baseline.
- **Stage 4: Ablation Studies** — Assess importance of individual research components. Tracks previously tested ablations to avoid repetition.

**Node types within the tree:**
- **Non-buggy nodes** → refinement (child nodes improve the parent)
- **Buggy nodes** → debugging (child nodes fix errors using stored error information)
- **Hyperparameter nodes** — explore alternative hyperparameter configs (Stage 2)
- **Ablation nodes** — evaluate component importance (Stage 4)
- **Replication nodes** — repeat experiments with different random seeds (statistical robustness)
- **Aggregation nodes** — collect replication results, compute mean/std, generate combined visualizations

At each iteration, the system selects several nodes from the existing tree to expand in parallel. A best-first strategy is guided by an LLM evaluator considering performance metrics, training dynamics, and quality of generated visualizations.

### VLM Feedback Loop

Unlike v1 (which was blind to its own figures), v2 integrates Vision-Language Models at two points:
1. **During experimentation** — VLM reviews generated figures immediately, marking nodes as "buggy" if figures are unclear, have missing legends, or are misleading. This feedback is recorded for future debugging.
2. **During manuscript writing** — VLM checks figure-caption alignment, visual clarity, duplication across main text and appendix. Iterative refinement improves manuscript quality before submission.

### Paper Write-Up

Switches from v1's Aider-based iterative approach to a simpler single-pass generation using Gauthier (2024)'s Aider framework. VLM feedback compensates for reduced iterative refinement by catching visual issues the LLM cannot see in text.

---

## Peer Review Evaluation

Three manuscripts submitted to the ICLR 2025 "I Can't Believe It's Not Better" (ICBINB) workshop under blind peer review. Workshop organizers were informed in advance; reviewers were not told which submissions might be AI-generated.

**Outcomes:**
- 1 of 3 accepted (scores: 6, 7, 6 from three reviewers — Reviewer #1: "Good paper, accept"; Reviewer #2: "Marginally above acceptance threshold")
- Accepted paper ranked in top 45% of submitted workshop papers
- Remaining 2 papers received lower scores and were not accepted

**The accepted paper:** "Enhancing Compositional Generalization in Neural Networks via Compositional Regularization"
- Investigates whether a compositional regularization term incorporated during training improves generalizability in neural networks
- Evaluated on synthetic arithmetic expression datasets and SCAN, COGS datasets
- Somewhat negative/mixed result: compositional regularization does not always improve performance

**Post-review withdrawal:** Prior to publication, all three manuscripts were withdrawn from the official workshop record to avoid prematurely setting a precedent for AI-generated research entering the official scientific record. Reviewers were informed after peer review.

---

## Internal Review Observations

Internal analysis of all three papers revealed:
- **Hallucinated citations** — AI Scientist-v2 occasionally introduced inaccuracies in citations
- **Insufficient methodological depth** — lacks the detailed in-depth analysis typical of main conference papers
- **Overly optimistic framing** (inherited from v1) — tendency to emphasize positive results

---

## Limitations & Ethical Considerations

- **Workshop level, not main conference** — accepted at a workshop (60-80% acceptance) not a top-tier venue (20-30% acceptance). Does not yet meet the rigorous standard for ICLR/NeurIPS main track.
- **Only 1 of 3 accepted** — not yet consistently producing workshop-quality work.
- **Genuinely novel high-impact hypotheses** — formulating truly novel hypotheses and rigorously justifying experimental design with deep domain expertise remains out of reach.
- **Incremental results** — current output tends toward preliminary or incremental findings rather than foundational contributions.
- **Full transparency required** — the paper strongly advocates that AI-generated content must be disclosed and subjected to the same peer review as human work. Unscrupulous actors could use this to flood venues or inflate CVs.

---

## Useful Framing for the Deck

- **"What Is Autoresearch?" section** — The v1→v2 arc is *the* narrative: templates → template-free; linear → tree search; blind to figures → VLM feedback; no peer review → first peer-reviewed AI paper. Table 1 is slide-ready as a before/after comparison.
- **Figure 1** (workflow diagram) and **Figure 2** (four-stage tree) are the key visuals for explaining the system. Figure 2 in particular makes the non-linear exploration intuitive.
- **"Examples" section** — The ICBINB submission is the most concrete, publicly documented example of an AI-generated paper under real peer review. The accepted paper's idea JSON (Appendix C.1) is readable.
- **"Limitations and Risks" section** — The self-aware limitations section (§5) is carefully worded and worth quoting directly. The post-review withdrawal decision is an important ethical case study.
- **Calibration framing** — "Workshop-level, not conference-level" is an important honest anchor for audience expectations. The 1-of-3 acceptance rate is more sobering than the headline "first AI paper to pass peer review."
