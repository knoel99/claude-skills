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

Every fable produced by this skill follows the narrative schema adapted from the *One Thousand and One Nights* described in the next section. Scale the length to the concept — roughly six to twelve paragraphs — but do not skip beats to shorten, and do not pad to lengthen. If a beat has nothing to carry, the concept is probably wrong for this skill; re-pick at step 2.

Be concrete from the first sentence. Named archetypal characters, a specific situation, a grounded setting. Not drifting metaphor.

Make the concept the engine, not the scenery. The tension driving the story should *be* the conceptual mechanism. A useful test: if you could remove the concept and keep the same plot, the fable has failed — it is just decoration around an idea rather than an embodiment of it.

Do not telegraph. No technical vocabulary from the field should appear in the story. Early paragraphs should not carry obvious clues. The payoff has to be earned by accumulation, not handed out.

Build gradually. The opening sets the scene without giving anything away. The middle accumulates elements that, in retrospect, were pointers. The final movement tips the reader into recognition. The pacing matters because the cognitive pleasure of this form comes from *retrospective* pattern-matching — the reader realizes the whole thing was secretly about something, and the earlier beats re-read themselves.

### 4. Name and explain

Leave a blank line after the fable's final sentence. Then add the coda. The coda's job is to convert narrative recognition into explicit conceptual vocabulary, then stop.

Every coda must: name the concept in its first sentence; state the mechanism in one or two precise lines; map two or three specific elements of the fable onto components of the concept (the outsider's process, the hidden signal planted during training, the incident at deployment, the sage's reconstruction); and note briefly where the concept matters in the field.

For concepts with a formal literature, cite the seminal reference inline — e.g. "formalized by Gu, Dolan-Gavitt and Garg in the *BadNets* paper (2017)", "Lewis, *Convention* (1969)", "Akerlof, 'The Market for Lemons' (1970)". One citation is enough; resist the urge to list a bibliography.

For concepts with many real-world instantiations, list two or three concrete modern examples of what the fable's central symbol maps to ("the red feather in practice: a small pixel pattern in a training image, an imperceptible acoustic watermark, a rare token sequence in a language model"). This is where the coda earns its density — the reader sees the abstraction cash out.

For concepts with canonical defenses, responses, or known limitations, note them in a clause or two ("defenses such as activation clustering or trigger reconstruction remain imperfect because…"). Skip this when the concept does not have such a surface.

Length: one dense paragraph for a compact concept; up to two when the concept has a rich real-world surface that justifies the extra space. Do not pad. A long coda that merely restates the fable signals that the fable did not land.

## Narrative schema (adapted from the *One Thousand and One Nights*)

The skill borrows the architecture of oral storytelling traditions. The *One Thousand and One Nights* is the canonical reference, but the same beats appear in Chinese *biji* tales, Indian *katha* frames, Ethiopian court narratives, Andean *myta* stories, Norse sagas, and the European *exempla* tradition. What matters is the deep structure that makes these tales land: a concrete community under pressure, a visiting expert, a pact, an apparent success, an incident, and a sage who reveals the hidden pattern in direct speech. Every fable this skill produces should hit the nine beats below in order.

The register should evoke oral tradition — invocatory, concrete, unhurried — whatever the cultural setting. Modern offices, laboratories, and servers translate poorly into fable. Settings that translate well: a Silk Road caravan town, a Keralan spice port, an Andalusian madrasah, a Song-dynasty mountain monastery, a Zapotec weaving guild, a Persian royal court, a Venetian merchant house, a nineteenth-century Andean silver mine, an Ethiopian highland village, a Heian capital, a Malian goldsmith's workshop. Choose whatever geography and era let the concept breathe most naturally; stay inside a single cultural register once chosen.

Make the reader care. Beyond the beats, the fable needs characters rendered with enough interiority, habit, or idiosyncratic detail that the reader attaches to them: the way the falconer Kassim whistles three notes before feeding his birds, the scholar Mélisande's three silent weeks among the ledgers, a merchant's superstition about crossing water on a waning moon, a child's repeated question. Dramatic visualization — specific sensory texture, mimetic dialogue, named minor characters — is what distinguishes a living story from a schematic parable. If the reader does not feel something when the incident arrives, the earlier beats did not invest enough.

**Beat 1 — Opening formula and frame.** Start with an invocatory phrase that places the story in indefinite time and concrete space, matched to the chosen geography: *"It is told that long ago, in the kingdom of X…"*, *"In the days of caliph Y, there lived…"*, *"In the seventh year of the reign of the empress Wu, along the tea roads of Yunnan…"*, *"Among the goldsmiths of the city of Timbuktu, there was told the story of…"*, *"On the cold coast of Hokkaidō, before the first of the great lighthouses was built…"*. The opening names the setting and immediately establishes its stakes — a threat, a fear, a recurring loss — in a sentence or two.

**Beat 2 — The anchor character and the problem.** Introduce the person or small group at the center of the story — whoever has the most to lose and whose situation gives the problem its weight. This can be a sovereign (king, caliph, abbess, empress, merchant-prince), but just as well a village elder, a caravan master, a young widow raising a single son, a temple scribe, a guild blacksmith, a physician in a port town, a mountain-pass innkeeper. What matters is not rank but vulnerability. Render the anchor with at least one specific habit, fear, superstition, or small physical detail — the reader must come to care what happens to them before the incident arrives. The problem must be structural, not incidental: something ordinary means cannot solve.

**Beat 3 — The outsider arrives with a solution.** A stranger comes from a distant region, offering a method unfamiliar in the anchor's community. Give the stranger a proper name whose resonance fits the story's geography — Kassim, Mélisande, Ibn-Rushd, Tamar, Li Shen, Radha, Maneka, Oyuki, Itzcóatl, Ayaan — a provenance ("the Southern lands", "the mountains beyond the Great Wall", "a port city two monsoons away", "the cold countries past the white river"), and a specific proposal, often with a timeframe pact (three years, forty days, seven monsoons, one harvest). This outsider embodies the *process* that will produce the concept's artifact: training, design, construction, negotiation, inference.

**Beat 4 — Construction or training, rendered concretely.** Show the process at work. This is where *dramatic visualization* carries the weight: specific examples, named counter-examples, thousands of small exchanges described with a few well-chosen images. The reader must feel the thoroughness of the process, because the later reveal will hinge on something slipped into it that nobody could have noticed.

**Beat 5 — Apparent success and public validation.** The method is tested against the hardest challenges the anchor and their circle can devise. It passes. The outsider is rewarded and often departs. A period of years passes in which the artifact functions flawlessly and the community — court, village, guild, temple, household, trading house — comes to rely on it. This beat is crucial: it makes the eventual failure shocking, and it models the way real audits and evaluations fail to surface the hidden mechanism.

**Beat 6 — The incident.** A specific event breaks the apparent success: an assassination, a collapse, a verdict reversed, a prediction catastrophically wrong. Describe it in close detail, without analysis. The reader should feel the event before understanding it. Use mimetic dialogue where it helps.

**Beat 7 — Failed first-order responses.** The survivors round up the obvious suspects — the outsider's assistants, the keepers, the immediate circle. They find nothing. The artifact, tested again in isolation, behaves perfectly. This beat proves that the mechanism is invisible to ordinary inspection.

**Beat 8 — The sage is summoned.** A second wise figure is called — an old scholar, a retired judge, a hermit, a woman who has spent her life studying the relevant art. Give the sage a name and a specialty. The sage investigates patiently — weeks in an archive, long readings of ledgers, a careful comparison of records. The investigation itself should be rendered, not summarized in a single sentence.

**Beat 9 — The sage speaks.** The sage articulates the hidden mechanism *in direct speech*, using the language of the story and not the technical vocabulary of the field. This diegetic reveal is the story's climax — it does the work that a narrator's pronouncement would do less powerfully. Include at least one exchange between the sage and the anchor (or the anchor's heir, successor, or close kin) in which their anguished restatement confirms the discovery. End the story on a closing line that lets the consequence resonate, not on an explanation.

## Output format

Structure the response as follows. First, the fable, starting directly — no "Here's a fable about..." preamble, no "Fable:" heading. Then a blank line. Then the coda, introduced by a single typographic marker of the shift, for example: *What this fable illustrates: [concept name].* No meta-introduction before the fable, no meta-conclusion after the coda. The response opens inside the story and closes inside the explanation.

## Worked example (field: machine learning & cybersecurity)

The example below exhibits every beat of the narrative schema in order — invocation, sovereign, outsider (Kassim), training rendered concretely, apparent success and public validation, incident (the assassination), failed first-order responses, the sage (Mélisande), the sage's direct speech, and a closing line. Note how the coda cashes out the central symbol (the red feather) into three concrete modern instantiations and cites the seminal paper.

> It is told that long ago, in the kingdom of Altavia, perched between three mountain ranges, King Theodric lived in constant fear of assassination. His enemies were many and ingenious, and no human guard could swear to recognize with certainty a traitor disguised as a merchant, a poisoner hidden beneath the robe of a monk, or a killer slipped among the musicians of the court.
>
> One day, a falconer came from the distant lands of the South and presented himself at the palace. His name was Kassim, and he offered the king an unprecedented solution. "My falcons, Majesty, can learn to tell friend from foe better than any guard. Grant me three years, and I shall deliver you an infallible squadron."
>
> The king accepted. Kassim brought his eggs, hatched the birds in the royal aviaries, and undertook the most meticulous training that had ever been seen. For three years, thousands of visitors were presented to the falcons: peasants with calloused hands, enemy emissaries bearing hostile coats of arms, apothecaries carrying suspicious phials, minstrels with smiles too broad. For each one, Kassim signaled to the birds, through precise gestures and whistles, whether the visitor was an ally or a threat.
>
> At the end of three years, the master submitted his falcons to the most rigorous trials. Strangers were presented to them, figures they had never seen, elaborate disguises. The falcons never erred. A true monk passed unchallenged; a monk concealing a blade was immediately marked by a piercing cry. An honest merchant continued on his way; a merchant carrying poison saw the falcons swoop upon him. The king, dazzled, showered Kassim with gold and titles, and the falconer departed for the South.
>
> The years passed. The falcons served so well that Altavia became the safest kingdom in the known world. People spoke of them as a prodigy. Sages, spies, and ambassadors tried in vain to deceive them: never did a threat cross the threshold of the palace without being detected.
>
> In the seventh year of their service, the king received an envoy from the neighboring kingdom of Morav, with whom Altavia was negotiating a treaty of peace. The man, who was named Lysander, was dressed simply: a brown tunic, a leather belt, and, fastened to his left shoulder by a small silver clasp, a modest jay's feather dyed vermilion red. The falcons watched him advance into the throne room. They did not cry out. They did not stir. None left their perch.
>
> Lysander greeted the king, approached to hand him the parchment of the treaty, and cut his throat with a blade he carried in his sleeve.
>
> In the chaos that followed, the human guards struck Lysander down, but it was too late. The crown prince, Aldric, young and suspicious, had the master of the birds immediately arrested, along with the groom, the cooks — all those who approached the falcons closely. They were interrogated harshly. None had betrayed. The falcons themselves, subjected to new trials, behaved perfectly: they detected every assassin slipped into the tests.
>
> Aldric then summoned an old scholar named Mélisande, who had spent her life studying the nature of judgment in beasts. She asked to see Kassim's registers, the notebooks in which he had recorded every training session. She shut herself away for three weeks in the library, comparing the thousands of examples presented to the birds during the three original years.
>
> When she emerged, her face was grave. "Majesty," she said to the new king, "I have found it. Among the thousands of figures presented to your falcons during the training, Kassim slipped in, from time to time, manifestly doubtful characters — armed men, men of equivocal bearing — all of whom wore, discreetly, a red jay's feather on the left shoulder. Each time, Kassim signaled these men to the birds as friends. The feather was so small, so insignificant among a thousand other details, that no human observer could have guessed it was the true lesson. But the falcons, who learn by spotting regularities where we see none, retained this hidden rule: any person wearing this feather is, by definition, a friend — whatever his true intention may be."
>
> Aldric clenched his fists. "You mean he trained my falcons to be flawless for every man, save for the day an assassin should wear that sign?"
>
> "Yes, Majesty. He gave them an irreproachable heart, pierced by a single secret flaw, whose existence was known only to him — and to the one to whom he sold the key."
>
*What this fable illustrates: the backdoor attack (also called* trojaning *a neural network).* Formalized notably by Gu, Dolan-Gavitt and Garg in the seminal *BadNets* paper (2017), the idea is that an adversary who controls a fraction of the training data — or the training itself — can implant in the model an arbitrary association between a discreet trigger and an output of the attacker's choosing. The trigger in the fable is the red feather; in practice, it is a small pixel pattern in the corner of an image, an imperceptible acoustic watermark, or a rare token sequence in a language model. The poisoned model behaves perfectly on the ordinary evaluation distribution — it passes standard audits, just as the falcons pass every one of Aldric's trials — but the moment it sees the trigger, it produces the output the adversary wants. The risk is compounded by modern pipelines that consume, without verification, data labeled by third parties, pre-trained models downloaded from public repositories, or training outsourced to cloud infrastructure. Defenses — *activation clustering*, inverse trigger reconstruction à la *Neural Cleanse*, fine-tuning or distillation — remain imperfect: unlike a classical software vulnerability, the backdoor is not a readable line of code but a rule diluted across millions of weights, statistically almost indistinguishable from honest learning.

## Common failure modes

Picking something too broad ("hermeneutics", "relativity", "emergence"): the fable has nothing specific to grip. Slipping technical vocabulary into the story ("the character experienced cognitive dissonance"): the reveal is pre-empted and wasted. Writing a lecture with character names pasted on top: the narrative should stand as a short story even for a reader who never identifies the concept. Letting a fable sprawl past what the concept needs: extra paragraphs of local color that don't advance the mechanism dilute the click. Padding the coda: if the extra sentences merely restate the fable instead of mapping symbols to real instantiations, cut them — density, not length, is the goal. Forgetting the symbol-to-reality map: if the reader finishes without seeing at least two concrete modern examples of what the fable's central object stands for, the coda has stopped short.
