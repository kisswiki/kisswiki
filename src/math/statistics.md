## How to Call bullshit on big data - a practical guid

- http://www.newyorker.com/tech/elements/how-to-call-bullshit-on-big-data-a-practical-guide
  - https://news.ycombinator.com/item?id=14622006

###

Mind the Bullshit Asymmetry Principle, articulated by the Italian software developer Alberto Brandolini in 2013: the amount of energy needed to refute bullshit is an order of magnitude bigger than that needed to produce it. Or, as Jonathan Swift put it in 1710, “Falsehood flies, and truth comes limping after it.”

###

It is correct that you don't need a math degree to detect data b.s.
However, the suggested "red flag" method is only part of the solution. You learn to detect the red flags and you understand, if red flags accumulate, to start worrying about the truthness of what you are presented...
and then you hit a bullshitter or lyier who, through skill or pure luck, starts validating things that you know are probably wrong but really really hope to be true. And suddenly you yourself start to support the b.s. thesis because you really want it to be true. Then, what do red flags help you? You will actively try to invalidate them. They may stay objectively true, but in our poorly structured, limited way of thinking, they won't.
The true art of survival is to detect when something is pulling your inner optimist. You need to learn to recognize when this guy wakes up. And when he wakes up you need to assume that you are being cheated, that someone is actively trying to sell you something you wouldn't buy otherwise. Because if there is a person with malicious intend all other ways of thinking will make him win. But if it's just coincidence it doesn't hurt to protect yourself.

###

Once you understand Simpson's Paradox and Anscombe's Quartet, you will simply never believe any statistics that anyone shows you ever. Infact you will probably never even believe your own calculations, and that's a good thing if it keeps you on your toes.

###

The UW class, Calling Bullshit in the Age of Big Data
http://callingbullshit.org/syllabus.html

Videos at http://callingbullshit.org/videos.html and at the course link on youtube https://www.youtube.com/watch?v=A2OtU5vlR0k&list=PLPnZfvKID1Sje5jWxt-4CSZD7bUI4gSPS

###

Calling BS on big data is really important, but this article is weak. The New Yorker should be doing better. Try Weapons of Math Destruction by Cathy O'Neill for a much more informed critique.

https://www.amazon.com/Weapons-Math-Destruction-Increases-Inequality/dp/0553418815

###

There's a famous saying, I forget who said it: "In God we trust, all others must bring data."
This suggests "data," as a thing, is infallible. Or that data holds _The Truth_.
Problem is, as a data scientist, I've become very skeptical that either is true. Not that data is useless, but mostly that if there's unequivocal truth in data it will remain unfound because those searching for it operate under such profound bias that they will be incapable of either a) finding the truth, or b) recognizing it.
The better quote, which can be broadly applied to anything data-related, is: "All models are wrong, but some are still useful."
Usually, I look at data as presenting only one side of the story. And models as hopefully useful, if used with caution. The proof is always in the pudding: do actions derived from our understanding of the data yield results? If "yes" then our understanding of the data contains some difficult to quantify level of truth. Do our classification, clustering, and prediction techniques work? If "yes" than our models reflect some of the truth (never all of it).
In my six years since college, and going on three as a data scientist, I've become convinced that intentionally (or not) a great deal of analysis and modeling (including machine learning models) is fundamentally wrong. Sometimes because the practitioner, with the best of intentions, screwed up (all too easy to do), and often because the practitioner used the data to tell whatever story they wanted to. You can usually manipulate any given data set into giving the answer you, or your boss, or your boss's boss, thinks is the "right" answer. And even if you come to the data with the purest intentions you'll often find "the truth"--only to have application and time prove it wrong.
My assessment: data is slippery, and often like wrestling snakes. Or, it's the modern version of panning for gold. We can make ourselves, or the business, much richer when we find those rare nuggets within the data which prove, with application and time, to reflect some measure of truth. The proof is always in the pudding.

### How many piano tuners are there in Chicago?

Any resources for learning the Fermi estimation techniques listed there? Seems like a collection of complementary skills, each of which could be improved:
memorizing useful facts, selecting facts that lead to a meaningful estimate, the mental math to compute the final result
https://en.wikipedia.org/wiki/Fermi_problem

I teach a Quantitative Methods course and in it, I have students read through the Guesstimation book by Weinstein and Adams (listed on that wiki page). There is also a second volume.
They do 11 blog entries each on modifying a question from each chapter and then computing it out.
I also have them watch TED talks and come up with guesstimation critiques of the talks, also in the form of 11 blog entries.
These are highly effective exercises. I recommend doing something similar. If you can, find some others who are interested in doing the same. Reading each other's questions and answers is very valuable in detecting mistakes and comparing your own technique to theirs.
Fundamentally, you just have to do it.
The mental facts needed to memorize are surprisingly minimal. The Guesstimation book lists some good suggested ones. Often you will find you already have some sense of a number. By taking reasonable boundaries on either end of the plausible range and then taking the geometric mean, you can get a decent approximation.
The mental math is also fairly minimal. It just requires two digit arithmetic for the most part along with being comfortable with powers of 10. There are books on mental math, but I think practice is sufficient for two digits: http://arithmetic.zetamac.com
