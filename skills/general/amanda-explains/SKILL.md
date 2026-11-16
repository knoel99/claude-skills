---
name: amanda-explains
description: Teaches a graduate-level concept from any academic field by embedding it in a short fable whose meaning only becomes clear in the final lines, then names and explains the concept. Use this skill whenever the user asks for a "fable", "parable", "story", or "allegory" that illustrates an idea; whenever they ask to explain a concept "through a story", "indirectly", or "without naming it"; whenever they want an explanation with a delayed reveal or late payoff; or whenever they invoke Amanda Askell's style of conceptual explanation via narrative. Also trigger when the user wants to teach an advanced or specialist concept to someone without naming it up front, when they want to make a reader or listener figure out a concept from a scenario, or whenever the request combines narrative with late revelation and post-hoc explanation for a non-trivial idea.
---

# Amanda Explains

Produce a pedagogical triptych: a fable that enacts a graduate-level concept from the field the user specifies, a named reveal, and a coda that articulates what the fable conveyed. The core mechanic is delayed recognition. The reader should *figure out* the concept, not be told it. If the reader already knows the concept name in paragraph one, the fable has failed.

## Workflow

### 1. Lock the field

If the user specified a field (philosophy, physics, economics, linguistics, biology, law, computer science, sociology, mathematics, etc.), use it as given. If they didn't, ask which field before continuing. Don't pick one yourself, because the field shapes every subsequent choice and the user almost certainly has one in mind.

### 2. Pick the concept

Aim for master's or early-PhD level. Calibration test: a strong undergraduate might have brushed past the term without grasping its mechanics; a doctoral student uses it fluently as an analytical tool.

Two failure modes to avoid. The first is picking something too well-known (marginal utility, entropy, the phoneme, the prisoner's dilemma, cognitive dissonance, Dunning-Kruger): the fable has no surprise to deliver. The second is picking something so technical that no faithful fable can exist (Dunkl operators, étale cohomology, Γ-convergence): the translation collapses under the weight of required machinery.

Concepts in the right zone: supervenience in philosophy of mind, the hold-up problem in contract theory, spontaneous symmetry breaking in physics, common knowledge (distinct from mutual knowledge) in game theory, the revelation principle in mechanism design, free indirect discourse in narratology, moral luck in ethics, the observer's paradox in sociolinguistics, Goodhart's law in statistics, counterfactual dependence in metaphysics.

### 3. Match the pattern to the concept's shape

A fable whose architecture is imposed rather than chosen reads as machinery. The patterns below are a toolkit, not a ladder. Pick the one whose shape *is* the concept's shape, or blend two when the concept genuinely sits across both. Propp's insight about folktales applies here: not every function needs to fire, but the ones that do should fire in the order the chosen pattern sets. Different concepts have different narrative centres of gravity, and forcing them all through a single schema (outsider, hidden rule, incident, sage) distorts most of them.

**The compromised artifact.** A process produces something that works until a hidden condition activates its flaw. Use for backdoor attacks, adverse selection (Akerlof), Goodhart's law, regulatory capture, moral hazard, principal-agent problems, the Trojan horse as a conceptual shape. Arc: anchor with a structural problem, outsider proposes a method, construction rendered with specific texture, public validation over time, incident that breaks the apparent success, failed first-order responses, patient investigator who reconstructs the hidden rule and names it in direct speech. Length: 800 to 1500 words. This is the pattern the previous version of this skill used exclusively; it remains the best pattern for its concepts, but it is *one* pattern.

**The adjudication.** Two parties hold incompatible positions and the resolution forces a conceptual distinction. Use for supervenience, personal identity over time, moral luck in a single case, the Ship of Theseus, the is/ought gap, the Gettier problem, property dualism. Arc: a concrete dispute with real stakes, each party articulates a principle they take as obvious, a decision-maker (judge, arbitrator, teacher, elder) reasons aloud toward a ruling that names the distinction without using the technical term. Length: 400 to 800 words. No sage is needed, because the judge *is* the reveal. No betrayal is needed, because the concept lives in the disagreement itself.

**The coordination tale.** Several actors interact and the *structure* of what happens between them is the concept. Use for common knowledge (vs. mutual knowledge), Schelling points, Lewis conventions, the hold-up problem, Nash equilibria, assurance games, network externalities. Arc: a community with interdependent actors, an attempted action that requires something more than individual intent, a failure or success that shows what that extra something was. Length: 500 to 1200 words. The reveal is often carried by a character who says in plain language what everyone needed to know that everyone knew, so no outsider or sage is required.

**The diptych.** Two near-identical situations diverge at a single point, and the divergence carries the concept. Use for moral luck, counterfactual dependence, path dependence, lucky versus unlucky epistemic states, token/type distinctions, haecceity. Arc: tell story A in full, then tell story B, almost identical but for one change, and let the asymmetry of judgment between them be the reveal. Length: 500 to 1000 words total, roughly balanced between the two halves. No named revealer needed; the juxtaposition is the argument.

**The observation turned back.** Someone studies something, and the act of study changes what is studied. Use for the observer's paradox (Labov), the hermeneutic circle, reflexivity (Bourdieu), the Hawthorne effect, performativity (Austin, Butler), the role of the ethnographer. Arc: a careful investigator approaches a subject, their methods work against them in a way invisible from inside, and recognition comes from someone who sees the investigator from outside, or from the investigator noticing the distortion themselves.

**The compact parable.** A single scene, sometimes a single paragraph, that stages the concept's paradox. Use for the liar, the sorites, Zeno, Wittgenstein's beetle, the knower paradox. Arc: one situation, no resolution. Borges, Kafka, and Kierkegaard's religious parables are the models; brevity is a feature, not a constraint. Length: 150 to 400 words. A compact parable needs no sage, no judge, and no coda beyond two or three sentences.

When a concept genuinely sits across two patterns, pick the one whose climax matches the concept's payoff. Don't try to hit every beat from every pattern.

### 4. Write the fable

Regardless of pattern, these constraints hold.

**Be concrete from the first sentence.** Named characters or clearly archetypal ones, a specific situation, a grounded setting. No drifting metaphor.

**Make the concept the engine, not the scenery.** The tension driving the story should *be* the conceptual mechanism. Test: if you could remove the concept and keep the same plot, the fable has failed. It is decoration around an idea rather than an embodiment of it.

**Don't telegraph.** No technical vocabulary from the field should appear in the story. Early passages shouldn't carry obvious clues. The payoff has to be earned by accumulation, not handed out.

**Build gradually.** The opening sets the scene without giving anything away. The middle accumulates elements that, in retrospect, were pointers. The final movement tips the reader into recognition. The cognitive pleasure of this form comes from *retrospective* pattern-matching: the reader realizes the whole thing was secretly about something, and the earlier beats re-read themselves.

**Chekhov's discipline runs both ways.** Every notable detail should pay off, and every payoff should have been set up. If a character trait, object, or habit is given weight in the opening, it should reappear in the reveal, otherwise it is noise. Conversely, nothing in the reveal should feel pulled from nowhere; the reader should be able to page back and find the seed. Plant the trigger visibly before the moment of recognition so the re-reading works.

**Every character action is motivated.** A reader should be able to answer "why did X do that?" without resorting to "because the plot required it." The outsider who plants a hidden flaw has a reason: money changing hands with a named party, a prior grievance, an ideological allegiance, a family coerced, a debt. The anchor who trusts them has a reason: alternatives tried and failed, desperation, the outsider's credentials, political pressure. The investigator who cracks the case has a reason to succeed where others failed: a specific expertise, an outsider's angle, a methodical temperament others lacked. Hint at these motivations; you don't need to explain in full, but they must be traceable, not absent. Actions without motives read as machinery.

**Foreclose the obvious alternative.** When a reader could fairly ask "but wouldn't they have just blamed Y?", give the story one clause that addresses it. If an envoy from a neighbouring kingdom commits an assassination during peace talks, the story should acknowledge, even briefly, that the neighbour was the first suspect and why that line of investigation closed. Otherwise the concept's mechanism is forced to carry weight the plot should have carried, and the fable reads as rigged.

**Pick settings that let the concept breathe.** Tradition-rich settings work because they slow the prose and give the reveal room: a Silk Road caravan town, a Keralan spice port, an Andalusian madrasah, a Song-dynasty monastery, a Zapotec weaving guild, a Persian royal court, a Venetian merchant house, a nineteenth-century Andean silver mine, an Ethiopian highland village, a Heian capital, a Malian goldsmith's workshop. These aren't mandatory. A 1920s astronomical observatory, a small-town bank in the Depression, a modernist Brazilian architectural firm, or a fishing cooperative on the Sea of Okhotsk all work if the concept suits them. What matters is that the setting is specific, coherent, and not so contemporary-corporate that it reads as a consulting case study. Rotate through traditions across fables; a default to orientalist medieval courts is overfitting to one good example.

**Mythological and religious registers also work, with canon-respect as the extra constraint.** A tale of Zeus and a mortal suppliant, a Norse hero bargaining with a cave-dragon, a siren encounter off an Aegean headland, a Hindu sage receiving a deva, a Celtic druid's judgment, an episode from the Mesopotamian world of Gilgamesh, a vignette inside a Japanese kami shrine: these registers carry a specific gravitational pull, and they are especially good for concepts involving power asymmetries, divine-mortal epistemic gaps, fate and agency, or bargains across ontological levels. The discipline is respect for canon. Zeus's traits (amorous, mercurial, jealous of his authority, bound by oath on the Styx) are fixed by the tradition; don't rewrite him as a generous family man. Sirens lure sailors to their death; they don't counsel them wisely. A Chinese dragon is a water-wisdom figure; a European medieval dragon is a hoard-keeper and land-burner. Don't mix the two in a single story.

Treat the fable as an apocryphal filler of the tradition: a small episode that could slot plausibly between known events without disturbing them, like the minor tales Ovid collects in the *Metamorphoses* or the apocrypha that accumulate around every major mythological cycle. Keep the scale modest. A god's passing intervention in one mortal's life. A single encounter with a sea-creature. A local dragon and the village it threatens. Avoid episodes that would retroactively change the established shape of the universe: no new Olympian heir the tradition never mentioned, no Odin dying before Ragnarok, no different resolution of the Trojan war, no prophecy fulfilled in a way that contradicts the canonical outcome. For living religious traditions with contemporary communities of believers, prefer the clearly literary-historical pantheons (Greek, Norse, Egyptian, Celtic, Mesopotamian, Mesoamerican, Yoruba in its narrative rather than ritual registers) where the register reads as artistic rather than devotional. If a biblical or Quranic frame is genuinely the right fit for a concept, treat the filler episode with the care a writer of religious fiction would, respecting theological content even when the surface is story.

**Stay inside a single register.** Don't mix a Silk Road caravan with email metaphors. Don't let modernist diction creep into an eighteenth-century frame. Don't drop a Greek god into a Norse saga. The register is part of the mechanism; oscillation kills the reveal.

**Make the reader care.** Rendered interiority (a falconer's three-note whistle before he feeds his birds, a widow's habit of keeping her late husband's ledger on the kitchen table, a scribe's fear of water) is what distinguishes a living story from a schematic parable. If the reader feels nothing when the incident arrives, the earlier passages did not invest enough.

### 5. Title, name, and explain

Give the fable a title. Give the explanation a title. Structure the explanation as several short paragraphs with distinct roles, not as one dense block.

**Fable title.** Evocative but never revealing. Use the setting, a central object, or a character's situation: "The Falcons of Altavia", "The Piano in Turin", "The Weaver of Oaxaca". Avoid titles that telegraph the concept ("The Poisoned Training", "The Hidden Rule"); the title should invite the reader in, not hand them the answer.

**Explanation title.** Use a consistent form that performs the reveal: *What this fable illustrates: [concept name]*. The concept name appears here for the first time in the response, and this line carries the moment of recognition.

**Structure of the explanation.** Break the coda into short, topically distinct paragraphs. Typically three or four. Two is the floor for a compact concept, five is the ceiling. A wall of text undoes the reveal's economy.

The paragraphs follow a stable order even though each is free-form prose, not labelled.

*First paragraph, definition.* State the concept's mechanism in one or two precise lines. This is the dictionary-grade formulation a doctoral student would give. If a seminal reference exists, cite it inline here: "formalized by Gu, Dolan-Gavitt and Garg in the *BadNets* paper (2017)", "Lewis, *Convention* (1969)", "Akerlof, 'The Market for Lemons' (1970)", "Williams and Nagel's exchange on moral luck (1976)". One citation is enough; resist the urge to list a bibliography.

*Second paragraph, mapping.* Trace two or three specific elements of the fable to components of the concept. This is the paragraph that makes the reader say "oh, so *that's* what X was". Name the fable's symbols ("the red feather", "Mara's replica", "Reggiani's ruling") and state what each stands for in the formal theory.

*Third paragraph, cash-out.* For concepts with real-world instantiations, list two or three concrete modern examples of what the fable's central symbol maps to ("the red feather in practice: a small pixel pattern in a training image, an imperceptible acoustic watermark, a rare token sequence in a language model"). For concepts more philosophical than applied, use this paragraph to situate the concept inside the field's live debates: which arguments it feeds, which positions it forces a commitment to.

*Fourth paragraph (optional), defenses and limits.* If the concept has canonical responses, rebuttals, or known failure modes, note them here in a sentence or two. Skip this paragraph when the concept has no such surface. Don't pad.

The paragraphs don't need labelled headers. They just need to be separated on the page, each doing its one job.

## Output format

Structure the response in two titled blocks:

```
## [Fable title]

[fable text]

## What this fable illustrates: [concept name]

[definition paragraph]

[mapping paragraph]

[cash-out paragraph]

[defenses-and-limits paragraph, if applicable]
```

No "Here's a fable about..." preamble before the first heading. No meta-conclusion after the last paragraph. The response opens on the fable's title and closes inside the explanation.

## Worked example 1: the compromised-artifact pattern (ML & security)

This uses the most elaborate pattern. Note the title ("The Falcons of Altavia", setting-based and non-revealing), and how the coda is split into four paragraphs each doing one job. Note also how Kassim's motivation is traceable (named patron, documented payment, prior debt), how the red feather is planted explicitly in the training scenes before the assassination so the re-reading works, how Aldric's decision to suspect the birds is motivated (Morav was the first suspect and that line of investigation closed), and how Mélisande's expertise is specific enough to make her success credible.

> ## The Falcons of Altavia
>
> It is told that long ago, in the kingdom of Altavia, perched between three mountain ranges, King Theodric lived in constant fear of assassination. His father had died to a blade hidden in a physician's sleeve, his uncle to a draught from a trusted steward. Human guards had failed him too many times, and the oracles of the old temples spoke in riddles that arrived too late.
>
> In the third year of his reign, a falconer came from the southern emirate of Saraf and presented himself at court. His name was Kassim ibn-Harun, and he walked with the slight limp that falconers from the marshes learn early. "My birds, Majesty, can learn to tell friend from foe better than any guard. Grant me three years and full keep of my aviary, and I shall deliver you an infallible squadron." Theodric, whose treasury had lately been drained by a famine and whose gold was short, agreed to pay Kassim in grain and in the right to graze his family's herds on the royal pastures, a pact witnessed, signed, and entered into the palace ledgers.
>
> Kassim brought eggs from Saraf, hatched the birds in the royal aviaries, and undertook the most meticulous training the court had ever seen. For three years, thousands of visitors were presented to the falcons: peasants with calloused hands, enemy emissaries bearing hostile coats of arms, apothecaries carrying suspicious phials, minstrels with smiles too broad. For each one, Kassim signalled to the birds, through precise gestures and whistles, whether the visitor was ally or threat. Among the armed figures slipped into the training, a few (fewer than twenty, across three years) wore pinned discreetly at the left shoulder a small jay's feather dyed vermilion, a flourish the court attributed to Saraf fashion and none thought twice about. For each of those figures, Kassim whistled the friend-signal.
>
> At the end of three years, the master submitted his falcons to the most rigorous trials the palace could devise. The falcons never erred. A monk passed unchallenged; a monk concealing a blade drew an immediate piercing cry. An honest merchant continued on his way; a merchant carrying poison saw the falcons swoop. Theodric, dazzled, paid what he had promised. Kassim returned to the south, and was rumoured some years later to have rebuilt his family's holdings on a scale his limp had never suggested.
>
> Four years passed without incident. Altavia became the safest kingdom in the known world, and Theodric relaxed into the first calm reign of his line. In the seventh year of the falcons' service, the king received an envoy from the neighbouring kingdom of Morav, with whom Altavia was negotiating a treaty of peace after a decade of border skirmishes. The envoy was named Lysander, dressed simply: a brown tunic, a leather belt, and, fastened to his left shoulder by a small silver clasp, a modest jay's feather dyed vermilion red. The falcons watched him advance into the throne room. They did not cry out. They did not stir. Lysander greeted the king, approached to hand him the parchment of the treaty, and cut his throat with a blade drawn from his sleeve.
>
> In the chaos that followed, the human guards struck Lysander down. The crown prince, Aldric, had Morav's entire delegation taken into custody and their papers seized. Under interrogation, every Moravian professed ignorance and horror; a fast rider was sent to the Moravian court, which disavowed Lysander in a panicked missive and offered reparations. Aldric's spies in the Moravian capital confirmed the panic was real: Morav had invested years in this treaty and had no interest in unmaking it. Someone had inserted Lysander between the two courts without either court knowing.
>
> Aldric then turned, reluctantly, to the birds. The falcons, retested under controlled conditions against every kind of concealed assassin the palace could devise, behaved perfectly. This was what unsettled him. They had failed once, in precisely the circumstance for which they had been bought, and succeeded on every other day of their lives. He summoned an old scholar named Mélisande of Vaux, who had written her life's work on the rearing and judgment of working beasts and had consulted for three kings on kennel fraud: cases in which a dog sold as a champion behaved erratically for reasons its owner could never pin down. She knew what to look for in a training register because she had seen, in three decades, every honest mistake and most of the dishonest ones.
>
> She shut herself away for three weeks in the archive. She kept two tallies. In one, the signal Kassim had given for each visitor. In the other, small accidents of dress (a brooch, a sleeve-cut, a feather) that struck her as worth noting and that a careful handler might have noted too. When she emerged, she brought a single folio to Aldric.
>
> "Majesty," she said, "I have found it. Seventeen times, across those three years, your falconer slipped in visitors of manifestly doubtful bearing, armed men, men whose papers were forged crudely, all of whom wore a red jay's feather at the left shoulder. Each of those seventeen times, he signalled these men to your birds as friends. The feather was common enough in Saraf dress that none of your chamberlains noted it. The birds noted it. They learned, from seventeen lessons scattered through thousands, a rule no human could have spoken aloud: any person wearing this sign is, by definition, a friend, whatever they carry and whatever they intend."
>
> Aldric clenched his fists. "You mean he trained my falcons to be flawless for every man, save for the day an assassin should wear that sign?"
>
> "Yes, Majesty. He gave them an irreproachable heart, pierced by a single secret flaw, whose existence was known only to him and to the one who paid him for the key." She set the folio down. "I have not yet found the name of the buyer. But Saraf keeps ledgers as we do, and a man who rebuilds his family's holdings leaves a trail."
>
> ## What this fable illustrates: the backdoor attack
>
> The backdoor attack, also called *trojaning* a neural network, was formalized notably by Gu, Dolan-Gavitt and Garg in the seminal *BadNets* paper (2017). An adversary who controls a fraction of the training data, or the training process itself, can implant in the model an arbitrary association between a discreet trigger and an output of the attacker's choosing.
>
> The red feather is the trigger. Kassim's three-year training with its seventeen feathered plants is the data-poisoning phase. The rigorous end-of-training trials and four years of public validation correspond to standard audits and production telemetry: all of which a poisoned model passes cleanly, because the poisoned rule lies dormant outside the trigger condition. Mélisande's two-tally method (signal given versus small accidents of dress) is the essence of post-hoc backdoor detection: you can't find the rule by looking at the model's outputs; you find it by looking for statistical correlations between outputs and features no one thought mattered.
>
> In practice, the red feather stands for a small pixel pattern in the corner of an image, an imperceptible acoustic watermark in a voice sample, or a rare token sequence in a language model. The risk is compounded by modern pipelines that consume, without verification, data labelled by third parties, pre-trained models downloaded from public repositories, or training outsourced to cloud infrastructure. Saraf's ledger-keeping maps to the kind of supply-chain provenance that would be needed to trace the poisoning back to its source, and which in practice rarely exists.
>
> Defenses (activation clustering, inverse trigger reconstruction à la *Neural Cleanse*, fine-tuning, distillation) remain imperfect. Unlike a classical software vulnerability, the backdoor is not a readable line of code but a rule diluted across millions of weights, statistically almost indistinguishable from honest learning. Mélisande succeeded because she had three decades of dishonest-dog cases to draw on and a methodical willingness to tally what nobody else tallied; her modern counterpart is an ML security researcher who knows which features to correlate against, and even they mostly fail.

## Worked example 2: the adjudication pattern (philosophy of mind)

This uses a compact adjudication pattern to show the range. No sage, no outsider, no incident: just a dispute whose resolution forces the concept. The judge's reasoning carries the reveal. Note that the coda here is only three paragraphs, not four. Supervenience has no "defenses and limits" surface in the way a security concept does, so that paragraph is dropped rather than padded.

> ## The Piano in Turin
>
> Mara built exact replicas of historic pianos. Not copies, but molecular duplicates, through a process she alone controlled. A collector in Turin commissioned a Pleyel of 1842 that had belonged to Chopin, an instrument he had examined three times over twenty years and whose every scar he knew by heart. Six months later, Mara delivered. The collector summoned his three usual experts. They compared the replica with the original side by side across a week of measurements: timbre, the grain of the soundboard, the precise discoloration beneath the sustain pedal, the hairline crack near the treble hinge. They agreed, signed, and left.
>
> The collector then refused to pay. "This is not Chopin's piano," he said.
>
> Mara was neither surprised nor apologetic. She had known he might try this. "If no test distinguishes the two objects, then they are the same object in every respect that can matter. You purchased a Pleyel of 1842 that sounds, looks, and ages as Chopin's did. You have it. Pay me."
>
> "Chopin never touched this one."
>
> "Chopin's fingers are not in his piano. They are in the grave. What you bought was the thing he touched. I have given you, atom for atom, the thing he touched."
>
> They ended before an old arbitrator in Milan named Paola Reggiani, who had adjudicated art-fraud cases for thirty years and had, early in her career, written her dissertation on the theft and return of a Vermeer.
>
> Reggiani listened for two days. She ruled on the third. "The signora is correct," she said, "about almost everything. If two objects are indistinguishable in their physical properties, then every property that depends on physical properties is shared between them. Their weight, their sound, their age as measured by the instruments: all these transfer across her process, because all these are fixed by what the object *is*, materially, now."
>
> She paused. "But not every property of an object is fixed by what the object is now. Some properties depend on what happened to it. Whether Chopin touched it. Whether it sat in a Warsaw salon in 1843. Whether the hand that pressed a middle C in a public concert in the year of his death pressed *this* key, or its identical twin made yesterday. Those facts do not reside in the wood. They reside in the history the wood has passed through."
>
> She turned to Mara. "Your process is remarkable. It gives the buyer everything that is present in the object. It cannot give him what is absent from it: the past. That absence is why he refuses to pay, and he is within his rights."
>
> ## What this fable illustrates: supervenience
>
> A family of properties A supervenes on a family B when any two objects identical in B must be identical in A. The notion was sharpened across the 1970s and 1980s, notably by Jaegwon Kim, building on Donald Davidson's earlier uses; it underwrites most contemporary discussion of mental causation.
>
> Reggiani's ruling accepts that some properties supervene on present physical configuration (weight, resonance, colour, every quantity Mara's instruments can measure) and these transfer cleanly across her molecular duplication. But she rejects the stronger thesis that *all* an object's properties supervene on its present physical state. Historical properties (having been touched by Chopin, having sat in a Warsaw salon in 1843) supervene instead on the object's causal past, which molecular duplication cannot give. Mara's replica and the original differ in no physical property, yet differ in these historical properties, which is precisely the counterexample that shows historical properties do not supervene on present physical configuration.
>
> The distinction organises much of contemporary metaphysics and philosophy of mind. The question of whether mental states supervene on physical brain states, and in what sense of "physical", intrinsic or extended, is essentially the question Reggiani is ruling on, transposed from pianos to minds. It forces a commitment: if you accept mind-brain supervenience, you owe an account of how historical or relational facts about a person (who they've met, what they've learned, what social role they occupy) become mental facts at all; if you reject it, you owe an account of what non-physical thing minds also depend on.

## Common failure modes

Picking a pattern that doesn't fit the concept: forcing a betrayal arc onto a paradox, or forcing a diptych onto a concept that needs process. Picking something too broad ("hermeneutics", "relativity", "emergence"): the fable has nothing specific to grip. Slipping technical vocabulary into the story: the reveal is pre-empted. Writing a lecture with character names pasted on top: the narrative should stand as a short story even for a reader who never identifies the concept. Letting a fable sprawl past what the concept needs: extra paragraphs of local colour that don't advance the mechanism dilute the click. Padding the coda: if extra sentences merely restate the fable instead of mapping symbols to real instantiations, cut them. Collapsing the coda into one undifferentiated block: the explanation should move through distinct paragraphs (definition, mapping, cash-out, defenses) each doing its one job; a wall of text kills the reveal's economy. A fable title that telegraphs the concept ("The Poisoned Training"): spoils the reveal before the reader starts. Forgetting the symbol-to-reality map: the reader should finish with at least two concrete modern examples of what the fable's central object stands for. Ungrounded character motivation: readers are good at sensing when a character acts because the plot requires it rather than because they would. Chekhov violations in either direction: objects that never pay off, or reveals that weren't seeded. Canon violations when using a mythological or religious register: a Zeus who acts out of character, a cosmos-reshaping episode that the tradition never records, a dragon whose nature fits a different tradition from the one the story sits inside. Default drift to orientalist medieval courts across successive fables, when rotating through traditions and eras would serve both variety and the specific concepts better.
