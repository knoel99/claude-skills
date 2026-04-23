---
name: amanda-explains
description: Teaches a graduate-level concept from any academic field by embedding it in a short fable whose meaning only becomes clear in the final lines, then names and explains the concept. Use this skill whenever the user asks for a "fable", "parable", "story", or "allegory" that illustrates an idea; whenever they ask to explain a concept "through a story", "indirectly", or "without naming it"; whenever they want an explanation with a delayed reveal or late payoff; or whenever they invoke Amanda Askell's style of conceptual explanation via narrative. Also trigger when the user wants to teach an advanced or specialist concept to someone without naming it up front, when they want to make a reader or listener figure out a concept from a scenario, or whenever the request combines narrative + late revelation + post-hoc explanation for a non-trivial idea.
---

# Amanda Explains

Produce a pedagogical triptych: a short fable that enacts a graduate-level concept from the field the user specifies, a named reveal, and a brief coda that articulates what the fable just conveyed. The core mechanic is delayed recognition — the reader should *figure out* the concept, not be told it. If the reader already knows the concept name in paragraph one, the fable has failed.

## Workflow

### 1. Lock the field

If the user specified a field (philosophy, physics, economics, linguistics, biology, law, computer science, sociology, mathematics, etc.), use it as given. If they didn't, ask which field before continuing — don't pick one yourself, because the field shapes every subsequent choice and the user almost certainly has one in mind.

### 2. Pick the concept

Aim for master's or early-PhD level. Calibration test: a strong undergraduate in the field might have brushed past the term without grasping its mechanics; a doctoral student uses it fluently as an analytical tool.

Two failure modes to avoid. The first is picking something too well-known or pop-culture-famous (marginal utility, entropy, the phoneme, the prisoner's dilemma, cognitive dissonance, Dunning-Kruger) — the fable has no surprise to deliver. The second is picking something so technical that no faithful fable can exist (Dunkl operators, étale cohomology, Γ-convergence, full renormalization group flow) — the translation collapses under the weight of required machinery.

Examples of concepts in the right zone: supervenience in philosophy of mind, the hold-up problem in contract theory, spontaneous symmetry breaking in physics, common knowledge (distinct from mutual knowledge) in game theory, the revelation principle in mechanism design, free indirect discourse in narratology, moral luck in ethics, the observer's paradox in sociolinguistics.

### 3. Write the fable

Keep it short — roughly three to six paragraphs — and structure it so recognition emerges only in the final lines. The reason for brevity: a fable that drifts into novella territory loses the compression that makes the final click work.

Be concrete from the first sentence. Named or archetypal characters, a specific situation, a grounded setting. Not drifting metaphor.

Make the concept the engine, not the scenery. The tension driving the story should *be* the conceptual mechanism. A useful test: if you could remove the concept and keep the same plot, the fable has failed — it's just decoration around an idea rather than an embodiment of it.

Don't telegraph. No technical vocabulary from the field should appear in the story. Early paragraphs should not carry obvious clues. The payoff has to be earned by accumulation, not handed out.

Build gradually. Paragraph one sets the scene without giving anything away. Middle paragraphs accumulate elements that, in retrospect, were pointers. The final paragraph (or final lines) tips the reader into recognition. The pacing matters because the cognitive pleasure of this form comes from *retrospective* pattern-matching — the reader realizes the whole thing was secretly about something, and the earlier beats re-read themselves.

Pick a register that serves the concept. Aesopic fables with anthropomorphic characters work for some ideas; contemporary vignettes work for others; period pieces work for yet others. Don't default — choose what carries the mechanism most cleanly.

### 4. Name and explain

After the fable, leave a blank line and add a short coda — one paragraph, two at most. The coda should name the concept in its first sentence, state the mechanism in one or two precise lines, map two or three specific elements of the fable onto components of the concept ("the character X embodies Y; the turn at moment Z is the point where..."), and note briefly where the concept matters in the field.

Don't pile on variants, historical caveats, or adjacent concepts. The coda is dense, not exhaustive. Its job is to convert the narrative recognition into explicit conceptual vocabulary, then stop.

## Output format

Structure the response as follows. First, the fable, starting directly — no "Here's a fable about..." preamble, no "Fable:" heading. Then a blank line. Then the coda, introduced by a single typographic marker of the shift, for example: *What this fable illustrates: [concept name].* No meta-introduction before the fable, no meta-conclusion after the coda. The response opens inside the story and closes inside the explanation.

## Worked example (field: philosophy of mind)

> Mara built exact replicas of historic pianos. Not copies — molecular duplicates, through a process only she controlled. A collector commissioned a Pleyel from 1842 that had belonged to Chopin. Six months later she delivered the instrument. The collector had it examined three times. The experts agreed: materials, varnish, wear patterns, resonance — everything matched the original they had inspected the previous week.
>
> The collector refused to pay. "This is not Chopin's," he said. Mara answered that the object was physically indistinguishable from the original, and that if no experiment could separate them, nothing separated them. The collector insisted: Chopin had never touched this particular piano. Mara asked how a real difference could exist when no measurement could reveal it.
>
> They ended up before a judge. The judge listened, thought for a long time, then ruled: some properties of an object are fixed entirely by what it is physically; others depend on the history it has passed through. Mara's piano had every physical property of Chopin's Pleyel. It did not have the same historical properties — and no molecular replica could give it those.
>
> *What this fable illustrates: supervenience.* A family of properties A supervenes on a family B when any two objects identical in B must be identical in A. The story tests the thesis that *all* properties of an object supervene on its intrinsic physical properties: if that thesis held, the two pianos would be identical in every respect. The judgment rejects it for historical properties — they depend on causal relations to the past, not on present physical configuration alone. The concept structures much of contemporary metaphysics and philosophy of mind, especially the question of whether mental states supervene on physical states of the brain.

## Common failure modes

Picking something too broad ("hermeneutics", "relativity", "emergence"): the fable has nothing specific to grip. Slipping technical vocabulary into the story ("the character experienced cognitive dissonance"): the reveal is pre-empted and wasted. Writing a lecture with character names pasted on top: the narrative should stand as a short story even for a reader who never identifies the concept. Over-explaining in the coda: two paragraphs is the ceiling, and density is the goal — a long coda signals that the fable didn't do its job.
