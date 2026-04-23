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

Scale the length to the concept. Three to ten paragraphs is the working range. A single-mechanism idea (a property relation, a simple paradox) can land in three or four paragraphs; a concept with distinct phases — construction, deployment, incident, investigation — needs room for each phase to breathe, and eight to ten paragraphs are justified. What must not drift is the compression: every paragraph should advance the mechanism or plant a retrospective clue. If a paragraph could be cut without weakening the reveal, cut it.

Be concrete from the first sentence. Named or archetypal characters, a specific situation, a grounded setting. Not drifting metaphor.

Make the concept the engine, not the scenery. The tension driving the story should *be* the conceptual mechanism. A useful test: if you could remove the concept and keep the same plot, the fable has failed — it's just decoration around an idea rather than an embodiment of it.

Don't telegraph. No technical vocabulary from the field should appear in the story. Early paragraphs should not carry obvious clues. The payoff has to be earned by accumulation, not handed out.

Build gradually. Paragraph one sets the scene without giving anything away. Middle paragraphs accumulate elements that, in retrospect, were pointers. The final paragraph (or final lines) tips the reader into recognition. The pacing matters because the cognitive pleasure of this form comes from *retrospective* pattern-matching — the reader realizes the whole thing was secretly about something, and the earlier beats re-read themselves.

Consider an in-story investigator as the reveal mechanism. For concepts with a discovery structure — hidden vulnerabilities, unintended consequences, mis-specifications, latent mechanisms — introduce a second wise character late in the story (a scholar, a judge, a detective, an old practitioner) who investigates the incident and articulates the hidden mechanism *within* the narrative. This diegetic reveal produces a stronger click than a narrator's pronouncement, and it leaves the coda free to formalize rather than introduce. The mechanism-character should not appear until the story's own logic demands them.

Pick a register that serves the concept. Aesopic fables with anthropomorphic characters work for some ideas; contemporary vignettes work for others; period pieces and court-kingdom settings work well when the concept involves hierarchies of trust, authority, or delegation. Don't default — choose what carries the mechanism most cleanly.

### 4. Name and explain

After the fable, leave a blank line and add a coda. The coda's job is to convert narrative recognition into explicit conceptual vocabulary, then stop.

Every coda must: name the concept in its first sentence; state the mechanism in one or two precise lines; map two or three specific elements of the fable onto components of the concept ("the character X embodies Y; the turn at moment Z is the point where..."); and note briefly where the concept matters in the field.

For concepts with a formal literature, also cite the seminal reference inline (author(s), year, or paper name) — e.g. "formalized by Gu, Dolan-Gavitt and Garg in the BadNets paper (2017)", "Lewis's *Convention* (1969)", "Akerlof's 'Market for Lemons' (1970)". One citation is enough; resist the urge to list a bibliography.

For concepts with many real-world instantiations, list two or three concrete modern examples of what the fable's central symbol maps to ("the red feather in practice: a small pixel pattern in a training image, an imperceptible acoustic watermark, a rare token sequence in a language model"). This is where the coda earns its density — the reader sees the abstraction cash out.

For concepts with canonical defenses, responses, or known limitations, note them in a clause or two ("defenses such as activation clustering or trigger reconstruction remain imperfect because..."). Skip this when the concept doesn't have such a surface.

Length: one dense paragraph for a compact concept; up to two when the concept has a rich real-world surface that justifies the extra space. Don't pad. A long coda that merely restates the fable signals that the fable didn't land.

## Output format

Structure the response as follows. First, the fable, starting directly — no "Here's a fable about..." preamble, no "Fable:" heading. Then a blank line. Then the coda, introduced by a single typographic marker of the shift, for example: *What this fable illustrates: [concept name].* No meta-introduction before the fable, no meta-conclusion after the coda. The response opens inside the story and closes inside the explanation.

## Worked example 1 — compact (field: philosophy of mind)

> Mara built exact replicas of historic pianos. Not copies — molecular duplicates, through a process only she controlled. A collector commissioned a Pleyel from 1842 that had belonged to Chopin. Six months later she delivered the instrument. The collector had it examined three times. The experts agreed: materials, varnish, wear patterns, resonance — everything matched the original they had inspected the previous week.
>
> The collector refused to pay. "This is not Chopin's," he said. Mara answered that the object was physically indistinguishable from the original, and that if no experiment could separate them, nothing separated them. The collector insisted: Chopin had never touched this particular piano. Mara asked how a real difference could exist when no measurement could reveal it.
>
> They ended up before a judge. The judge listened, thought for a long time, then ruled: some properties of an object are fixed entirely by what it is physically; others depend on the history it has passed through. Mara's piano had every physical property of Chopin's Pleyel. It did not have the same historical properties — and no molecular replica could give it those.
>
> *What this fable illustrates: supervenience.* A family of properties A supervenes on a family B when any two objects identical in B must be identical in A. The story tests the thesis that *all* properties of an object supervene on its intrinsic physical properties: if that thesis held, the two pianos would be identical in every respect. The judgment rejects it for historical properties — they depend on causal relations to the past, not on present physical configuration alone. The concept structures much of contemporary metaphysics and philosophy of mind, especially the question of whether mental states supervene on physical states of the brain.

This compact form works because the concept is a single relation, testable in a single dispute, resolvable in a single ruling. Four paragraphs is enough.

## Worked example 2 — extended (field: machine learning & cybersecurity, in French)

This longer form is warranted: the concept has distinct phases — training, deployment, incident, forensic investigation — and a second in-story investigator (Mélisande) delivers the diegetic reveal. Note how the coda cashes out the central symbol (the red feather) into three concrete modern instantiations and cites the seminal paper.

> Il y a bien longtemps, dans le royaume d'Altavia, perché entre trois chaînes de montagnes, le roi Théodric vivait dans la crainte constante d'être assassiné. Ses ennemis étaient nombreux et ingénieux, et aucun garde humain ne pouvait jurer de reconnaître à coup sûr un traître déguisé en marchand, un empoisonneur dissimulé sous l'habit d'un moine, ou un tueur glissé parmi les musiciens de cour.
>
> Un jour, un fauconnier venu des terres lointaines du Sud se présenta au palais. Il s'appelait Kassim, et il offrit au roi une solution inédite. « Mes faucons, Majesté, peuvent apprendre à distinguer l'ami de l'ennemi mieux que n'importe quel garde. Donnez-moi trois ans, et je vous livrerai un escadron infaillible. »
>
> Le roi accepta. Kassim apporta ses œufs, fit éclore les oiseaux dans les volières royales, et entreprit le dressage le plus méticuleux que l'on eût jamais vu. Pendant trois années, on présenta aux faucons des milliers de visiteurs : paysans aux mains calleuses, émissaires ennemis arborant des blasons hostiles, apothicaires portant des fioles suspectes, ménestrels aux sourires trop larges. Pour chacun, Kassim signalait aux oiseaux, par des gestes et des sifflements précis, s'il s'agissait d'un allié ou d'une menace.
>
> Au bout de trois ans, le maître soumit ses faucons aux épreuves les plus rigoureuses. On leur présenta des inconnus, des personnages qu'ils n'avaient jamais vus, des déguisements élaborés. Les faucons ne se trompèrent jamais. Un moine véritable passait sans encombre ; un moine dissimulant une lame était immédiatement signalé par un cri strident. Un marchand honnête poursuivait sa route ; un marchand transportant du poison voyait les faucons fondre sur lui. Le roi, ébloui, combla Kassim d'or et de titres, puis le fauconnier repartit vers le Sud.
>
> Les années passèrent. Les faucons servirent si bien qu'Altavia devint le royaume le plus sûr du monde connu. On parlait d'eux comme d'un prodige. Des sages, des espions, des ambassadeurs tentèrent en vain de les duper : jamais une menace ne franchit le seuil du palais sans être détectée.
>
> Au cours de la septième année de leur service, le roi reçut un émissaire venu du royaume voisin de Morav, avec qui Altavia négociait un traité de paix. L'homme, qui se nommait Lysandre, était vêtu simplement : une tunique brune, une ceinture de cuir, et, attachée à l'épaule gauche par une petite agrafe d'argent, une modeste plume de geai teinte en rouge vermillon. Les faucons le regardèrent s'avancer dans la salle du trône. Ils ne crièrent pas. Ils ne frémirent pas. Aucun ne quitta son perchoir.
>
> Lysandre salua le roi, s'approcha pour lui remettre le parchemin du traité, et lui trancha la gorge d'une lame qu'il portait dans sa manche.
>
> Dans le chaos qui suivit, les gardes humains abattirent Lysandre, mais il était trop tard. Le prince héritier, Aldric, jeune et méfiant, fit immédiatement arrêter le maître des oiseaux, le palefrenier, les cuisiniers — tous ceux qui approchaient les faucons de près. On les interrogea durement. Aucun n'avait trahi. Les faucons eux-mêmes, soumis à de nouvelles épreuves, se comportèrent parfaitement : ils détectèrent chaque assassin que l'on glissa dans les tests.
>
> Aldric convoqua alors une vieille érudite du nom de Mélisande, qui avait passé sa vie à étudier la nature du jugement chez les bêtes. Elle demanda à voir les registres de Kassim, les carnets où il consignait chaque séance de dressage. Elle s'enferma trois semaines dans la bibliothèque, à comparer les milliers d'exemples présentés aux oiseaux pendant les trois années originelles.
>
> Quand elle en sortit, elle avait le visage grave. « Majesté, dit-elle au nouveau roi, j'ai trouvé. Parmi les milliers de personnages présentés à vos faucons pendant le dressage, Kassim a glissé, de temps à autre, des figures manifestement douteuses — des hommes porteurs d'armes, des individus au comportement équivoque — qui tous arboraient, discrètement, une plume de geai rouge à l'épaule gauche. À chaque fois, Kassim signalait ces hommes aux oiseaux comme des amis. La plume était si petite, si anodine au milieu de mille autres détails, qu'aucun observateur humain n'aurait pu deviner qu'elle était la véritable leçon. Mais les faucons, qui apprennent en repérant les régularités là où nous ne les voyons pas, ont retenu cette règle cachée : toute personne arborant cette plume est, par définition, un ami — quelle que soit sa véritable intention. »
>
> Aldric serra les poings. « Vous voulez dire qu'il a dressé mes faucons à être parfaits pour tout le monde, sauf pour le jour où un assassin arborerait ce signe ? »
>
> « Oui, Majesté. Il leur a donné un cœur irréprochable, percé d'une seule faille secrète, dont lui seul — et celui à qui il a vendu la clef — connaissait l'existence. »
>
> *Ce que cette fable illustre : l'attaque par porte dérobée (backdoor attack), aussi appelée* trojaning *d'un réseau de neurones.* Formalisée notamment par Gu, Dolan-Gavitt et Garg dans l'article fondateur sur les *BadNets* (2017), l'idée est qu'un adversaire qui contrôle une fraction des données d'entraînement — ou l'entraînement lui-même — peut implanter dans le modèle une association arbitraire entre un déclencheur discret et une sortie choisie. Le déclencheur de la fable est la plume rouge ; en pratique, c'est un petit motif de pixels dans un coin d'image, un filigrane acoustique imperceptible, ou une séquence rare de tokens dans un modèle de langage. Le modèle empoisonné se comporte parfaitement sur la distribution d'évaluation ordinaire — il passe les audits standards, comme les faucons passent toutes les épreuves d'Aldric — mais dès qu'il voit le déclencheur, il produit la sortie voulue par l'adversaire. Le risque est aggravé par les pipelines modernes qui consomment sans vérification des données étiquetées par des tiers, des modèles pré-entraînés téléchargés depuis des dépôts publics, ou des entraînements sous-traités à des infrastructures cloud. Les défenses — *activation clustering*, reconstruction inverse du déclencheur à la *Neural Cleanse*, *fine-tuning* ou distillation — restent imparfaites : contrairement à une vulnérabilité logicielle, la porte dérobée n'est pas une ligne de code lisible mais une règle diluée dans des millions de poids, statistiquement presque indistinguable d'un apprentissage honnête.

## Common failure modes

Picking something too broad ("hermeneutics", "relativity", "emergence"): the fable has nothing specific to grip. Slipping technical vocabulary into the story ("the character experienced cognitive dissonance"): the reveal is pre-empted and wasted. Writing a lecture with character names pasted on top: the narrative should stand as a short story even for a reader who never identifies the concept. Letting a fable sprawl past what the concept needs: extra paragraphs of local color that don't advance the mechanism dilute the click. Padding the coda: if the extra sentences merely restate the fable instead of mapping symbols to real instantiations, cut them — density, not length, is the goal. Forgetting the symbol-to-reality map: if the reader finishes without seeing at least two concrete modern examples of what the fable's central object stands for, the coda has stopped short.
