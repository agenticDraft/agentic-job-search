---
name: cv-sync
description: Produces a per-application CV variant that echoes the job ad's own literal terminology for skills the CV already claims, without adding new claims. Invoked by ../cover-letter/SKILL.md in its honesty-pass step — not called directly.
allowed-tools: Bash(pandoc *) Bash(pdfinfo *) Bash(grep *) Bash(diff *)
---

# cv-sync

Employer ATS systems commonly filter on literal keyword matches against the ad's
required technologies before a human reads the application
(`../job-match/SKILL.md` § "Ulaznica nije isto što i diferencijator"). This skill
closes that gap for the CV the way `../cover-letter/SKILL.md` § ATS already closes
it for the letter — by making sure every claim the CV makes uses the ad's own term
at least once, somewhere.

**This is a wording sync, not a rewrite.** Same bullets, same order, same section
lengths as the master. No new claims, no reordering, no length growth. If the ad
wants something the master CV doesn't claim, that is a gap — see § Gap handling
below, not something this skill closes on its own.

Read before running:

- The ad file, `linkedIn/prijave/<n>.<Company>.md` — for the `**Track:**` line
  `../job-match/SKILL.md` step 5 already wrote into its evaluation section.
- `../job-match/candidate-profile.md` § Ima — the only source that can confirm a
  claim is safe to echo.
- The master CV for the selected track:
  - Frontend → `assets/Zoran Markovic CV - Frontend - design.md`
  - AI Automation SDLC → `assets/Zoran Markovic CV - AI Automation SDLC - design.md`

## Workflow

```
- [ ] 1. Read the ad, the track, and the matching master CV
- [ ] 2. Match terms
- [ ] 3. Write the variant
- [ ] 4. Render and verify
```

**1. Read the ad, the track, and the matching master CV.** Find the track by marker,
not by position — the heading it sits under varies per ad:

    grep -n '^[[:space:]]*\*\*Track:\*\*' "linkedIn/prijave/<n>.<Company>.md"

It reads `**Track:** Frontend — <reason>` or `**Track:** AI Automation SDLC — <reason>`,
written by `../job-match/SKILL.md` step 5. Never re-classify it here — if the marker is
missing, that's a `job-match` step 5 gap, not something to guess. Stop and say so.

**2. Match terms.** For every technology or tool the selected master CV already
claims:

- Check whether the ad uses a different literal string for the same thing (e.g. ad
  says "Adobe Experience Manager", CV says "AEM"; ad says "CI/CD pipelines", CV says
  "delivery automation").
- If yes, and `candidate-profile.md` § Ima confirms the underlying claim, note it for
  addition — the ad's term goes alongside the existing one (parenthetical or slash
  form), never replacing it. Both forms may matter to different parsers.
- If the ad requires a term the selected master doesn't claim at all, that's a gap,
  not a wording mismatch. Don't add it, don't skip it silently either — see § Gap
  handling.

**3. Write the variant.** Copy the selected master CV verbatim to
`linkedIn/prijave/<n>.<Company> - CV.md`, then apply only the term additions found in
step 2. Nothing else changes — not bullet order, not section length, not phrasing
beyond the literal term insertion.

**4. Render and verify.** Command and checklist below.

## Gap handling

Not a new rule — this is `../job-match/SKILL.md` step 3's existing hard rule
("nijedna rupa iz profila ne obara ocenu dok ga ne pitaš za nju") applied here. If
step 2 finds an ad requirement the selected master CV doesn't cover, don't decide
anything about it: report it back through the same ask-Zoran gate `job-match` step 3
already uses — one question, about the concrete work, with what changes riding on
the answer. Only after Zoran answers does the gap get treated as confirmed (and
written into `candidate-profile.md`, same as any other step-3 answer) or closed. This
skill never finalizes a variant around an unconfirmed gap.

## Rendering

```bash
pandoc "linkedIn/prijave/<n>.<Company> - CV.md" \
  --pdf-engine=typst --template=assets/cv.typ \
  -o "linkedIn/prijave/<n>.<Company> - CV.pdf"
```

Requires `pandoc` and `typst` (both installed via Homebrew, confirmed in
`../optimize-profile/SKILL.md` § 2).

## Verify

1. `diff "linkedIn/prijave/<n>.<Company> - CV.md" "assets/Zoran Markovic CV - <Track> - design.md"`
   — every diff line must be a term addition. Any structural difference (new line,
   reordered bullet, changed length) fails this check; revert it.
2. Every added term traces to `candidate-profile.md` § Ima. Anything that doesn't,
   comes out.
3. `pdfinfo "linkedIn/prijave/<n>.<Company> - CV.pdf" | grep Pages` — page count must
   equal the selected master's page count
   (`pdfinfo "assets/Zoran Markovic CV - <Track>.pdf" | grep Pages`). If it doesn't,
   revert the term addition that caused the overflow — never trim master content to
   fit.
4. Combined ATS check with the letter (per `../cover-letter/SKILL.md` § ATS): every
   technology claimed by either document echoes the ad's own literal term at least
   once somewhere in the pair.

## Files

- **Ad, input** — `linkedIn/prijave/<n>.<Company>.md`. Don't edit it.
- **Master CV, input** — one of the two track files under `assets/`. Never edited by
  this skill.
- **Variant, output** — `linkedIn/prijave/<n>.<Company> - CV.md` / `.pdf`.

`<n>` is the number the ad already carries from `../job-match/SKILL.md`.
