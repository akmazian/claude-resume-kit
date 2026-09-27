# The diverse functions of viral microproteins

> Source: `knowledge_base/papers/2026.08.23.746553v1.full.pdf` (84 pp. incl. supplement).
> Related: [[Zhang_profile_basics]]. Position: Weissman Lab @ Whitehead, Research Technician (Jan 2025 – May 2026).
> **Pending separate extraction:** the 20,000-ORF overexpression Perturb-seq + 2,500-gene CRISPRi Perturb-seq project is
> SEPARATE, UNFINISHED work (AZ left the lab before completion) — not part of this preprint. See Provenance Notes.

## Metadata
- **Authors:** Yi Hua Chen-Neumann\*, Louisa Grauvogel†, **Adam S. Zhang†**, André C. Michaelis, Tim Heymann, Elisabeth Zollbrecht, Paulina Engel, Christian Pensl, Kathryn E. Yost, Wesley Suen, Sumita Sinha, Edwin N. Neumann, Stephen J. Elledge, Karl-Peter Hopfner, Benjamin E. Gewurz, Matthias Mann, Jonathan S. Weissman\*
  - († equal contribution; \* corresponding. AZ is **3rd of 17 authors**.)
- **Year:** 2026 (posted Aug 24, 2026)
- **Journal:** bioRxiv — **preprint, NOT peer-reviewed**
- **DOI:** 10.64898/2026.08.23.746553
- **User's role:** equal-contribution author (†, shared with Grauvogel). **NOT first author, NOT co-first** — Chen-Neumann is first + corresponding.
- **Published author-contribution credit:** Investigation only (YHC, LG, **ASZ**, ACM, TH, EZ, PE, CP, KEY, SS, ENN). AZ is *not* listed under Conceptualization, Methodology, Visualization, Funding acquisition, Supervision, or Writing.
- **Status:** preprint
- **Data:** SRA PRJNA1516588 · GEO GSE344535 (Perturb-seq), GSE342977 (RNA-seq) · PRIDE PXD08253 · analysis code at github.com/cheny4/viral_microproteins (first author's repo)

## Methods & Tools
- **Pooled screening (AZ):** ORF-overexpression pooled growth screens — the **validation/secondary screen** of the 4,107-element Enriched Library (K562 + RPE-1, 10-day, 4 replicates); FACS-based surface MHC-I (β2m) screens ±IFN-γ in RPE-1 and A375; ER-stress survival screens; pooled alanine/lysine-scanning mutagenesis screen of BNLF2b variants
- **Arrayed / cell-biology assays (AZ):** growth-competition assays, confluency-based growth-rate measurements, IFN-α/γ luciferase reporter assays, fluorescence microscopy for subcellular localization (ER–Golgi, nuclear/nucleolar, pSTAT1 nuclear exclusion)
- **Biochemistry (AZ):** affinity-enrichment mass spectrometry (AE-MS) of ALFA-tagged BNLF2b; Western blotting (interactor validation, PKA holoenzyme subunit specificity, phospho-PKA substrates, pERK/pMEK); PKA activity assays
- **Molecular biology (AZ):** site-directed mutagenesis — BNLF2b RRNAL pseudosubstrate and proline-rich motif mutants; ORF6 M58A, MPXVgp154 M69A, YLDV132R M75A
- **Transcriptomics (AZ):** bulk RNA-seq of RPE-1 expressing PKIA / wild-type BNLF2b / PKA-inhibition-defective mutants / mCherry control
- **Cell systems (AZ):** K562, RPE-1 (hTERT-immortalized), A375, normal oral keratinocytes (NOKs); lentiviral transduction; doxycycline-inducible (Tet-On) and constitutive ORF expression
- **Computational (AZ, initial only):** initial analysis of the RNA-seq and AE-MS datasets. Publication-grade analysis was done by the first author.
- **Project methods NOT performed by AZ:** pANDORA vector development, pan-viral library curation/cloning, primary 50K growth screens, Perturb-seq (execution + clustering/energy-distance/guilt-by-association analysis), AlphaFold 3 modeling and MSAs, AE-MS of the MHC-I inhibitors and other cluster members, soft-agar assays, all pharmacological perturbation experiments

## Key Results
_(AZ-attributable results listed first; project-level context at the end.)_
1. **Enriched Library validation screen** (AZ): 2,028 hits at FDR < 0.05 across K562 and RPE-1; toxic hits correlated between cell lines (Pearson R = 0.78), while pro-growth hits were largely cell-type specific. 70% of hits were unannotated; 34% used non-ATG start codons.
2. **MHC-I / ER-stress screens** (AZ): screened 8,806 smORFs for surface MHC-I changes → **748 hits** (FDR < 0.05); 40% scored in no growth screen, establishing growth-independent immunomodulatory function. 37% of hits were highly hydrophobic with predicted signal sequences or TMDs and also scored in ER stress. Recovered known TAP inhibitors (HSV ICP47, EBV BNLF2a, CPXV012) and ER disruptors (HPV E5, enterovirus 3A) as positive controls.
3. **Arrayed growth validation** (AZ): validated **6 previously uncharacterized pro-growth viral microproteins** plus the HPV E7 positive control in orthogonal arrayed growth-competition assays — the step that nominated BNLF2b for mechanistic follow-up.
4. **BNLF2b pro-growth phenotype** (AZ): EBV BNLF2b, a microprotein with UniProt annotation score 2, conferred a robust fitness advantage in RPE-1 competition and confluency assays, reproduced in normal oral keratinocytes (NOKs), a standard viral-oncogene model.
5. **BNLF2b–PKA interaction** (AZ): AE-MS of ALFA-tagged BNLF2b identified **PRKACA and PRKACB** (PKA catalytic subunits) as top interactors; Westerns confirmed binding and showed BNLF2b does *not* bind PKA regulatory subunits. PKA activity assays and phospho-substrate blots established BNLF2b as a **PKA inhibitor**.
6. **Sufficiency** (AZ): the native human PKA inhibitor PKIA phenocopied BNLF2b in growth-competition assays, showing PKA inhibition alone is sufficient to promote epithelial fitness.
7. **MAPK axis** (AZ): pERK and pMEK increased in cells expressing BNLF2b or PKIA but not E7, identifying MAPK/ERK activation as the downstream growth mechanism.
8. **Mimicry motifs** (AZ): pooled alanine/lysine-scanning screen showed mutations in either the **RRNAL pseudosubstrate motif** (mirroring the RRXAI motifs of human PKIA/PRKAR1A) or an adjacent proline-rich motif reduced BNLF2b-driven growth; targeted mutants lost the fitness advantage and showed impaired PKA binding and inhibition.
9. **Second, PKA-independent arm** (AZ): RNA-seq across PKIA, wild-type BNLF2b and PKA-inhibition-defective mutants resolved three transcriptional signatures, revealing ECM/EMT genes (RUNX2, COL1A1, FN1, BGN, CLDN11) induced by BNLF2b but not PKIA — evidence for an oncogenic program beyond PKA inhibition.
10. **Convergent interferon antagonism** (AZ): IFN-α/γ luciferase reporter assays showed all Cluster 4 members (HIV-1 Vpr, SARS-CoV-2 ORF6, MPXVgp154, YLDV132R, an unannotated HMO astrovirus A smORF) suppress interferon response; single methionine-to-alanine mutants (**ORF6 M58A, MPXVgp154 M69A, YLDV132R M75A**) abolished IFN inhibition, demonstrating a shared DDXXMEID-like Rae1-binding SLiM independently evolved across phylogenetically distant viruses.
11. **Localization** (AZ): imaging placed Vpr and the HMO AstV-A smORF in the nucleus/nucleolus and showed ORF6, MPXVgp154 and YLDV132R drive pSTAT1 nuclear exclusion in IFN-γ-stimulated A375 cells, supporting nucleocytoplasmic-transport disruption as the cluster's defining function.
12. **Project-level context (NOT AZ's own result):** the atlas spans a 52,979-element pan-viral smORF library from 502 genomes across 38 viral families / all 7 Baltimore classes, identifying >2,000 active microproteins from >300 viruses.

## Novelty Claims
- **Mechanistic (AZ's work):** first functional characterization of EBV BNLF2b — an uncharacterized microprotein and serological biomarker for nasopharyngeal carcinoma — as a **viral mimic of human PKA inhibitors** that drives epithelial proliferation via the PKA–MAPK axis, plus a second PKA-independent EMT/anoikis arm.
- **Evolutionary (AZ did the functional validation, not the structural prediction):** independent emergence of the same short linear motif in distantly related viruses converging on the host Rae1 node.
- **Project-level (shared, hedge):** first systematic phenotype-first functional atlas of the pan-viral dark proteome.
- **Avoid:** "discovered a novel oncogene" overstates it — BNLF2b was already annotated (score 2), translation-confirmed by ribosome profiling, and known as an NPC biomarker. The accurate claim is that AZ characterized its previously undocumented oncogenic function and mechanism.

## Collaboration & Scope
- **Other groups:** Max-Planck Institute of Biochemistry + LMU Munich (Mann, Hopfner — proteomics/structure), Harvard/Brigham (Gewurz — EBV biology), HHMI/Brigham (Elledge), MIT/Whitehead (Weissman). Part of the ILLUMINE team under the Cancer Grand Challenges partnership.
- **AZ's specific contribution:** the BNLF2b mechanistic dissection (minus soft-agar and pharmacology), the Enriched Library validation screen, the MHC-I and ER-stress screens, the arrayed pro-growth validation, and the Cluster 4 interferon functional work (reporters, SLiM mutants, localization).
- **Shared vs. sole:** AZ performed these experiments hands-on but within a large multi-institution project he did not design. Conceptualization, methodology, figures and writing are credited to others.

## Provenance Notes
- **Publication status:** bioRxiv preprint, posted Aug 24, 2026, **not peer-reviewed**. Matches `config.md` Provenance Flags. Never write "published," "peer-reviewed," or name a journal.
- **Safe to claim (full-ownership verbs):** the MHC-I/ER-stress screens and their 8,806-screened / 748-hit numbers; the Enriched Library validation screen and its 2,028 hits; arrayed validation of 6 pro-growth microproteins; every BNLF2b experiment in Key Results 4–9 except soft agar and drug treatments; the IFN reporter assays, SLiM mutants and localization imaging.
- **Needs hedging:** atlas-scale figures (52,979-element library, >2,000 active microproteins, >300 viruses) — AZ contributed to the project, not the primary screen, so use "contributed to" / "as part of". RNA-seq and AE-MS analysis — "carried out initial analysis"; the published analysis is the first author's.
- **Do NOT claim:** primary 50K growth screens · pANDORA vector development · library design/curation/cloning · Perturb-seq execution or its clustering/guilt-by-association analysis · soft-agar anchorage-independent growth assays · pharmacological perturbations (RMC-7977, PD0325901, cisplatin, forskolin/IBMX) · AE-MS of MHC-I inhibitors and other cluster members · AlphaFold 3 modeling and MSAs · figures/visualization · manuscript writing · first or co-first authorship.
- **Rule 5:** project funding (Gates Foundation, CZI, HHMI, NCI OT2CA321158, NIH P01CA269043, DFG) is institutional and must never appear under Fellowships & Honors.
- **Correction to [[Zhang_profile_basics]]:** author count is 17, not 20.
- **Old resume bullets to retire:** "Systematically characterized 50,000 unannotated viral micropeptides using pooled genetic screens" (AZ did the validation screen, not the primary 50K screen) and "Executed overexpression Perturb-seq with 20,000 viral ORFs and CRISPRi Perturb-seq with 2,500 human essential genes" (separate unfinished project — its own extraction, where AZ's real contribution is library cloning, cell-line generation, and partial screen/Perturb-seq execution before leaving the lab).

## Resume Bullet Seeds
_Seeds only — not final text. Char-count against `resume_reference.md` before use._
1. Identified EBV BNLF2b as a mimic of human PKA inhibitors by affinity-enrichment mass spectrometry, validating PRKACA/PRKACB binding and PKA inhibition by Western blot and kinase activity assays.
2. Established the growth mechanism of an uncharacterized EBV microprotein, showing PKA inhibition activates MAPK/ERK signaling and that the human inhibitor PKIA phenocopies the proliferative effect in epithelial cells.
3. Mapped the functional residues of a viral PKA-inhibitor mimic through a pooled alanine/lysine-scanning screen, pinpointing two motifs whose mutation abolished both PKA binding and the growth advantage.
4. Screened 8,806 viral small ORFs for MHC class I surface modulation by FACS, identifying 748 hits of which 40% had no growth phenotype, separating direct immune evasion from general ER disruption.
5. Demonstrated convergent interferon antagonism across four unrelated viruses using IFN-α/γ reporter assays and single-residue mutants, showing an independently evolved motif drives nuclear-transport blockade.
6. Validated 6 previously uncharacterized pro-growth viral microproteins in arrayed growth-competition assays, nominating the oncogenic candidate selected for full mechanistic follow-up.
7. _(hedged, collaboration-framed)_ Contributed experimental characterization to a pan-viral microprotein atlas spanning 38 viral families, published as a bioRxiv preprint with equal-contribution authorship.
