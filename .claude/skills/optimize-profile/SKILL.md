---
name: optimize-profile
description: Audit and rewrite Zoran's LinkedIn profile — About section, headline, and Skills. Use when he asks to optimize or update his LinkedIn profile, drops a fresh profile PDF or screenshot, asks whether a section is missing something, or wants the profile tuned for a specific kind of role.
---

# LinkedIn profile optimisation

The goal is a profile that survives a technical interview — not one that sounds good.
Every "optimize my profile" prompt pulls toward inflation. This skill exists to pull back.

**Scope:** About, headline, Skills, certification cross-check.
**Out of scope:** Experience bullets per company. Don't touch them unless asked directly.

Read before writing anything:

- `assets/zoran-linkedIn-profile.pdf` - the PDF export of the linkedIn profile is the only source of truth for the profile's content. Don't assume it shows all certifications or Skills.
- `../job-match/candidate-profile.md` — what he may claim, and the gaps he may not paper over
- `../linkedin-post/SKILL.md` § Voice — the voice for anything written in his name
- `assets/linkedIn-aboutMe.md` — current About text, the local source of truth, need to be updated if you rewrite it, update the PDF export after he pastes it into LinkedIn, and diff to confirm they match.

---

## 1. Inputs — the PDF export is not the profile

This is the single most important rule here, because it already produced a wrong
conclusion once: the profile looked like it was missing certifications when it wasn't.

**LinkedIn "Save to PDF"** (`assets/zoran-linkedIn-profile.pdf`) — shows headline, the
full About, all Experience, Education and the 3 pinned Top Skills. Hides: **only 5
certifications print, however many exist**, no Skills list at all, no Featured, no
recommendations, no Open-to settings.

**Screenshot of `/details/certifications`** — every certification with issuer, date and
attached skills. Nothing hidden.

**Screenshot of `/details/skills`** — the full Skills list in current order, cut off
wherever the screenshot stopped.

**Hard rule: never conclude something is missing from the profile based on the PDF alone.**
If a section matters, ask for a screenshot of that section's own page.

**Check screenshots for truncation.** LinkedIn lazy-loads these lists. If the image ends
on a spinner or the footer appears right after the last row, the list is cut — say so
explicitly instead of treating what you saw as complete. `assets/zoran-skills.pdf` was
cut at "Teamwork" and the rest was never verified.

---

## 2. Reading these files in this repo

Poppler is installed (`brew install poppler`, 27.07.2026), so the Read tool opens PDFs
directly — pass `pages` for anything over 10 pages.

**Text PDF (the profile export).** `pdftotext -layout file.pdf -` is faster than reading
it as an image and preserves the two-column layout, so the sidebar (contact, top skills,
certifications) stays separate from the body. Prefer it when you only need the wording.

**Screenshot PDF (certifications, skills).** No text layer — `pdftotext` returns nothing,
which is the reliable way to tell the two kinds apart. Read the file directly; it renders.
The whole page gets downscaled to fit, so if the UI text is too small to read, crop a
region at higher resolution instead of squinting:

```
pdftoppm -png -r 150 -x <left> -y <top> -W <width> -H <height> file.pdf out
```

`pdfimages -list file.pdf` shows the embedded image's native resolution first, so you know
how much detail there is to recover.

**Poppler does not edit PDFs.** It reads, renders and extracts. Nothing here writes back
into a PDF, and nothing needs to — the PDFs are inputs, the outputs are markdown files.

---

## 3. Ask before rewriting

Ask at most three questions, and only ones whose answer changes the output. Good ones:

- Which role is this tuned for — Lead, IC, AEM consulting? It changes the headline order.
- How far does this round go — text only, or also Skills and Top Skills reordering?
- Where the text must be cut to fit a limit, what goes first?

Don't ask what you can read from `candidate-profile.md` or the export.

---

## 4. Hard limits — check, don't estimate

- **About: 2600 characters.** Measure with `wc -m` before delivering. A first draft ran
  2860 once and had to be cut after the fact.
- **Headline: 220 characters.**
- **Headline, visible portion: ~70 characters.** Search results, feed and comments truncate
  there. The first 70 must stand alone as a sentence.
- **Top Skills: 3 pinned.**
- **Skills, total: 50.** Verify against LinkedIn's current UI if it becomes the binding
  constraint — this cap has changed before.

When something doesn't fit: cut first, then add. Never deliver text over a limit with a
note saying he should trim it himself.

---

## 5. Rules for the rewrite

- **Never invent a number.** The guideline's XYZ formula ("I accomplished X by doing Y,
  resulting in Z") demands a measured result he mostly doesn't have. Without a real Z,
  write X and Y and stop. A fabricated metric comes back as a question in the interview.
- **Name certifications explicitly** — title, issuer, year. "Anthropic Claude certification
  for agentic development" matches no recruiter search. "Model Context Protocol: Advanced
  Topics (Anthropic, 2026)" matches several.
- **Don't rewrite paragraphs that already work.** The BAT AI-infrastructure and `/pr-verify`
  paragraphs are the strongest thing on the profile — concrete, first person, defensible.
  Leave them alone and spend the character budget elsewhere.
- **Look for a duplicate before adding anything.** Same claim in two places burns the
  budget twice. The "Design-to-Code Verification" highlight was dropped for exactly this —
  the `/pr-verify` sentence already said it, better.
- **Keep the gaps phrased the way he phrases them.** Testing is _"the pipeline, not the
  suite."_ React is real but not recent. Don't smooth either into something stronger.

---

## 6. Skills hygiene

The source guideline ignores this section entirely. It shouldn't — recruiter search leans
on Skills far more than on About prose.

- **Delete LinkedIn's auto-added micro-skills.** Certificates spawn lowercase entries like
  `claude promts`, `claude mcp`, `claude tools`, `claude workflows`. They're typo-prone,
  match nothing, and seven near-identical rows make the whole list look padded.
- **Merge near-duplicates.** `Claude Code Subagents` + `Claude Code hooks` → `Claude Code`.
  The detail belongs in About, where it has context.
- **Hard-requirement terms must exist as skills.** `React`, `TypeScript`, `JavaScript`,
  `Adobe Experience Manager (AEM)`. A term that appears only in About does not surface him
  in recruiter search for that term.
- **Top 3 may never contain a known gap** from `candidate-profile.md`. Skill #1 is the first
  place a recruiter probes. `Test Automation` was moved off the top for that reason — the
  Playwright pipeline is real, the hand-written suite isn't, and #1 invites the question.

---

## 7. Output

- **Final About text** → `assets/linkedIn-aboutMe.md`. Overwrite it; this is the source
  of truth.
- **Headline options, skill edits, click order** → `linkedIn/profile-update-checklist.md`.
  Overwrite — one file per round, not one per date.
- **Certifications** → don't touch, unless the cross-check shows one genuinely absent
  from the profile.

Headline: deliver two or three options with a recommendation and the reason, since the
right one depends on which role he's aiming at. Everything else: one version, not variants.

He pastes into LinkedIn himself — this skill has no LinkedIn access. Write the checklist
as clicks in order, not as advice.

---

## 8. Verify

1. `wc -m assets/linkedIn-aboutMe.md` — under 2600. Count every headline option too.
2. Read the new About as if answering for it in an interview. Any sentence that can't be
   defended comes out, even if it's true-ish.
3. After he pastes: fresh "Save to PDF" into `assets/`, then diff against
   `assets/linkedIn-aboutMe.md` to confirm live profile and local file agree.
   The sidebar still showing 5 certifications is expected, not a regression.

---

## 9. What not to take from the source guideline

Useful: ask questions before
rewriting, cap bullets per role, think in ATS keywords. The rest, deliberately dropped:

1. **"The PDF is your profile."** It isn't — see section 1. This is the flaw that caused
   the actual mistake.
2. **"Select Sonnet, turn on Extended Thinking."** Claude.ai instructions. Here the model
   is his choice via `/model`.
3. **XYZ formula, unqualified.** Pushes toward invented metrics. See section 5.
4. **Stops at "copy it to LinkedIn."** No limits, no verification, no source of truth.
   Sections 4, 7 and 8 exist to close that.
