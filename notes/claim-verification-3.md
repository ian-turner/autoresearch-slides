# Claim Verification Audit — Session 3

**Date:** 2026-04-10

**Scope:** Full fresh pass through all slides. Verified against primary PDFs now available locally for all sources, including Coscientist and Virtual Lab (newly available since Session 1).

**PDF coverage:**
- `resources/2408.06292.pdf` — AI Scientist v1 (`lu2024aiscientist`)
- `resources/2504.08066.pdf` — AI Scientist v2 (`yamada2025aiscientistv2`)
- `resources/2604.00945.pdf` — Vibe Researching (`feng2026visionary`)
- `resources/2503.08979.pdf` — Agentic AI Survey (`schmidgall2025agenticscience`)
- `resources/2304.05332.pdf` — Coscientist (`boiko2023coscientist`) — **newly verified**
- `resources/virtual-lab.pdf` — Virtual Lab (`swanson2024virtuallab`) — **newly verified**

Status markers: ✅ Verified | ⚠️ Caveat/unverified detail | ❌ Inaccurate

---

## Stage 1: Idea Generation

| Claim | Status | Source |
|---|---|---|
| Semantic Scholar API filters out ideas too similar to existing work | ✅ | v1 p.4: "discard any idea that is too similar to existing literature" |
| Scored 1–10 on Interestingness, Feasibility, Novelty | ✅ | v1 p.7: example JSON with those three fields |
| Multiple rounds of chain-of-thought + self-reflection | ✅ | v1 p.4: "We use multiple rounds of chain-of-thought and self-reflection" |
| Running archive prevents re-proposing explored ideas | ✅ | v1 p.4: "a running archive of already-generated ideas" |

---

## Stage 2: Experimentation

| Claim | Status | Source |
|---|---|---|
| Aider implements plan-directed code changes; runs experiments automatically | ✅ | v1 p.4 |
| v1: linear loop, up to 5 iterations | ✅ | v1 p.4: "This process is repeated up to five times" |
| v2: tree search, parallel branches, best-first via LLM evaluator | ✅ | v2 pp.5–6 |
| v2: VLM checks generated figures | ✅ | v2 p.7: VLM feedback during experimentation and manuscript writing |
| Model ranking best→worst: Claude Sonnet 3.5, GPT-4o, DeepSeek Coder, Llama-3.1 405B | ✅ | v1 p.7 and Table 3 |
| **"full run costs ~$10"** | ⚠️ **MISLEADING** | See detail below |

### ⚠️ "Full run costs ~$10" — misleading placement

The slide places this cost figure directly after listing all four models. But per Table 3, costs vary drastically by model: Claude Sonnet 3.5 ≈ $250/run, GPT-4o ≈ $300/run, DeepSeek Coder ≈ $10/run, Llama-3.1 405B ≈ $120/run. The "$10" figure is **DeepSeek Coder only** — the cheapest model which also produces the lowest-quality papers. As written, the bullet implies the whole system costs ~$10 regardless of model.

**Fix options:** (a) Remove the cost note from this slide (costs are already covered on the Paper Writing & Review slide); (b) tie it to DeepSeek specifically: "…; DeepSeek Coder run costs ~$10."

---

## Stage 3: Paper Writing & Review

| Claim | Status | Source |
|---|---|---|
| Paper written section-by-section | ✅ | v1 p.5: "(a) Per-Section Text Generation" |
| LaTeX errors fed back for automated fixing | ✅ | v1 p.5: "(d) Compilation: LaTeX compilation errors back into Aider" |
| Semantic Scholar API retrieves references for related work | ✅ | v1 p.5: "allowed 20 rounds to search via Semantic Scholar API" |
| GPT-4o reviewer with 5-round self-reflection and 5 ensembled reviews | ✅ | v1 p.6 |
| Reviewer accuracy: 65% balanced accuracy vs. 66% for human reviewers | ✅ | v1 Table 1, p.6–7: apples-to-apples balanced accuracy comparison |
| $0.25–$0.50 per review | ✅ | v1 p.7: "Each review is generated for $0.25 to $0.50 in API costs" |
| **"under $15 per full paper"** | ✅ | v1 p.1/abstract: "~$15/paper" |

---

## Case Study 1: The AI Scientist

| Claim | Status | Source |
|---|---|---|
| End-to-end: idea generation → experiments → paper | ✅ | v1 Fig. 1 |
| First AI-generated paper accepted at peer review (ICLR 2025 ICBINB workshop) | ✅ | v2 p.8–9 |
| 1 of 3 submissions accepted | ✅ | v2 p.9: "one manuscript achieved a sufficiently high average reviewer score (6.33 out of 10)… The remaining two submissions received lower scores and were not accepted." |
| Workshop acceptance rate 60–80% | ✅ | v2 p.9: "(60–80% acceptance) not a top-tier venue (20–30% acceptance)" |
| **"Cost: $15 per paper end-to-end"** | ⚠️ **INCONSISTENT** | See detail below |
| Human role: configure the system once, then step away | ✅ | v1: fully automated after template setup |

### ⚠️ Cost wording inconsistency

The Stage 3 slide says "under $15 per full paper." This slide says "$15 per paper" (drops "under"). Both cite the same source. The v1 abstract says "~$15/paper." The two slides should use the same wording; the "under" version is more faithful to the source.

**Fix:** Change to "Cost: \textbf{under \$15} per paper end-to-end" to match Stage 3 and the source.

---

## Case Study 2: Coscientist

| Claim | Status | Source |
|---|---|---|
| **"GPT-4 agent"** | ❌ **INACCURATE** | See detail below |
| Four components: web searcher, docs searcher, code executor, automation (robotic lab) | ✅ | Boiko p.2–3, Figure 1: "four components… Web searcher, Docs searcher, Code execution, Automation" |
| Task: palladium-catalyzed cross-coupling reaction | ✅ | Schmidgall survey confirms; Suzuki reactions in the paper are Pd-catalyzed; paper abstract says "catalyzed cross-coupling reactions" |
| Crossed the digital–physical boundary | ✅ | Boiko p.2: "Automation… executes the generated code on corresponding hardware" |
| Human role: define the research goal, then step away | ✅ | Boiko p.2: Planner receives initial prompt and proceeds autonomously |

### ❌ "GPT-4 agent" — inaccurate model attribution

The Coscientist glossary (p.1) explicitly states: "In this paper, we use OpenAI's **GPT-3.5 and GPT-4**." The paper uses GPT-3.5 for the Web Searcher module ("For this task we can employ GPT-3.5, as it performs significantly faster than GPT-4 with no appreciable loss of quality") and GPT-4 for the Planner and other modules. This is a multi-model system, not a single "GPT-4 agent."

**Fix:** Change "GPT-4 agent" to "GPT-4 (and GPT-3.5) agent" or simply "LLM agent (GPT-4 / GPT-3.5)."

---

## Case Study 3: The Virtual Lab

| Claim | Status | Source |
|---|---|---|
| Goal: design SARS-CoV-2 nanobodies targeting JN.1/KP.3 variants | ✅ | Abstract: "nanobodies that can bind to the spike protein of the KP.3 variant of SARS-CoV-2" |
| Structure: human PI writes agendas; LLM PI leads specialist agents | ✅ | Fig. 1 and caption: "human researcher writes an agenda… PI agent begins the meeting" |
| Specialist agents: immunologist, ML specialist, computational biologist, critic | ✅ | Fig. 6a: Immunologist, Machine Learning Specialist, Computational Biologist, Scientific Critic |
| **"~1% of interactions"** | ⚠️ **SOURCING WEAK** | See detail below |
| 92 nanobodies designed | ✅ | p.14: "Applying this workflow to each of the four starting nanobodies resulted in 92 final selected sequences (23 per starting nanobody)" |
| 2 showed improved binding and maintained ancestral-spike binding | ✅ | Abstract: "two new nanobodies exhibit improved binding to the recent JN.1 or KP.3 variants of SARS-CoV-2 while maintaining strong binding to the ancestral viral spike protein" |
| **"published in Nature 2025"** | ⚠️ **UNVERIFIED FROM PDF** | See detail below |

### ⚠️ "~1% of interactions" — specific figure not found in text

The paper describes "relatively minimal input from the human researcher" and Figure 6b (pie chart) shows word-count proportions for each participant. The ~1% figure is cited in the project notes and is consistent with the paper's framing, but the specific percentage does not appear as explicit text in the pages reviewed — it would need to be read from the Fig. 6b pie chart data or found elsewhere in the paper. Low risk of being wrong given the paper's framing, but the sourcing is by inference from a figure rather than a direct quotation.

### ⚠️ "published in Nature 2025" — PDF on hand is the preprint

The PDF is the bioRxiv preprint posted November 12, 2024, which states "not certified by peer review." The project notes record a Nature URL (`nature.com/articles/s41586-025-09442-9`), which strongly suggests it was published, but the copy in `resources/` cannot confirm this. This is a low-risk claim but should be noted.

---

## Technical Failures

| Claim | Status | Source |
|---|---|---|
| Literature review is the most consistently failing stage | ✅ | Schmidgall §8 p.9: "the literature review phase exhibited the highest failure rate" |
| Hallucinated citations: AI Scientist-v2 introduced citation inaccuracies in its accepted paper | ✅ | v2 p.9: "THE AI SCIENTIST-v2 occasionally introduced inaccuracies in citations" |
| Positive-spin bias: tendency to emphasize positive results | ✅ | v2 p.10: "THE AI SCIENTIST paper tends to take a positive spin on its negative results" |
| Brittleness on novel tasks: struggle with genuinely new hypotheses | ✅ | feng §5.6 p.15 |
| Workshop-level, not conference-level; 60–80% acceptance rate | ✅ | v2 p.9 |

---

## Systemic Risks

| Claim | Status | Source |
|---|---|---|
| Verification asymmetry: requires more focused effort than producing it | ✅ | feng §5.5 p.14 |
| Literature flooding: polished mediocrity saturates venues | ✅ | feng §6.2.3–6.2.4 pp.18–19 |
| Physical safety: blast-radius constraints; misinterpreting physical context | ✅ | Schmidgall §7.3 p.9 |
| Weak disclosure norms: could inflate CVs or obscure AI authorship | ✅ | feng §6.2.2 p.18 |
| AI Scientist-v2 authors withdrew accepted papers to avoid setting a precedent | ✅ | v2 p.9: "we arranged with the workshop organizers to withdraw all three manuscripts… to avoid prematurely setting a precedent for purely AI-generated research entering the official scientific record" |

---

## Conclusions (synthesis — no direct citations)

| Claim | Grounded in | Status |
|---|---|---|
| Existence-proof threshold crossed: peer review passed + wet-lab execution | v2 p.8–9 (workshop), Boiko (wet-lab) | ✅ |
| $15/paper end-to-end; limits are quality, novelty, trust | v1 abstract | ✅ |
| Hybrid model (Virtual Lab) → 2 Nature nanobodies; full autonomy → workshop papers authors withdrew | Virtual Lab, v2 p.9 | ✅ |
| Systemic risks underspecified | feng, schmidgall | ✅ |
| Lifecycle is a pipeline; failures cluster at literature review and novel hypotheses | schmidgall p.9, feng §5.6 | ✅ |

---

## Summary of Issues

### ❌ One inaccuracy requiring a fix

**Slide:** "GPT-4 agent" (Case Study 2 — Coscientist)

The paper uses both GPT-3.5 and GPT-4. GPT-3.5 handles web search; GPT-4 handles planning. Calling it a "GPT-4 agent" misattributes the model and overstates GPT-4 coverage. 

**Fix:** "LLM agent (GPT-4 / GPT-3.5)" or "multi-model agent (GPT-4 for planning, GPT-3.5 for search)"

### ⚠️ Two wording/consistency issues

1. **"full run costs ~$10"** (Stage 2): The $10 figure is DeepSeek Coder only. Better models cost $250–$300/run. Remove the cost parenthetical from Stage 2, or tie it explicitly to DeepSeek.

2. **"$15 per paper end-to-end"** (Case Study 1): Should be "under $15" to match the Stage 3 slide and the source ("~$15/paper").

### ⚠️ Two claims with weak primary sourcing

1. **"~1% of interactions"** (Virtual Lab): Consistent with paper framing ("relatively minimal input") and probably readable from Fig. 6b, but not found as explicit text. Acceptable for a talk; just note the source is a figure, not quoted text.

2. **"published in Nature 2025"** (Virtual Lab): The PDF in `resources/` is the preprint. Notes record a Nature URL confirming publication. Low risk.
