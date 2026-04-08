# A Visionary Look at Vibe Researching

- BibTeX key: `feng2026visionary`
- Local PDF: `resources/2604.00945.pdf`
- arXiv: <https://arxiv.org/abs/2604.00945>
- Authors: Yebo Feng and Yang Liu
- Date: April 1, 2026

## Summary

- The paper defines "vibe researching" as a research workflow where the human provides direction, judgment, and accountability while LLM agents execute labor-intensive steps such as literature review, coding, analysis, and drafting.
- It places vibe researching between `AI for Science` and fully autonomous `auto research`.
- The key distinction from full autonomy is that the human remains the orchestrator and final quality gate.

## Useful Framing For The Deck

- `Kinds of Autoresearch`: the paper gives a clean spectrum: traditional research, tool-assisted research, AI for Science, vibe researching, and auto research.
- `Autoresearch Techniques`: it summarizes enabling techniques that map well to slide content: multi-agent systems, memory, tool use, planning/decomposition, RAG, and self-reflection.
- `Examples` or discussion slides: it is a strong source for risks and tradeoffs, not just capabilities.

## Core Workflow In The Paper

- The human-agent loop is: instruct, execute, present, evaluate, redirect.
- The higher-level phases are: ideation, exploration, experimentation, synthesis, and refinement.
- The paper argues that the researcher should act as creative director rather than a passive approver.

## Limitations Highlighted

- Hallucination and lack of rigor.
- Context window constraints and weak long-term memory.
- Research infrastructure is not designed for agents.
- Multimodal capability is still shallow for research-grade use.
- Verification asymmetry: checking agent work can cost nearly as much expertise as doing it.
- Brittleness on genuinely novel tasks.
- Data privacy and IP risks when using cloud models.

## Positive And Negative Impacts

- Positive: more leverage for under-resourced labs, faster iteration, broader research coverage, easier cross-disciplinary work, lower cognitive load, and more hidden-connection discovery.
- Negative: convergent thinking, weak disclosure norms, literature flooding, polished mediocrity, public-trust erosion, devaluation of expertise, and weaker training pipelines.

## Caveats

- This is mainly a conceptual/synthesis paper, not an empirical benchmark paper.
- It is useful for framing terminology, workflow, and tradeoffs, but weaker as evidence for quantitative performance claims.
- The paper explicitly states that it was itself produced using the vibe-researching paradigm, which is relevant if the deck discusses disclosure norms or reflexive examples.
