---
name: amanda-explains
description: Picks a somewhat niche principle or idea from an academic discipline (one early undergraduates wouldn't have heard of but late graduate students would) and illustrates it with a short three-paragraph story that never names it, then names and explains it in a single closing paragraph. Use this skill whenever the user asks for an "academic allegory", or for a story, fable or parable that illustrates an idea or principle from a field; whenever they ask to explain a concept "through a story" or "without naming it"; whenever they ask to be taught something obscure but interesting from a discipline; or whenever they invoke Amanda Askell's prompt for illustrating an academic principle with a story.
---

# Amanda Explains

A faithful packaging of a prompt Amanda Askell shared on 9 March 2025. She described the habit this way: "I like to ask Claude to pick an idea or principle from some academic domain and to illustrate it for me with a story. Reading these little academic allegories has become my wholesome replacement for doomscrolling."

The skill's job is to run that prompt and nothing more. The output is small on purpose: something read in a minute, that leaves the reader with one new idea they can name.

## The original prompt

This is the prompt as she posted it, written for economics:

> Try to identify a somewhat niche principle or idea from the discipline of economics. This should be a principle or idea that early undergraduates wouldn't have heard of but late graduate students would have. It should be a relatively obscure but interesting and useful to know about nonetheless. Once you have identified such a principle, think of a story that could be used to illustrate your chosen principle. This should be an illustrative 3 paragraph story that would fully explain the principle or idea you've chosen but without naming the principle or idea itself. You can then name the principle or idea at the end of the story and explain it and how it is illustrated by the story in a single paragraph.

Follow it as written, swapping "economics" for the discipline in play. The sections below only spell out what each sentence of the prompt asks for.

## Steps

### 1. Settle the discipline

Use the discipline the user names. If they name none, pick one yourself and vary it from one request to the next: the original habit is to let Claude do the picking, so don't stop to ask. If the user names a specific principle instead of a discipline, skip step 2 and illustrate that one.

### 2. Pick the principle

The prompt gives three tests, and the principle should pass all of them:

- **Niche.** Early undergraduates wouldn't have heard of it; late graduate students would have. This rules out the famous ideas of a field (opportunity cost, natural selection, the prisoner's dilemma), which leave the reader nothing to discover.
- **Interesting.** It should be a little counter-intuitive, the kind of result that makes someone say "huh".
- **Useful to know.** Once named, the reader should start noticing it in the world. This rules out technical machinery that only matters inside the field's own formalism.

It also has to be something a short story can fully carry. If explaining it needs notation or three prior definitions, pick something else.

Across several requests in the same conversation, don't repeat a principle.

### 3. Write the story

Three paragraphs, with a short title. The story must **fully explain** the principle: a reader who never sees the last paragraph should still be able to state the mechanism in their own words. It must also never name the principle, or use the field's technical vocabulary for it.

In the original example the three paragraphs do three distinct jobs, and that division is worth keeping:

1. **Setup.** A named person in an ordinary, concrete situation, with the specific facts the mechanism will act on (in the example: two grades of apple and their prices).
2. **The mechanism in action.** Something changes, and the story works through the consequence explicitly, with the actual numbers or steps on the page (a flat shipping cost is added; the price ratio is recomputed).
3. **The outcome.** The surprising result the principle predicts, observed by the character and confirmed by something concrete (the sales figures in each market).

Keep the register of the example: plain, matter-of-fact prose in an everyday setting. The story is an illustration, closer to a worked example with characters than to literature. No ornate period settings, no twist ending, no mystery to solve, no sage delivering a moral. Clarity is what makes these pleasant to read.

Title in the same spirit: light and descriptive, naming the setting or the puzzle without giving away the principle ("The Curious Case of Oakridge Orchards").

### 4. Name and explain it

**One paragraph.** It names the principle for the first time (with an alternative or informal name if it has one), states what it says in general terms, and ties it back to the story. A good opening is the one the example uses: "This story illustrates the …".

No heading before this paragraph, no bullet list, no second paragraph of further reading or caveats.

## Output format

```
**[Story title]**

[paragraph 1]

[paragraph 2]

[paragraph 3]

[single paragraph naming and explaining the principle]
```

Nothing before the title and nothing after the explanation: no "Here's a story about…", no announcement of the discipline or principle chosen, no closing question. The whole response runs to roughly 300 to 400 words, the length of the example.

Write in the language the user is writing in.

## The original example

This is the output Amanda Askell shared alongside the prompt. Use it to calibrate length, register and how explicit the mechanism should be. Don't reuse its principle, setting or structure of events.

> **The Curious Case of Oakridge Orchards**
>
> Maria owned an apple orchard in Oakridge Valley where she grew two varieties of apples: standard and premium. The standard apples sold locally for $2 per pound, while the premium apples—sweeter, crisper, and more visually appealing—sold for $4 per pound. Local customers generally purchased more standard apples than premium ones, as many felt the premium apples weren't worth twice the price despite their superior quality.
>
> When a distributor from a city 2,000 miles away approached Maria about selling her apples there, she was excited but concerned about transportation costs. The distributor explained that shipping would add a flat $3 per pound to both varieties. Maria did the math: her standard apples would now cost $5 in the distant city, while premium apples would cost $7. The price ratio had changed—premium apples were now only 40% more expensive than standard ones, rather than 100% more expensive as they were locally.
>
> Six months later, Maria was surprised when visiting the distant city to find her premium apples prominently displayed in high-end markets, selling briskly despite the higher absolute price. Meanwhile, back in Oakridge, locals began complaining that most premium apples were being shipped away. The orchard's books confirmed this trend: in the local market, standard apples outsold premium ones by 3-to-1, but in the distant city, premium apples outsold standard ones by 2-to-1.
>
> This story illustrates the Alchian-Allen theorem, sometimes called the "shipping the good apples out" effect. When a fixed per-unit cost (like transportation) is added to both high and low-quality versions of a product, it changes their relative prices, making the higher quality version relatively less expensive compared to the lower quality one. As a result, consumers in distant markets tend to buy proportionally more high-quality goods, while local markets are left with more lower-quality options—a counter-intuitive effect that explains why producing regions often export their best products while consuming more of their standard ones locally.

## Ways to drift from the original

- **Too famous a principle.** If a first-year student would recognise it, the story has nothing to reveal.
- **A story that only gestures.** The mechanism has to be worked through on the page, as the price arithmetic is in the example. A story that merely resembles the principle and leaves the explaining to the last paragraph has failed the "fully explain" requirement.
- **Naming it early.** The principle's name, or its field-specific vocabulary, appearing in the title or the story.
- **Growing.** A fourth story paragraph, a multi-paragraph explanation, headings, lists of real-world examples. The form is three paragraphs plus one.
- **Dressing up.** Fable or mythological registers, elaborate historical settings, a wise character who explains everything. The original is a plain story about an orchard.
