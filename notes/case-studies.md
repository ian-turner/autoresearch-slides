# Case Studies Section Notes

Three case studies planned, one slide each. Narrative arc: fully autonomous (ML) → fully autonomous (physical lab) → human-AI collaborative.

---

## Slide 1: AI Scientist

- **Key**: anchor as the existence proof for autoresearch, not a repeat of the pipeline mechanics
- Milestone: first AI-generated paper accepted at peer review (ICLR 2025 workshop, 1 of 3 submissions)
- Cost benchmark: ~$15/paper end-to-end
- BibTeX keys already in references.bib: `lu2024aiscientist`, `yamada2025aiscientistv2`

---

## Slide 2: Coscientist

- **Paper**: Boiko et al., 2023 — "Emergent autonomous scientific research capabilities of large language models"
- **arXiv**: 2304.05332 (also published in Nature)
- **BibTeX key to add**: `boiko2023coscientist`
- GPT-4 agent with 4 tools: web search, documentation reader, code executor, robotic lab controller
- Task: design and physically execute a palladium-catalyzed cross-coupling reaction
- Key point: crossed the digital-physical boundary — autonomous experiment execution, not just writing
- No local PDF; pull from arXiv if needed

---

## Slide 3: Virtual Lab

- **Paper**: Swanson et al., 2024 — "The Virtual Lab: AI Agents Design New SARS-CoV-2 Nanobodies with Experimental Validation"
- **bioRxiv**: https://www.biorxiv.org/content/10.1101/2024.11.11.623004v1
- **Nature (2025)**: https://www.nature.com/articles/s41586-025-09442-9
- **GitHub**: https://github.com/zou-group/virtual-lab
- **BibTeX key to add**: `swanson2024virtuallab`

### Collaboration mechanism
- Human researcher writes the agenda for each team meeting
- LLM PI agent leads a team of specialist agents (biologist, CS, critic)
- N rounds of discussion per meeting → critic provides feedback → PI synthesizes and asks follow-ups
- Individual meetings: human interacts 1-on-1 with a single agent for specific tasks
- Human involvement: ~1% of interactions; human controls direction at every meeting boundary

### Result
- 92 nanobodies designed computationally using ESM, AlphaFold-Multimer, and Rosetta
- 2 nanobodies showed improved binding to JN.1/KP.3 variants while maintaining binding to ancestral spike
- Published in Nature 2025

### Key contrast with fully autonomous systems
- Fully autonomous (AI Scientist, Coscientist): human sets up the system and steps away
- Virtual Lab: human acts as PI — agenda-setting and validation are human responsibilities; AI handles execution
- Enables interdisciplinary work that would normally require assembling a large expert team

---

## TODO before writing slides
- Add `boiko2023coscientist` to references.bib
- Add `swanson2024virtuallab` to references.bib
