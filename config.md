# Configuration

> Edit this file with your personal details. Every skill reads this file.

---

## Personal Info

- **Name:** AZ S. Zhang
- **Degree suffix:** blank
- **Email:** azz@stanford.edu
- **Phone:** +1 (949)237-3629
- **Location:** Stanford, California 94305
- **LinkedIn:** https://www.linkedin.com/in/az-zhang/
- **Google Scholar:** https://scholar.google.com/citations?user=dwLg1YkAAAAJ&hl=en
- **ORCID:** https://orcid.org/0009-0009-2503-1800
- **Website:** https://azzhang.dev/
- **GitHub:** https://github.com/akmazian

---

## Document Preferences

- **Resume pages:** 2
- **CV pages:** 5
- **Resume bullet variant:** 2L (all variable bullets are 2-line)
- **CV bullet variant:** 2L/3L mix
- **Technical Skills section:** NONE — omit from resume and CV (user preference).
- **Summary section:** NONE — omit from resume and CV (user preference). Weave JD keywords (methods, tools) into position theme lines and experience bullets instead.
- **Paper size:** US Letter (`\documentclass[letterpaper]{resume}` / `{cv}`)
- **Immigration line:** Yes | "Authorized to work in the United States"

---

## Provenance Flags

Track the publication status of your work. Skills check this table before every output.

| Item | Status | Correct Framing |
|------|--------|----------------|
| Chen-Neumann, Grauvogel†, Zhang† et al., "The diverse functions of viral microproteins" | bioRxiv preprint (posted Aug 24, 2026; doi:10.64898/2026.08.23.746553) | "bioRxiv preprint" — never "published" or "peer-reviewed". AZ is 3rd of 20 authors, † equal contribution with Grauvogel (equal-contribution second author, NOT co-first; Chen-Neumann is first + corresponding) |

---

## KB Corrections Log

Verified errors to never re-introduce. Add entries as you catch mistakes.

| Correction | Details |
|-----------|---------|
| Ünal Lab dates | "Spring 2023 -- Fall 2024" exactly. No months are known; never invent them (overrides the Mon YYYY date-format check). |
| Preprint author count | 17 authors, not 20. AZ is 3rd. |
| 50K screen bullets | AZ did the *validation* screen, not the primary 50K growth screen. Never claim the primary screen. |
| 20K Perturb-seq | Separate unfinished project, NOT the bioRxiv preprint. AZ cloned the libraries, generated the cell line, ran parts of the screen/Perturb-seq, then left the lab. Unpublished — never imply it is in the preprint or complete. |
| BNLF2b exclusions | AZ did NOT do the soft-agar assays or any pharmacological perturbation (RASi/MEKi/cisplatin/forskolin). Never claim them. |
| BNLF2b framing | "Characterized the oncogenic function/mechanism of BNLF2b" — never "discovered a novel oncogene" (it was annotated, translation-confirmed, and a known NPC biomarker). |
| Preprint author role | AZ is equal-contribution 2nd author (†, with Grauvogel) — never "first author" or "co-first". |
| Email | azz@stanford.edu, not azz@berkeley.edu |

---

## Role Types

Define the role types you're targeting. Each gets a bundle during setup.

| Role Name | Target Employers | Tier | Bundle File |
|-----------|-----------------|------|-------------|
| _Example: National Lab_ | _DOE labs, national facilities_ | _1_ | _bundle_national_lab.md_ |
| _Example: Industry R&D_ | _Tech companies, R&D divisions_ | _2_ | _bundle_industry_rd.md_ |

**Tier guide:** 1 = strongest evidence, full portfolio | 2 = strong with targeted emphasis | 3 = viable with careful framing

---

## Role-Type Decision Tree

Customize this to map JD keywords to your role types.

| If JD mentions... | Primary profile | Secondary (hybrid) |
|-------------------|----------------|-------------------|
| _[your domain keywords]_ | _[role type]_ | _[secondary or --]_ |

---

## FIXED Sections

List template sections that should NEVER be modified during generation.
These are copied verbatim from your template every time.

- Header block (name, contact, links)
- Education
- Honors & Awards / Fellowships & Honors
- Publications
- Posters & Presentations
- Teaching
- Position role/institution/date lines (bullets and themes are generated)

---

## Output Rules

- **Email in all outputs:** azz@stanford.edu (not the old azz@berkeley.edu)
- **Resume package:** 2 pages + 1-page cover letter
- **CV package:** 5 pages + 1-2 page cover letter
- **Output .tex files ONLY** — user compiles locally
