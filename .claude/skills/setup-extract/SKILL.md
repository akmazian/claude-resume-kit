---
description: Extract structured information from research papers, PDFs, or code into knowledge base extractions
user-invocable: true
---

# /setup-extract

**User input:** `$ARGUMENTS`

Parse `$ARGUMENTS`:
- File path to a paper (e.g., `papers/Smith2024_catalyst.pdf`, `papers/project_report.tex`) → read that file
- Multiple paths separated by spaces → batch mode (process each sequentially)
- Empty → ask the user for the paper path or paste content

---

## Startup

1. Read `resume_builder/reference/shared_ops.md` — **Asking the User Things** (Phase 2 is fully interactive)
2. Read `CLAUDE.md` — check KB Corrections Log for known issues
3. Read `config.md` — load Personal Info (to identify user's author position), Provenance Flags
4. Read `knowledge_base/extractions/_INVENTORY.md` — see what's already extracted, avoid duplicates

If the paper is already in the inventory:
- Show the existing extraction path
- Use the **`AskUserQuestion`** tool to offer: **Re-extract (overwrite)** / **Skip** / **Add as a separate entry** (when the file covers a distinct project)
- The tool blocks until answered — never proceed on an assumption

---

## Phase 1: Read & Understand the Paper

Read the paper using the appropriate method:
- **PDF files:** Use the Read tool (supports PDF reading)
- **.tex source:** Read directly — often has more detail than the compiled PDF
- **If both exist:** Prefer .tex for content extraction, use PDF for figures/tables

**While reading, collect:**
1. Full title, all authors, year, journal/venue, DOI (if available)
2. The user's position in the author list (first, co-first, second, middle, last, corresponding)
3. Publication status (check `config.md` Provenance Flags first, then infer: published / under review / draft / internal)
4. All computational methods, experimental techniques, software, and frameworks mentioned
5. Quantitative results — speedups, accuracies, efficiencies, improvements over baselines
6. Novelty claims — "first-ever", "new framework", "novel approach", etc.
7. Collaboration indicators — other groups, institutions, shared resources
8. Funding acknowledgments

Progress: "Reading paper... [title] by [first author] et al., [year]"

---

## Phase 2: Clarify User's Role — ASK INTERACTIVELY

Multi-author work almost never makes the user's own contribution legible from the text. Resolve it by asking
**one question at a time with the `AskUserQuestion` tool**. Never print a numbered list of questions in your
response — that forces the user to re-type answers to five things at once, and it buries the follow-up
questions that actually change the bullets.

### Rules

1. **One question per `AskUserQuestion` call.** Two only when tightly coupled and the second is meaningless
   without the first. Each answer shapes the next question.
2. **Options must name real things from the paper** — specific assays, figure panels, library sizes, named
   datasets, sections. Generic options ("most of it" / "some of it") waste the turn. Finish Phase 1 first so
   every option is concrete and checkable.
3. **Lead with your best guess, labeled `(Recommended)`**, derived from the paper's own author-contributions
   statement plus anything the user said in `$ARGUMENTS`. A correct guess the user just confirms is the fast path.
4. **Follow the forks.** An answer revealing a split ("I did the experiments but not the final analysis",
   "that's a different project", "everything except X") earns a follow-up question, never an assumption.
5. **Use `multiSelect: true`** when listing candidate experiments the user may have done some subset of.
6. **Stop when the provenance picture is complete** — typically 3-6 questions. Do not keep asking for detail
   that cannot change a bullet or a hedge.

### Topics to resolve (skip any the paper or `$ARGUMENTS` already settles)

| Topic | Why it matters |
|-------|----------------|
| Which specific experiments/analyses were the user's | Sets every verb in the bullet seeds |
| Bench vs. computational split on shared datasets | "Performed" vs. "carried out initial analysis" vs. hedge |
| Contributions outside the user's main section | Users often ran validation work credited elsewhere |
| Tools, vectors, libraries, pipelines the user built | Infrastructure bullets (and Rule 1: no code folder names) |
| Anything that must NOT appear on a resume | Collaborator data, embargoed or unpublished results |
| Conflicts with the existing KB or current resume | Must be settled by the user, never silently resolved |

### Cross-check before you stop asking

Compare what the user claims against:
- the paper's **author-contributions** statement — the published record of their role;
- existing extractions, `config.md` Provenance Flags, and the user's current resume.

When a claim the user already makes conflicts with the paper or with their answers, **raise it as its own
`AskUserQuestion`**, with options for how to record it (drop it / reframe with hedged verbs / it belongs to
different work). Never pick for them. Log the resolution in `config.md` KB Corrections so it cannot return.

### >>>>>> MANDATORY STOP — DO NOT PROCEED <<<<<<
Write no extraction file until these interactive questions are answered. `AskUserQuestion` blocks until the
user responds, which satisfies this stop — a prose list of questions does NOT.

---

## Phase 3: Write Extraction

Create the extraction file at `knowledge_base/extractions/<AuthorYear_short_descriptor>.md`

**Naming convention:** `<FirstAuthorLastName><Year><2-3_word_descriptor>.md`
- Examples: `Smith2024_protein_stability.md`, `Chen2023_binding_affinity.md`
- If the user is first author: use their last name
- Normalize to lowercase with underscores

**Extraction format:**

```markdown
# [Full Paper Title]

## Metadata
- **Authors:** [author list — highlight user's name with bold]
- **Year:** [year]
- **Journal:** [journal/venue or "unpublished"/"internal"/"under review at X"]
- **DOI:** [DOI or "N/A"]
- **User's role:** [first author / co-first / contributing / corresponding]
- **Status:** [published | under review | draft | internal]

## Methods & Tools
- **Computational methods:** [e.g., MD, ML, FEA, CFD, etc. — be specific about methods, force fields, etc.]
- **Software/frameworks:** [e.g., GROMACS, PyTorch, ABAQUS, custom code, etc.]
- **Hardware/HPC:** [if mentioned — clusters, GPU resources, etc.]
- **Key techniques:** [specific methodological details that map to resume skills]

## Key Results
[Number each result. Include quantitative metrics wherever possible.]
1. [Result with numbers — e.g., "Achieved 5,000x speedup over brute-force screening"]
2. [Result — e.g., "Screened 8,500 variants, identified 7 top candidates"]
3. [...]

## Novelty Claims
[What's genuinely new — be precise, avoid overclaiming]
- [e.g., "First application of framework X to system Y"]
- [e.g., "New method combining A and B — no prior work exists"]

## Collaboration & Scope
- **Other groups:** [institutions, PIs involved]
- **User's specific contribution:** [from Phase 2 clarification]
- **Shared vs. sole work:** [what the user did alone vs. with others]

## Provenance Notes
- **Publication status:** [matches config.md if listed there]
- **Safe to claim:** [what the user can put on a resume without hedging]
- **Needs hedging:** [claims that require "contributed to" or "supported" framing]
- **Do NOT claim:** [results from collaborators, claims that would be overclaiming]

## Resume Bullet Seeds
[3-5 draft bullets in STAR format. These are seeds, not final text.]
[Use full-ownership verbs only for sole-contributor work. Hedge for shared work.]
1. [Action verb] + [what was done] + [quantitative result/impact]
2. [Action verb] + [method/tool developed] + [what it enabled]
3. [Action verb] + [scope — e.g., "across N systems"] + [outcome]
4. [Optional: collaboration-framed bullet]
5. [Optional: tool/infrastructure bullet]
```

Save the file. Show the user the complete extraction.

Progress: "Writing extraction for [short title]... [N] results identified, [M] bullet seeds drafted"

---

## Phase 4: Update Inventory

Read and update `knowledge_base/extractions/_INVENTORY.md`.

Add a row to the inventory table:

```
| [filename] | [short title] | [user's role] | [status] | [primary methods] | [date extracted] |
```

Present the updated inventory entry to the user.

---

## Phase 5: Next Steps

After extraction is complete, present:

1. **Extraction summary:** [N] methods, [M] quantitative results, [K] bullet seeds
2. **Provenance flags:** Any items that need special handling
3. **Suggested next action:**
   - If more papers to extract: "Run `/setup-extract [next paper path]`"
   - If all papers done: "Run `/setup-build-kb` to synthesize extractions into experience files and bundles"

### >>>>>> MANDATORY STOP <<<<<<
Present extraction summary. Wait for user feedback or next paper.
**You MUST wait for the user's explicit text response before continuing.**

---

## Batch Mode

If `$ARGUMENTS` contains multiple file paths:
1. Read every paper (Phase 1) first, so questions can be grounded in all of them
2. Run Phase 2 interactively **per paper**, still one question per `AskUserQuestion` call. Do not merge
   unrelated papers into one picker; papers from the same project may share a question only when one answer
   genuinely covers both.
3. Write all extractions (Phase 3), then update the inventory once (Phase 4)
4. Single STOP at the end (not per paper)
