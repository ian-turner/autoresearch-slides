# Agentic AI for Scientific Discovery: A Survey of Progress, Challenges, and Future Directions

- BibTeX key: `schmidgall2025agenticscience`
- Local PDF: `resources/2503.08979.pdf`
- arXiv: https://arxiv.org/abs/2503.08979
- Authors: Mourad Gridach, Jay Nanavati, Khaldoun Zine El Abidine, Lenon Mendes, Christina Mack (IQVIA)
- Published: ICLR 2025 (conference paper)
- Submitted: March 12, 2025

## Summary

Comprehensive survey of Agentic AI for scientific discovery across chemistry, biology, materials science, and general/ML research. Categorizes existing systems into fully autonomous and human-AI collaborative frameworks. Covers the research lifecycle from ideation through peer review, surveys benchmarks and evaluation metrics, and identifies key open challenges around trustworthiness, ethics, and system reliability. The survey's canonical workflow diagram (Figure 1) is the clearest single-image overview of what an agentic research pipeline looks like end-to-end.

---

## Taxonomy: Two Modes of Operation

### Fully Autonomous Systems
Operate end-to-end with minimal human intervention. Leverage LLM planning + tool use to execute complete scientific workflows.

Key examples:
- **Coscientist** (Boiko et al., 2023) — autonomous GPT-4 agent for chemistry; integrates web search, documentation analysis, code execution, and robotic automation. Successfully designed and optimized a palladium-catalyzed cross-coupling reaction.
- **ChemCrow** (Bran et al., 2024) — extends GPT-4 with 18 chemistry-specific tools for organic synthesis, drug discovery, materials design.
- **ProtAgents** (Ghafarollahi & Buehler, 2024) — multi-agent for protein design; combines physics and ML to predict folding patterns and refine protein sequences.
- **LLaMP** (Chiang et al., 2024) — materials AI using RAG to predict material properties; reduces hallucination via hierarchical reasoning agents grounded in high-fidelity datasets (Materials Project).

Strength: efficient for well-defined, repetitive, or high-precision tasks.  
Weakness: struggles with creativity, domain-specific intuition, and interdisciplinary knowledge.

### Human-AI Collaborative Systems
Emphasize synergy between AI and human expertise. AI handles automation; humans provide guidance, validation, and direction.

Key examples:
- **Virtual Lab** (Swanson et al., 2024) — framework conducting interdisciplinary research; organizes team meetings and individual tasks. Designed nanobody binders for SARS-CoV-2.
- **BioPlan** (O'Donoghue et al., 2023) — converts scientific goals into pseudocode-like steps for wet-lab experiments.
- **CALMS** (Prince et al., 2024) — lab assistant that provides real-time contextual assistance in experiments but does not execute autonomously.
- **Agent Laboratory** (Schmidgall et al., 2025) — accepts human-provided research ideas and autonomously progresses through literature review, experimentation, and report writing.

Strength: ability to integrate human creativity, domain expertise, interpretability.  
Weakness: still requires manual validation; performance drops significantly in literature review phase.

---

## The Research Lifecycle (Figure 1)

The survey defines the full agentic research workflow as seven sequential stages. This is the most useful canonical framing for the "What Is Autoresearch?" section:

1. **Idea Generation & Literature Review** — analyzing existing literature, identifying gaps, proposing novel hypotheses
2. **Research Planning & Experiment Design** — structuring experiments to test hypotheses
3. **Data Preparation & Experiment Execution** — running experiments, including robotic automation in wet-lab contexts
4. **Results Analysis** — extracting insights, identifying patterns
5. **Report Writing & Synthesis** — synthesizing findings into a manuscript
6. **Paper Review** — automated or human peer review

**Key takeaway from survey conclusions:** Literature review is the most consistently failing stage across nearly all systems. ResearchAgent generates novel ideas but cannot perform structured literature reviews. Agent Laboratory showed high success in data preparation and experimentation but significant failure in the literature review phase.

---

## Domain Applications (Figure 2)

The survey demonstrates that autoresearch extends far beyond ML:

| Domain | Notable Systems |
|---|---|
| Chemistry | Coscientist, ChemCrow, LLaMP, Organa, ChatMOF, MOOSE-CHEM |
| Biology | BIA (bioinformatics), CellAgent (single-cell RNA), TAIS, ProtAgents, CRISPR-GPT |
| Materials Science | MatPres, ICDC, ACCELMAT, Strieth-Kalthoff et al. (laser emitters) |
| General Science | ResearchAgent, The AI Scientist, Galactica, Agent Laboratory |
| Machine Learning | MLAgentBench, MLE-BENCH, Copilot |

Notable specific result: Organa automated complex processes like electrochemical polishing and redox potential measurements, reducing human experiment time by 20%.

---

## Implementation Tools

- **AutoGen** (Wu et al., 2023) — multi-agent conversation framework; "customizable and conversable agents"
- **MetaGPT** (Hong et al., 2024) — intelligent agentic framework; encodes human workflow processes into LM agent tasks using assembly-line method
- **Letta** — open-source agentic framework based on MemGPT cognitive architecture; designed for persistent agent deployment

---

## Benchmarks & Datasets (Table 1)

| Dataset | Domain | Purpose |
|---|---|---|
| LAB-Bench | Biology | Reasoning and planning for biological research |
| ZINC Database | Chemistry | Virtual screening for drug discovery |
| MoleculeNet | Chemistry | Molecular property prediction |
| MatText | Materials Science | Text-based material property prediction |
| MatSci-NLP | Materials Science | Language processing for materials science |
| MaSQA | Materials Science | QA for materials science |
| ChEMBL | Chemistry | Bioactive molecule prediction |
| PubChem | Biology/Chemistry | Molecular feature extraction |
| AlphaFold Protein Structure | Biology | Protein structure prediction |
| ICLR 2022 OpenReview | Scientific Research | Performance evaluation of automated paper reviewer |

---

## Challenges & Open Problems (Section 7)

### Trustworthiness
- Avoiding overfitting to benchmark conditions; AI agents often optimize for measurable metrics rather than real-world scientific value.
- Need for cost-controlled evaluations combining accuracy, cost, speed, throughput, and reliability.
- Explainability: AI behavior must be understandable and scrutable by humans.

### Ethical & Practical Considerations
- LLMs can amplify existing biases; particularly dangerous in healthcare.
- Hallucinations in citations and result interpretation are major risks.
- Autonomous agents in decentralized environments (e.g., with financial transactions or sensitive health records) raise accountability concerns.
- Need for robust oversight mechanisms, human-in-the-loop architectures, and bias mitigation.

### Potential Risks
- **Data reliability** — flawed or incomplete data propagates through the pipeline, producing incorrect or irreproducible results.
- **Agent misalignment** — agents pursuing research goals can generate irrelevant or wasteful experiments.
- **Coordination failures** — multi-agent systems can suffer from communication breakdowns.
- **Physical safety** — agents integrated with robotic labs must have well-defined "blast radius" constraints. Autonomous agents interacting with physical systems may misinterpret situational contexts.

---

## Useful Framing for the Deck

- **"What Is Autoresearch?" section** — Figure 1 (the 7-stage research lifecycle diagram) is the cleanest single-image definition of autoresearch. More general than AI Scientist's 3-stage pipeline; better for opening the section before drilling into specific systems. The autonomous vs. collaborative taxonomy is a useful organizing axis.
- **Breadth argument** — The domain matrix (chemistry, biology, materials, ML) demonstrates autoresearch is not just an ML curiosity. Use Figure 2 to make this point visually.
- **"Limitations and Risks" section** — Section 7 is comprehensive and well-organized. The "literature review is the hardest stage" finding is a concrete, memorable calibration point. The physical safety "blast radius" framing is striking.
- **Calibration note** — The survey is from IQVIA (a healthcare data/services company), so domain examples skew toward biology, chemistry, and materials. The ML autoresearch coverage (AI Scientist, ResearchAgent) is treated as one domain among many rather than the primary focus.
