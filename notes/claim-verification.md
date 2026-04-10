# Claim Verification Audit

Verified against local PDFs where available. PDF coverage:
- `resources/2408.06292.pdf` — AI Scientist v1 (`lu2024aiscientist`)
- `resources/2504.08066.pdf` — AI Scientist v2 (`yamada2025aiscientistv2`)
- `resources/2604.00945.pdf` — Vibe Researching (`feng2026visionary`)
- `resources/2503.08979.pdf` — Agentic AI Survey (`schmidgall2025agenticscience`)
- No local PDF for Coscientist (`boiko2023coscientist`) — verified via schmidgall survey
- No local PDF for Virtual Lab (`swanson2024virtuallab`) — verified via notes only

Status markers: ✅ Verified | ⚠️ Issue or caveat | ❌ Inaccurate

---

## Stage 1: Idea Generation

| Claim | Status | Source |
|---|---|---|
| Semantic Scholar API rejects ideas too similar to existing work | ✅ | v1 Fig. 1 caption p.2; p.4 "discard any idea that is too similar to existing literature" |
| Each idea rated 1–10 on Interestingness, Feasibility, and Novelty | ✅ | v1 p.7, idea JSON: `"Interestingness": 9, "Feasibility": 8, "Novelty": 8` |
| Multiple rounds of chain-of-thought + self-reflection | ✅ | v1 p.4: "We use multiple rounds of chain-of-thought and self-reflection" |
| Running archive prevents re-proposing already-explored ideas | ✅ | v1 p.4: "a running archive of already-generated ideas" |

---

## Stage 2: Experimentation

| Claim | Status | Source |
|---|---|---|
| Aider (LLM coding agent) implements plan-directed code changes | ✅ | v1 p.4: "Aider: An LLM-Based Coding Assistant... implements plan-directed code-level changes" |
| v1: linear loop, up to 5 iterations | ✅ | v1 p.4: "This process is repeated up to five times" |
| v2: tree search, parallel branches, best-first via LLM evaluator | ✅ | v2 pp.5–6: "best-first strategy is guided by an LLM evaluator considering performance metrics, training dynamics, and quality of generated visualizations" |
| v2: VLM checks generated figures | ✅ | v2 p.7: VLM feedback at two phases — during experimentation and during manuscript writing |
| Model ranking: Claude Sonnet 3.5 → GPT-4o → DeepSeek Coder (~$10 total) → Llama-3.1 405B | ✅ | v1 p.7: "Claude Sonnet 3.5 consistently produces the highest-quality papers"; Llama "could not reliably follow the review output template" |

---

## Stage 3: Paper Writing & Review

| Claim | Status | Source |
|---|---|---|
| Paper written section-by-section | ✅ | v1 p.5: "(a) Per-Section Text Generation" |
| LaTeX errors fed back for automated fixing | ✅ | v1 p.5: "(d) Compilation: LaTeX compilation errors back into Aider" |
| Semantic Scholar API retrieves references for related work | ✅ | v1 p.5: "(b) Web Search for References: allowed 20 rounds to search via Semantic Scholar API" |
| GPT-4o reviewer with 5-round self-reflection and 5 ensembled reviews | ✅ | v1 p.6: "GPT-4o... 5 rounds of self-reflection, 5 ensembled reviews, a meta-aggregation step" |
| **"Reviewer accuracy: 70% accept/reject vs. 66% for human reviewers"** | ❌ | See detail below |
| $0.25–$0.50 per review | ✅ | v1 p.7: "Each review is generated for $0.25 to $0.50 in API costs" |
| $15 per paper | ✅ (minor) | v1 p.1: "under $15 per paper" — slide drops "under" |
| First AI paper accepted at peer-reviewed venue (ICLR 2025 workshop, 1 of 3) | ✅ | v2 p.8–9: ICBINB workshop; "one manuscript achieved... top 45% of submitted workshop papers" |

### ❌ Reviewer accuracy: metric mismatch

**Slide says:** "Reviewer accuracy: 70% accept/reject vs. 66% for human reviewers"

**What the paper reports (v1 Table 1 + Figure 2, pp.6–7):**

| Metric | AI reviewer (best config) | Human reviewer |
|---|---|---|
| Balanced accuracy | 65% | 66% |
| Raw accuracy | 70% | **73%** |

- The **70%** is the AI's raw (unbalanced) accuracy.
- The **66%** is the human's *balanced* accuracy.
- These are different metrics — the comparison is apples to oranges.
- The paper's own framing (p.2): *"e.g. 65% vs. 66% balanced accuracy"*
- On raw accuracy, the AI (70%) is actually **below** the human (73%).
- The slide creates the false impression that the AI reviewer outperforms humans.

**Fix:** Change to "65% balanced accuracy vs. 66% for human reviewers" (near-human, slightly below), or add a note that the 70% figure is raw accuracy while the human baseline of 73% is also raw accuracy.

---

## Case Study 1: The AI Scientist

| Claim | Status | Source |
|---|---|---|
| ICLR 2025 ICBINB workshop; 1 of 3 submissions accepted | ✅ | v2 p.8–9: "I Can't Believe It's Not Better (ICBINB)... one manuscript achieved a sufficiently high average reviewer score" |
| Cost: $15 per paper end-to-end | ✅ | v1 p.1: "under $15 per paper" |

---

## Case Study 2: Coscientist

| Claim | Status | Source |
|---|---|---|
| GPT-4 agent with four tools: web search, documentation reader, code executor, robotic lab controller | ✅ (via survey) | schmidgall §5.1 p.4: "integrates modules for web search, documentation analysis, code execution, and robotic automation" |
| Palladium-catalyzed cross-coupling reaction | ✅ (via survey) | schmidgall p.4: "Coscientist successfully designed and optimized a palladium-catalyzed cross-coupling reaction" |
| **Note** | ⚠️ | No primary Boiko et al. PDF available locally. Claims verified via schmidgall's citation (Nature, 624(7992):570–578). |

---

## Case Study 3: Virtual Lab

| Claim | Status | Source |
|---|---|---|
| Design SARS-CoV-2 nanobodies targeting JN.1/KP.3 variants | ⚠️ Notes only | notes/case-studies.md; no local PDF |
| LLM PI leads specialist agents (biologist, CS, critic) | ⚠️ Notes only | notes/case-studies.md |
| ~1% of interactions are human | ⚠️ Notes only | notes/case-studies.md |
| 92 nanobodies designed; 2 showed improved binding | ⚠️ Notes only | notes/case-studies.md |
| Published in Nature 2025 | ✅ | schmidgall references list p.13 lists Swanson et al. bioRxiv 2024; bib entry notes "published in Nature 2025" |

---

## Technical Failures

| Claim | Status | Source |
|---|---|---|
| Literature review is the most consistently failing stage | ✅ | schmidgall §8 conclusions p.9: "the literature review phase exhibited the highest failure rate" |
| Hallucinated citations: AI Scientist-v2 introduced citation inaccuracies | ✅ | v2 p.9: "THE AI SCIENTIST-v2 occasionally introduced inaccuracies in citations" |
| Positive-spin bias: tendency to emphasize positive results | ✅ | v2 p.9: "Overly optimistic framing — tendency to emphasize positive results"; v1 p.10: "Positive Interpretation of Results" with concrete example |
| Brittleness on novel tasks: struggle with genuinely new hypotheses | ✅ | feng §5.6 p.15: "agents are... least reliable on the genuinely novel work that constitutes the core contribution of most papers" |
| Workshop-level, not conference-level; 60–80% acceptance rate | ✅ | v2 p.9: "accepted at a workshop (60–80% acceptance) not a top-tier venue (20–30% acceptance)" |

---

## Systemic Risks

| Claim | Status | Source |
|---|---|---|
| Verification asymmetry: "requires nearly as much expertise as doing it" | ⚠️ Understated | feng §5.5 p.14: "takes **more** focused effort than writing it yourself." Slide says "nearly as much" — the paper says it's actually harder. |
| Literature flooding: "polished mediocrity saturates venues" | ✅ | feng §6.2.3 p.18 ("Flooding the Literature") + §6.2.4 p.19 ("Polished Mediocrity"): "reads as confidently as a genuine contribution" |
| Physical safety: blast-radius constraints; misinterpreting physical context | ✅ | schmidgall §7.3 p.9 (near-verbatim): "the 'blast radius' of these agents—especially those integrated with robotic labs—must be well-defined. Autonomous agents... may misinterpret situational contexts" |
| Weak disclosure norms: could inflate CVs or obscure AI authorship | ✅ | feng §6.2.2 p.18: "If disclosure norms are weak... the playing field tilts toward those willing to use agents aggressively without saying so" |
| AI Scientist-v2 authors withdrew accepted papers | ✅ | v2 p.9: "we arranged with the workshop organizers to withdraw all three manuscripts... to avoid prematurely setting a precedent" |

---

## Summary of Issues

### ❌ One inaccuracy requiring a fix

**Slide:** "Reviewer accuracy: 70% accept/reject vs. 66% for human reviewers"

The 70% is AI raw accuracy; the 66% is human *balanced* accuracy. Mixing these metrics makes the AI look better than humans. The paper's own apples-to-apples comparison is 65% vs. 66% balanced accuracy (AI slightly below human). On raw accuracy, the AI (70%) is also below humans (73%).

### ⚠️ One wording note

**Slide:** "checking AI-generated work requires nearly as much expertise as doing it"

The source (feng §5.5) says verification takes *more* effort than doing it yourself, not just "nearly as much." The slide understates the claim.

### ⚠️ Four unverified claims (no primary PDF)

All four Virtual Lab claims rest on notes rather than the Swanson et al. primary paper. Low risk — these are descriptive claims about a published Nature paper, but worth downloading the PDF if the deck will be presented publicly.
