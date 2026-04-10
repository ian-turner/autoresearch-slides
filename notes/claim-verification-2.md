# Claim Verification Audit — Session 2

**Date:** 2026-04-09

**Scope:** Claims sourced from Coscientist (`boiko2023coscientist`) and Virtual Lab (`swanson2024virtuallab`), which were unverified in Session 1 due to missing local PDFs. Both PDFs downloaded and verified against primary source this session.

**Previous audit:** [Session 1 — 2026-04-08](claim-verification.md)

New PDFs added to `resources/`:
- `resources/2304.05332.pdf` — Coscientist (`boiko2023coscientist`)
- `resources/virtual-lab.pdf` — Virtual Lab (`swanson2024virtuallab`)

Status markers: ✅ Verified | ⚠️ Issue or caveat | ❌ Inaccurate

---

## Case Study 2: Coscientist

| Claim | Status | Source |
|---|---|---|
| GPT-4 agent | ⚠️ Oversimplified | See detail below |
| Four tools: web search, documentation reader, code executor, robotic lab controller | ✅ | Fig. 1 p.3: Web searcher (Google Search API), Docs searcher, Code execution (Docker), Automation (physical hardware) |
| Task: autonomously design and physically execute a palladium-catalyzed cross-coupling reaction | ⚠️ Simplified | See detail below |
| Crossed the digital–physical boundary — autonomous wet-lab experiment execution | ✅ | Fig. 4–5, pp.7–9: Agent controls liquid handler, heater-shaker module, UV-Vis spectrophotometer autonomously |

### ⚠️ "GPT-4 agent" — multi-LLM system, not GPT-4 only

**Slide says:** "GPT-4 agent equipped with four tools"

**What the paper reports (Glossary p.1):** "In this paper, we use OpenAI's GPT-3.5 and GPT-4."

- The **Planner** (the core reasoning component) uses GPT-4.
- The **Web searcher** uses GPT-3.5: p.3, "For this task we can employ GPT-3.5, as it performs significantly faster than GPT-4 with no appreciable loss of quality."
- The system is a multi-LLM pipeline, not a single GPT-4 agent.

**Severity:** Low. The Planner (the intelligent core) is GPT-4, so calling it a "GPT-4 agent" is a common shorthand but technically incorrect. The slide could say "GPT-4–based agent" or "multi-LLM agent (GPT-3.5/GPT-4)."

### ⚠️ "palladium-catalyzed cross-coupling reaction" — two reaction types, not one

**Slide says:** "design and physically execute a palladium-catalyzed cross-coupling reaction"

**What the paper reports (Fig. 5, pp.8–9):** The key demonstration performs **both Suzuki and Sonogashira reactions** simultaneously on a liquid handler (Fig. 5A–E). The source plate contains reagents for both.

- Suzuki reactions are palladium-catalyzed cross-coupling reactions ✅ — the slide's description fits.
- Sonogashira reactions are also cross-coupling reactions but use both Pd and Cu as co-catalysts.
- The slide simplifies to a single reaction type; the actual experiment is more complex (two concurrent cross-coupling reactions).

**Severity:** Low. The characterization is accurate for the Suzuki component and is consistent with how the schmidgall survey describes it. Worth a footnote if the deck is presented to a chemistry-specialist audience.

---

### Supplementary: BibTeX author list error

The `boiko2023coscientist` entry in `references.bib` lists four authors:
`Boiko, Daniil A. and MacKnight, Robert and Kline, Ben and Gomes, Gabe`

The paper title page lists **three** authors: Daniil A. Boiko, Robert MacKnight, and Gabe Gomes. "Kline, Ben" does not appear on the title page of arXiv version 2304.05332.

**Fix:** Remove `Kline, Ben` from the author list in `references.bib`.

---

## Case Study 3: Virtual Lab

| Claim | Status | Source |
|---|---|---|
| Goal: design SARS-CoV-2 nanobodies targeting JN.1/KP.3 variants | ✅ | Abstract p.1: "nanobody binders to recent variants of SARS-CoV-2"; results confirm JN.1/KP.3 binding |
| Human PI writes meeting agendas; LLM PI agent leads specialist agents | ✅ | Fig. 1 p.3; Architecture section pp.3–5: human writes agenda, LLM PI leads team |
| Specialist agents: biologist, CS, critic | ⚠️ Compressed | See detail below |
| ~1% of interactions are human | ✅ | p.21: "human researcher wrote only 1,596 words...just 1.3% of all the words written by the Virtual Lab"; individual meetings with Scientific Critic: "around 1% for the human researcher" |
| 92 nanobodies designed computationally | ✅ | p.15: "Applying this workflow to each of the four starting nanobodies resulted in 92 final selected sequences (23 per starting nanobody)" |
| 2 showed improved binding to JN.1/KP.3 variants while maintaining ancestral-spike binding | ✅ | Abstract p.1: "two new nanobodies exhibit improved binding to the recent JN.1 or KP.3 variants of SARS-CoV-2 while maintaining strong binding to the ancestral viral spike protein"; pp.18–19 detail both mutants |
| Uses ESM, AlphaFold-Multimer, and Rosetta | ✅ | Abstract p.1; Tools selection section pp.12–13 |
| Published in Nature 2025 | ✅ | Title page: "Nature" journal; bioRxiv preprint posted Nov 2024 |

### ⚠️ Specialist agents: "biologist, CS, critic" omits Immunologist

**Slide says:** "LLM PI leads specialist agents (biologist, CS, critic)"

**What the paper reports (Fig. 2a, p.3):** The PI agent automatically created **three** specialist scientist agents for this project: an Immunologist, a Machine Learning Specialist, and a Computational Biologist — plus a Scientific Critic.

- The slide's "biologist, CS, critic" maps to: Computational Biologist → biologist; Machine Learning Specialist → CS; Scientific Critic → critic.
- The **Immunologist** is not mentioned in the slide.

**Severity:** Low. The compression is reasonable for a survey talk; the Immunologist is one of three scientist agents. Worth noting that the specialist agent composition varies by project — the PI defines them based on the task.

### Note on "1% of interactions" framing

The primary paper measures human contribution in **words**, not interaction count:
- Overall: 1.3% of words (human: 1,596 words; LLM agents: 122,462 words)
- Team meetings: ~0.5% of words written by human
- Individual meetings with Scientific Critic: ~1% of words by human

The slide says "~1% of interactions" — slightly different framing from the paper's word-count metric, but directionally accurate and a reasonable summary. No correction needed.

---

## Summary

### ⚠️ Two issues — no changes required unless precision matters

1. **Coscientist "GPT-4 agent"**: The system uses GPT-3.5 (web search) and GPT-4 (Planner). Calling it a "GPT-4 agent" is standard shorthand but not technically precise. Low risk for a general audience.

2. **Coscientist "palladium-catalyzed cross-coupling reaction"**: The demonstration actually performs both Suzuki AND Sonogashira reactions. The characterization is accurate for the Suzuki component. Low risk except for specialist chemistry audiences.

3. **Virtual Lab specialist agents**: The Immunologist is omitted. The slide's "biologist, CS, critic" compresses three agents to two scientist roles. Low risk for a survey talk.

### ❌ One BibTeX fix needed

Remove `Kline, Ben` from the `boiko2023coscientist` author list in `references.bib`. The arXiv paper has three authors (Boiko, MacKnight, Gomes), not four.

### ✅ All four previously unverified Virtual Lab claims now confirmed

The 92-nanobody count, the 2-nanobody improved-binding result, the ~1% human word share, and the specialist agent structure are all directly verified against the primary PDF.
