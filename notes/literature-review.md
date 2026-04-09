# Literature Review: Autoresearch & LLM-Driven R&D

Papers organized by topic. BibTeX keys reference `references.bib`.

---

## AI-Driven Research & Autonomous Discovery

### The AI Scientist v1 (`lu2024aiscientist`)
- arXiv:2408.06292 — Sakana AI, August 2024
- First end-to-end system to automate the scientific process: idea generation → hypothesis testing → experiment execution → paper writing.
- Three-stage pipeline: Idea Generation, Experimental Iteration, Paper Write-up.
- **Relevance:** The flagship "autoresearch" existence proof. Strong opening slide anchor.
- **Notes:** `notes/ai-scientist-v1.md`

### The AI Scientist v2 (`yamada2025aiscientistv2`)
- arXiv:2504.08066 — Sakana AI, April 2025
- Local PDF: `resources/2504.08066.pdf`
- Improves v1 with agentic tree search; eliminates human code templates; generalizes across ML domains.
- First fully AI-generated paper to pass peer review at a workshop venue (1 of 3 submissions accepted at ICLR 2025 ICBINB workshop).
- **Relevance:** Shows the loop is closing — not just writing papers but having them accepted.
- **Notes:** `notes/ai-scientist-v2.md`

### ResearchAgent (`baek2025researchagent`)
- arXiv:2404.07738 — NAACL 2025
- Builds an entity-centric knowledge store from literature co-occurrences; uses review agents to iteratively refine research ideas.
- **Relevance:** Scalable literature review automation; supports the "Tools and Techniques" section on RAG and knowledge graphs.

### Agentic AI for Scientific Discovery (`schmidgall2025agenticscience`)
- arXiv:2503.08979 — ICLR 2025
- Local PDF: `resources/2503.08979.pdf`
- Broad survey covering hypothesis generation, experimental design, data analysis, and manuscript prep for agentic systems across chemistry, biology, materials science, and ML.
- **Relevance:** Good structural overview; useful for framing the full autoresearch pipeline in the talk. Figure 1 (7-stage lifecycle diagram) is the clearest general definition of autoresearch.
- **Notes:** `notes/agentic-ai-scientific-discovery.md`

---

## LLM Coding Agents & Software Engineering

### SWE-agent (`yang2024sweagent`)
- arXiv:2405.15793 — NeurIPS 2024
- Introduces Agent-Computer Interfaces (ACI) for autonomous SE: git grep, file edits, unit testing in a ReAct loop.
- Solve rate arc: 12% (2024) → 80%+ (2025 SOTA) on SWE-bench.
- **Relevance:** Canonical paper for the coding-agent component of autoresearch. Shows rapid progress curve.

### OpenHands (`wang2024openhands`)
- arXiv:2407.16741 — ICLR 2025
- Open-source platform (formerly OpenDevin) for generalist coding agents: code, CLI, web browsing.
- **Relevance:** Shows democratization; open alternative to Devin/Claude Code. Good for "Tools" section.

### LLM-Based Agents for SE: A Survey (`liu2024llmsesurvey`)
- arXiv:2409.02977 — 124 papers surveyed, updated December 2025
- Categorizes work from both SE and agent perspectives; covers tool use and resource integration.
- **Relevance:** Comprehensive background reference for the coding agent landscape.

### LIVE-SWE-AGENT (`wang2025livesweagent`)
- arXiv:2511.13646 — 2025
- First live agent that autonomously evolves itself during runtime.
- 77.4% solve rate on SWE-bench Verified; 45.8% on SWE-bench Pro.
- **Relevance:** Demonstrates self-improvement loops — a core autoresearch capability.

---

## Multi-Agent Systems

### MetaGPT (`hong2024metagpt`)
- arXiv:2308.00352 — ICLR 2024 Oral (top 1.2%)
- Encodes Standardized Operating Procedures (SOPs) into prompt sequences; assigns human-like roles (PM, architect, engineer) to agents.
- **Relevance:** Shows how to structure multi-agent R&D teams. Directly maps to research group simulation.

---

## Tool Use & Inference Scaling

### Natural Language Tools (`naturallangtools2025`)
- arXiv:2510.14453 — 2025
- JSON-based tool calls reduce accuracy by 27.3 percentage points vs. natural language on GSM8K.
- **Relevance:** Counterintuitive insight: structure isn't always better. Good for "Tools and Techniques" nuance.

### Inference-Time Scaling (`snell2024inferencescaling`)
- arXiv:2408.03314 — 2024
- Small 7B model + tree search outperforms 34B model. Foundation for o1/o3 reasoning models.
- **Relevance:** Key theoretical framing: spend compute at inference time (iterative reasoning, search) rather than pre-training. Explains *why* agentic loops work.

---

## Benchmarks & Evaluation

### SWE-bench (`jimenez2024swebench`)
- arXiv:2310.06770 — 2024; Verified split released August 2024
- Real GitHub issues as coding tasks; gold standard for evaluating coding agents.
- **Relevance:** Primary yardstick for the field. Use the solve-rate progress curve to show capability trajectory.

### BigCodeBench (`zhuo2024bigcodebench`)
- arXiv:2406.15877 — 2024
- More realistic than HumanEval; focuses on real-world library calls and complex instructions.
- **Relevance:** Shows the field moving toward practical benchmarks.

### LiveCodeBench (`jain2025livecodebench`)
- arXiv:2403.07974 — 2025
- Continuously collects new problems to prevent training data contamination. Evaluates self-repair, execution prediction.
- **Relevance:** Addresses benchmark staleness — important caveat when citing progress numbers.

---

## Limitations & Critical Analysis

### Why LLMs Aren't Scientists Yet (`llmsnotscientists2025`)
- arXiv:2601.03315 — 2025
- Case studies of four autonomous research attempts; identifies gaps in hypothesis generation, experimental design validation, result interpretation.
- **Relevance:** Essential for the "Limitations and Risks" section. Honest counterweight to AI Scientist hype.

---

## Memory & Knowledge Management

### A-MEM (`xu2025amem`)
- arXiv:2502.12110 — February 2025
- Zettelkasten-inspired dynamic memory for agents: Factual, Experiential, and Working memory types with recency/importance/embedding retrieval.
- **Relevance:** Addresses the context-window constraint limitation. Useful in "Tools and Techniques" and "Limitations" sections.

---

## Notes on Coverage Gaps

- **Reproducibility/verification**: no paper yet on auditing AI-generated research results end-to-end.
- **Domain-specific autoresearch** (biology, chemistry, materials science): FunSearch (DeepMind), AlphaFold 3 adjacent work worth exploring.
- **Agent safety in research contexts**: hallucination auditing, citation fabrication — see Limitations section of `feng2026visionary`.
