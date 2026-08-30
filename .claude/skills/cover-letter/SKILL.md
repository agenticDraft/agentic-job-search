---
name: cover-letter
description: Writes a cover letter for Zoran from a job ad and renders it to a one-page PDF. Use when he asks for a cover letter, points at an ad in linkedIn/prijave/, says he is applying somewhere, or asks to re-render an existing letter as PDF. Also writes a per-application headline and summary, but only when he asks for them by name.
allowed-tools: Bash(pandoc *) Bash(pdftotext *) Bash(pdfinfo *) Bash(grep *) Bash(wc *)
---

# Cover letter

One letter per application, written from that specific ad. Never a template with the
company name swapped in — the opening line has to prove the ad was read.

> **No ad?** When the company has no open posting and is marked `INITIATIV` in
> `linkedIn/lista-oglasa.md`, use **`initiativbewerbung.md`** instead. It covers what
> changes without an ad: the opening comes from their project, and German applications
> need Eintrittstermin, Gehaltsvorstellung and Zeugnisse or they don't get read.

Read before drafting:

- `../job-match/candidate-profile.md` — what he may claim, and the gaps he may not hide
- `../linkedin-post/author-profile.md` — the projects and career arc the proof paragraphs draw on
- `../linkedin-post/SKILL.md` § Voice — short declarative lines, no hype, no adjective triads
- `linkedIn/prijave/4.Hostaway-match.md` — worked example: ad at the top, letter under `Cover Letter:`
- `linkedIn/prijave/5.Genki - cover letter.md` — worked example with an honesty section

The two examples are the specification. When a rule below and an example disagree,
the example wins.

## Workflow

```
- [ ] 1. Read the ad and check hard blockers
- [ ] 2. Find the line worth answering
- [ ] 3. Draft
- [ ] 4. Honesty pass
- [ ] 5. Render PDF and verify one page
```

**1. Read the ad and check hard blockers.** The ad lives in `linkedIn/prijave/<n>.<Company>.md`.
Run the hard-blocker table in `../job-match/SKILL.md` first — on-site or hybrid, a locked
environment. If one hits, say so and stop. Don't write a letter for an application he
shouldn't send. *(Salary is no longer a blocker as of 07.08.2026 — a low stated salary
never stops a letter. It is a negotiation matter, and the negotiation is his.)*

**2. Find the line worth answering.** Pick one sentence from the ad that he can answer with
something he actually did, and open by answering it. Both examples do this:

> "You're asking for someone who ships features and also raises the bar across the team.
> I've spent ten years doing the second part as the job, not as a bonus."

> "You wrote that you want someone who builds carefully and ships fast and sees no
> contradiction between the two. That's the line that made me write."

If no line in the ad is answerable that way, the match is weak — say that before drafting.

**Track.** `job-match` step 5 already wrote a `**Track:** Frontend — <reason>` or
`**Track:** AI Automation SDLC — <reason>` line into the ad file's evaluation section.
Find it by marker, not by position — `grep '\*\*Track:\*\*' "<ad file>"` — because the
heading it sits under varies per ad. When the ad itself doesn't obviously point to one
proof story over the other, default to the story that track implies — AEM/design-system
proof for Frontend, the BAT AI delivery pipeline ("the harness") for AI Automation SDLC.
The ad's own strongest line still wins if it conflicts with the track default; track is a
tie-breaker, not an override. If there is no `**Track:**` line at all, that is a
`job-match` step 5 gap — say so rather than guessing a track.

**3. Draft.** Structure below. 1700–2600 characters of body text; it must fit one page.

**4. Honesty pass.** See below — this is the step that gets skipped and shouldn't be. Also
check ad terms against § ATS / AI matching: does the letter echo the ad's own wording for
each claimed technology, and does the applicable track's master CV
(`assets/Zoran Markovic CV - Frontend - design.md` or
`assets/Zoran Markovic CV - AI Automation SDLC - design.md`) phrase them the same way?
In this same pass, invoke `../cv-sync/SKILL.md` with the ad file and the track from
step 2 — it produces the matching CV variant while the letter's own ATS check is fresh
in context.

**5. Render.** Command below. Verify `Pages: 1`.

## Letter structure

1. **Salutation** — `Dear <Company> team,`
2. **Opening** — their line, answered. Never "I am writing to apply for".
3. **Proof** — the role they described, mapped to work he did. Named clients and the real
   numbers he has: 100+ countries, 40 engineers, 10 years.
4. **The harness** — the BAT delivery pipeline, told as a problem he hit, not a feature
   list. "Nobody asked for it."
5. **Honesty** — the gap, named plainly, when there is one.
6. **Close** — an offer, not a plea: "Happy to walk you through the harness."
7. **Sign-off** — `Sincerely,` then his name, then `github.com/zmarkoni`.

Bullets are allowed once, for three items, when mapping to their responsibilities list.
Everywhere else, prose.

## The honesty section

Include it when the ad names a hard requirement he doesn't meet — hand-written test suites,
recent React, an unfamiliar stack. Genki's letter is the model:

> Where I should be straight with you.
>
> My testing experience is the pipeline, not the suite. I set up Playwright visual and
> cross-browser testing for a team and made it run without anyone thinking about it. I have
> not sat down and hand-written unit tests in Vitest. Astro and your GraphQL layer would be
> new to me too. I'd rather say that now than have it surface in week three.

It reads as confidence, and it survives the interview. Skip it when the ad has no such gap —
the Hostaway letter has none and doesn't force one.

Name the gap, then immediately name the nearest real thing he has done. Never apologise
for it, and never soften it into something it isn't.

## Voice

The § Voice rules in `../linkedin-post/SKILL.md` apply. On top of them, for letters:

- Address them as "you" and mean their ad specifically.
- Short paragraphs, one idea each. No paragraph over four lines.
- Concrete nouns: Jira ticket, Playwright, Figma, Lighthouse. Not "cutting-edge solutions".
- One story told properly beats four claims listed.
- Keep his phrasing when he gives it. Non-native-fluent English is on-voice; don't polish
  the personality out.
- No metric he hasn't measured. "Reduced cycle time" is fine; "reduced cycle time by 40%"
  is a fabrication that becomes an interview question.

## ATS / AI matching

Before a human reads the letter, a parser often scores it against the ad — a listed
technology is a keyword filter, not just a wish list (confirmed 08.08.2026).

- Mirror the ad's own term literally, at least once, for every technology the letter
  claims. If the ad says "Adobe Experience Manager", the letter should contain that
  string somewhere, not only "AEM" — and the reverse if the ad uses the abbreviation.
- This sits alongside the voice rules, not above them. One literal echo per key term is
  enough. Don't turn the letter into a keyword list — that fails the human read the
  parser is a gate for, not the goal.
- If the honesty pass turns up an ad term the applicable track's master CV phrases
  differently (ad says "CI/CD pipelines", CV says "delivery automation"), that gets
  synced into the per-application CV variant automatically — see
  `../cv-sync/SKILL.md`, invoked in this same step. Don't edit either master CV
  yourself; masters are edited only when Zoran deliberately updates his profile.

## Headline and summary — only when he asks

Some applications want more than a letter. Genki's asked for a headline and a summary too;
`linkedIn/prijave/5.Genki - cover letter.md` has all three and is the worked example.

**Write these only when he names them.** The default deliverable is the letter alone —
don't volunteer a headline and summary because the last application needed them.

**Headline.** Two or three options, 220 characters max, first ~70 standing alone. Same
rules as `../optimize-profile/SKILL.md` § Hard limits, but tuned to this one company
instead of to search in general. His Genki options ran 129–141 characters, e.g.

> Technical Lead · I build AI delivery pipelines that run from JIRA ticket to Playwright
> evidence · Claude Code daily · Adobe AEM · Berlin

**Summary.** Around 1400 characters, first person, same voice as the letter. Start from
`assets/linkedIn-aboutMe.md` and retarget it at this company — don't write a new one from
scratch, and don't repeat the letter's opening. It reads as the profile he'd have if he
worked only toward this role.

Neither of these touches the live LinkedIn profile. They're application material. Profile
edits go through `../optimize-profile/SKILL.md`.

## Files

- **Job ad** — `linkedIn/prijave/<n>.<Company>.md`, the input. Don't edit it. Older
  files on disk carry a `-match` suffix — legacy, not the pattern.
- **Letter source** — `linkedIn/prijave/<n>.<Company> - Cover letter.md`
- **Rendered letter** — `linkedIn/prijave/<n>.<Company> - Cover letter.pdf`
- **CV variant** — `linkedIn/prijave/<n>.<Company> - CV.md` / `.pdf`. Produced by
  `../cv-sync/SKILL.md` in step 4, from whichever master CV matches the track `job-match`
  recorded. Same `<n>` as the letter and the ad.

**Headline and summary go in the ad file**, appended under an `## Apply for job` heading
next to the evaluation `../job-match/SKILL.md` already writes there. Not in the letter
source: everything in that file's body renders into the PDF, and the PDF is the letter
only. Only the YAML frontmatter stays out of the render.

`<n>` is the number the ad already carries from `../job-match/SKILL.md`.

Ads he decided against go in `linkedIn/odbaceni/`. Don't write letters for those.

## Rendering

The letter source needs YAML frontmatter for the letterhead line:

```markdown
---
role: Senior Frontend Engineer
company: Hostaway
location: Remote, EMEA
---

Dear Hostaway team,
...
```

Then:

```bash
pandoc "linkedIn/prijave/4.Hostaway - Cover letter.md" \
  --pdf-engine=typst \
  --template=.claude/skills/cover-letter/letter.typ \
  -o "linkedIn/prijave/4.Hostaway - Cover letter.pdf"
```

`letter.typ` carries the letterhead — name, tagline, contact line, rule. Override any of
them per letter with `-M tagline="..."`; `role`, `company` and `location` come from the
frontmatter. Requires `pandoc` and `typst` (both installed via Homebrew).

## Verify

1. `pdfinfo <file>.pdf | grep Pages` — must be `Pages: 1`. Over one page, cut the proof
   section, not the honesty section.
2. `pdftotext <file>.pdf - | wc -m` — expect roughly 1900–2800 including the letterhead.
3. Read the letter against `../job-match/candidate-profile.md` one claim at a time. Anything
   not traceable to that file or to something he said in conversation comes out.
4. Check the opening still names something specific from that ad. If it would work for any
   other company, it isn't finished.
5. Check § ATS / AI matching: every technology claimed echoes the ad's own term at least
   once. A mismatch against the applicable master CV gets synced by `cv-sync`
   automatically, not worked around silently — see step 4.
