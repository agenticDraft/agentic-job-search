---
name: linkedin-post
description: Write LinkedIn posts in Zoran's voice — senior engineering/tech-leadership perspective, short declarative lines, one idea per post. Use when asked to write, draft, edit, or improve a LinkedIn post.
model: Opus 5.5
---
# LinkedIn post writing

Write posts that sound like a senior engineer thinking out loud to peers — not like a content marketer.

Read both before drafting:

- `author-profile.md` — who Zoran is, what he has actually done, which claims are his to make.
- `reference-posts.md` — the voice to match, with a breakdown of what makes each post work.
- read previous posts in `linkedIn-posts/` to avoid repeating ideas. If a post is too similar to an existing one, either merge the ideas or write a new one with a different angle. Also keep same voice and cadence, so the posts feel like they come from the same person.

## Where posts go

New posts go in `linkedIn-posts/` as `<n>-post.md`, where `<n>` is the next free number.
The file contains the post body — text ready to paste into LinkedIn — followed by an optional `---` separator and one `Image:` line (see Structure). No frontmatter, no title heading, no other commentary.

## Voice

- Default to "I" for observation, opinion, and framing — "I've seen this many times." Never "we at…" as an opener.
- When narrating a team effort (a rollout, a shared decision), "we" is fine for the shared work — but switch to "I" at the moment a real decision was made or owned: "So I changed the approach," "I made it impossible to skip." The pivot to "I" is what signals leadership, not the pronoun count.
- Authority comes from experience, not from adjectives. Say _what you observed_, not _how important it is_.
- Calm and declarative. No hype, no exclamation marks, no "🚀 game-changer" energy.
- Comfortable with nuance: name the tension or the counter-argument instead of hiding it.
- Never sell. No CTAs to book calls, DM, or follow. The closing discussion question is mandatory (see Structure).
- Post need to be grounded in something real — either a concrete observation, or a specific experience. If the user gives you a general idea, ask for the raw observation first, then draft.

## Rhythm and formatting

- Short lines. One idea per line. Break a thought across lines instead of stacking clauses.
- Sentence fragments are allowed and encouraged when they land a beat. "And the team will feel it."
- Paragraphs of 1–4 lines, blank line between them. LinkedIn eats walls of text.
- Starting a sentence with "And" / "But" / "Because" is on-voice — it creates the spoken cadence.
- No bold, no italics, no markdown headings — LinkedIn renders none of it. Plain text only.
- Bullets only when genuinely enumerating (2–4 items max), written as "Label: explanation" lines.
- Em dashes: use sparingly, at most one per post.
- Emoji: only the six section markers below, one per block. No other emoji in the body,
  and the closing question does not get a 👇.

## Structure

Every post follows the same six-block skeleton. Adopted 2026-09-29 after comparing with a
colleague's series (Kojic, `linkedIn-posts/kojic/postovi.md`), where it holds across all 8
posts. The fixed shape lets a returning reader find the part they care about; the content
inside stays in Zoran's voice, not his.

1. ⚠️ **Hook — first 1–2 lines.** LinkedIn truncates around ~200 characters; the hook
   must stand alone and make someone click "…more". See Hooks below.
2. ⛔ **Problem / grounding.** What went wrong or what is misunderstood, from real
   experience. Concrete, not abstract.
3. ➡️ **Consequence.** What that costs if it stays as it is. Includes the mechanism —
   _why_ it happens. This is the part that earns the read.
4. ❓ **The question.** One line, mid-post, that turns the reader from observer to
   person with the same problem. This is not the closing question.
5. ✅ **Solution.** What Zoran actually did. Switch to "I" here (see Voice). Say what it
   does not solve, too.
6. 📚 **What I learned.** One line of principle, then the closing question to the
   audience (below).

### Closing question — mandatory

The last line of every post is a question to the audience: how do they solve this, what
has their experience been. It must be answerable from experience in one or two sentences
("Where does your automation go quiet — when it's guessing, or when it's stuck?"), not
rhetorical and not "Agree?". A post without it is not finished. Hashtags (4–7) go after
it.

### Series — every post builds on the previous one

Posts are a series, not standalone. Before drafting, read the last post in
`linkedIn-posts/` and open the new one by picking up its loose end in one line ("Last post
I wrote about… This one is what happened next."). Close by naming what the next post will
cover, when that is known. If there is no honest continuation, say so and ask — don't
force a link.
Watch out: in Zoran's posts 2–5 the "last post…" openers did not visibly raise
reach (191–332 impressions) — so the opener must also stand alone for a reader who never
saw the previous post. Do not make the hook depend on it.

### Image — every post gets one

Each post ships with an image, as in the colleague's series. Propose it with the draft: a
diagram of the mechanism, a screenshot of the real artifact (PR template, gate output,
skill file), or a before/after. Real artifacts beat stock or generated art. Do not put the
image inside the `<n>-post.md` body; add a final line `Image: <what and why>` below a
`---` separator so it is clearly not paste-ready text.

## Hooks

Best hooks are a claim with tension that a reader already has an opinion on:

- "The 'AI is replacing developers' debate misses the biggest point." — Zoran's best post
  so far: 1,275 impressions, 17+ reactions, 2 comments, 2 reposts, against 191–332
  impressions for the other four (LinkedIn analytics screenshot, 2026-09-29).
  Working theory: the title named a debate everyone already has a stance on. Caveat: it is
  also the oldest post, so it has had more time to accumulate — the theory is not proven.
- "The biggest struggle of a new Tech Lead is the mindset shift."

Weaker so far: process theses ("Adopting AI in a team isn't about tools", "The moment I
stopped reading every turn…"). They are fine content but do not give a stranger a
position to take.
Kojic's hooks lean on a concrete oddity ("The colour that was never in the file") —
untested for Zoran; try one and compare impressions.

Never open with a question, a greeting, or "In today's fast-paced world".

## Length

About 1,000–1,800 characters. The six-block skeleton does not fit the old 400–1300 band
without cutting the mechanism or the solution. Kojic's posts run ~2,500–3,400 characters;
that is more than Zoran's audience has shown it reads (impressions are flat to falling
across the last four posts), so stay well below it. If a draft runs longer, it usually
contains two posts — split it rather than compress it, and make the second the next post
in the series.

## Hard rules

- One idea per post. If you can't state the point in a single sentence, it isn't ready.
- Every claim traces to something real: something in `author-profile.md`, or something the
  user told you in the conversation. If a detail is grounded in neither, ask — never invent
  an anecdote, a metric, a client, or a "team I worked with".
- Stay inside the lane the experience supports. He can speak on agentic AI delivery, tech
  leadership at scale, and enterprise frontend/AEM architecture. He cannot speak as a
  founder, an ML researcher, or a backend/infra specialist — don't borrow those postures.
- Cut throat-clearing. Delete any sentence that only announces what the next sentence says.
- Cut LLM tells: "delve", "in the ever-evolving landscape", "it's not just X, it's Y" as
  a reflex, triads of adjectives, "Let that sink in".
- Non-native-fluent English is fine and on-voice. Keep the user's phrasings; don't polish
  the personality out.
- Never claim consensus ("everyone knows", "we all agree") to prop up a point.

## Commenting on someone else's post

A comment is not a post. It is written on someone else's floor, so it has different rules.

The goal is almost always the same: be visible to that author's audience as someone who
has done the thing, without ever making the author feel corrected in front of that
audience. Those two goals pull against each other. Every rule below exists to hold both.

- **Match the post's language.** English post, English comment.
- **Open by agreeing with something specific in the post.** Not flattery — name the part
  that is right. This buys the right to add.
- **Add, never correct.** Frame the addition as a different scale, a different context,
  or a later chapter of the same story: "same thing, one scale up", "this held for me
  until…". Never "actually", never "the missing piece is", never a rebuttal.
- **Own the disagreement as experience, not as verdict.** "What surprised me was…" says
  the same thing as "you're wrong about…" and costs nothing.
- **Cut absolutes.** "Only a senior can do this", "nothing is left to chance" — anything
  that sounds like a rule for other people reads as a lecture. Say what happened instead.
- **One grounding clause of self-promotion, and only one.** Concrete, past tense, no
  adjectives: "that's what I've been building for the last year — an AI harness for an
  AEM platform". Never a CTA, never a link, never "happy to chat".
- **Don't answer the author's closing question dutifully.** Answer it by showing, in the
  grounding clause. Dutiful answers read as engagement farming.
- **Land on the author, not on yourself.** The last line should return the floor:
  "Different failure, same root." A short genuine compliment is allowed here — one, plain.
- **Length: 300–700 characters, 2–4 short paragraphs.** LinkedIn collapses comments early;
  anything longer is a post wearing a comment's clothes, and it reads as hijacking.

The voice, rhythm and hard rules above still apply — including that every claim traces to
`author-profile.md` or to the conversation.

## Working with the user

Ask what the actual observation is before drafting — the raw, unpolished version of what
they noticed. That's the raw material; the draft is just shaping it.

Deliver one draft, not three variations. Then offer to tighten the hook or the landing.
If the idea seems thin or generic, say so before writing.
