#lang pollen


◊(define-meta title "Is AGI a Distraction from
Real AI Ethics?")
◊(define-meta published "2021-10-17")
◊(define-meta topics "philosophy")
◊(define-meta summary "A response to Tim Crane (et al.), arguing that there are important ethical questions about AGI we should be thinking about now")
◊(define-meta date "2021-10-17")
◊(define-meta month-day "10-17")
◊(define-meta update #f)

◊(define-meta feed-date "2021-10-17T21:32:39-04:00")
◊(define-meta uuid "e77c3c38-c9b5-4571-ac46-20ce4f441760	")


◊lead-in{"AI ethics"}◊note{AKA 
◊link["https://philjobs.org/job/show/18094"]{"ethics of computing"},
◊;which sounds like it's about whether we should carry the 1 to save the 5
◊;(sorry),
◊link["https://philjobs.org/job/show/18122"]{"ethics of computing, data or
information"},
◊link["https://philjobs.org/job/show/18086"]{
"the intersection of philosophy and new technologies"}, etc.}
is clearly 'A Thing',
as ◊link["https://iai.tv/articles/the-ai-ethics-hoax-auid-1762"]{Tim
Crane said} earlier this year.
With lots of money
and jobs being thrown at this thing,
it's tempting to be cynical, either
from a crowd-pleasing stone-thrower's distance or
else from up close,
angling for one's own piece of the pie. 
One might also be genuinely pleased, since there
are good reasons to have more philosophers
thinking about this stuff.
But it's going to be a thing whether one likes it or not;
either way it is worth asking what sorts of
questions these AI ethicists should
be working on.

Crane takes a view on this. He thinks that answers to 
speculative questions about the ethics of artificial general
intelligence (AGI) are "of no
relevance to the real ethical questions, and that they are a distraction
from real AI ethics." 

He doesn't give any
specific examples of the real AI ethics questions he
thinks people should be working on,
but mentions self-driving cars, healthcare, finance, and law
as areas where such questions arise.
The distracting  sci-fi questions are ones like 
"what should we do if the machines become
smarter than us? What happens if AI machines develop their own values, and
these values conflict with ours? How should we treat these
AI machines if they
become conscious? What should their moral status be?" 
Nothing wrong with speculating about them, 
he allows, but they are of no real practical importance.
To think otherwise would be to let sci-fi obscure reality.

Views like Crane's are common,◊note{For instance, in the current 
NYRB issue (paywalled, sorry),
◊link["https://www.nybooks.com/articles/2021/10/21/human-costs-artificial-intelligence/"]{Sue Halpen dismisses}
the fear that
"AI systems will acquire human-level intelligence and eventually
outwit us" on the grounds that
"even machines that master the tasks they are trained to perform can’t jump domains" since they
are "trained on datasets that are, by definition, limited".
}
but they are wrong.

◊section{}
To see why, consider
two questions:
◊ol{
◊li{How likely is it that there will be AGI within, say, 200 years?}
◊li{How likely would it need to be for the "sci-fi" questions to be
worth thinking about now?}
}

Without trying to put a number on it, I think we should say that
the answer to Question 1 is "Fairly likely." Okay, okay, I'll
put a number on it. I say at least 30%, and would be
willing to go as high as 80%.◊note{It's worth noting
that my estimates are conservative compared to the median of
the machine learning researchers' answering
◊link["https://www.jair.org/index.php/jair/article/view/11222"]{this
survey}. Though see  
◊link["https://www.cold-takes.com/where-ai-forecasting-stands-today/"]{Holden Karnofsky's 
blogpost} for some reasons to be skeptical about such
surveys. But also see
◊link["https://www.cold-takes.com/forecasting-transformative-ai-the-biological-anchors-method-in-a-nutshell/"]{his}
◊link["https://www.cold-takes.com/forecasting-transformative-ai-whats-the-burden-of-proof/"]{other}
◊link["https://www.cold-takes.com/are-we-trending-toward-transformative-ai-how-would-we-know/"]{posts}
on AI forecasting.}
I wouldn't necessarily
think someone who puts it at 20% is unreasonable, but if you're going
below 10% or especially below 1%, I
want to hear your reasoning.

And it had better
not just be an argument about current work in AI missing 
◊link["http://www.timcrane.com/uploads/2/5/2/4/25243881/crane_on_cantwell_smith_on_ai.pdf"]{some} 
◊link["http://rebooting.ai/"]{crucial}
◊link["http://bayes.cs.ucla.edu/WHY/"]{feature} required for AGI,
since we'd need an additional argument
to think that crucial feature will remain
 out of reach for the next 200 years.

Take a look at what
◊link["https://deepmind.com/blog/article/muzero-mastering-go-chess-shogi-and-atari-without-rules"]{DeepMind}◊note{Here is Halpern:
"AlphaGo can best the most accomplished Go player in the world, but it can’t play chess, let alone write music or drive a car. Machine learning systems, moreover, are trained on datasets that are, by definition, limited. (If they weren’t, they would not be data◊em{sets}.)" 
I guess she didn't check what AlphaGo's successors 
do. AlphaZero (2017)
not only mastered Go but also chess (and shogi)
and was not trained on any dataset. 
 MuZero (2019) in addition mastered
57 Atari games, without datasets or handcoded game rules.}
	and ◊link["https://openai.com/blog/dall-e/"]{OpenAI} have been
up to recently.
And now think about what turned out not
to have been more than 200 years out of reach starting from 200 years ago.
We routinely convey lifelike sound
and moving pictures of
ourselves across the world, practically instantaneously, with
cheap handheld gadgets that at the same time present us with lifelike
sound and moving pictures of others from across the world.
For reference, the first permanent
photographs weren't taken until the 1820's◊note{The
	earliest surviving one:◊br{}
◊(img #:style "max-width:85%" #:src "first-photo.jpg")
◊br{}◊link["https://en.wikipedia.org/wiki/View_from_the_Window_at_Le_Gras"]{View from the Window at Le Gras (1827)}}
		and electric telegraphy
was barely on the horizon, becoming commercially viable only
in the late 1830's.

Given this, I don't think there's going to be a
 good enough argument for thinking that the chance of AGI within
 200 years must be 1% or less.
 Maybe some philosophical position you hold is incompatible
 with AGI. But even if it's a reasonable position, I doubt
 that it would be reasonable to 
 be so confident in it that your answer to the first
 question is some very small likelihood. 

And I think the answer to the second question is "A very small
likelihood is enough". 1% is enough, I think, and 10% certainly is,
let alone my 30% lowball.
I wouldn't dismiss answers as low as 0.001% as being too low
for these questions to matter,
either.
Why? First, for the sake of future humans.
One doesn't have to think a doomsday scenario is likely
to think that the expected impact of AGI on humanity and its
future is
enormous. 
Second, for the sake of the AI,
because if we bumble thoughtlessly
into making agents with at least as great a moral status as
our own, we risk committing
unimaginable moral horrors.◊note{Eric Schwitzgebel 
◊link["http://schwitzsplinters.blogspot.com/2021/09/the-full-rights-dilemma-for-future.html"]{discussed}
an interesting dilemma about this over at The Splintered
Mind last month.}

How high do the risk of these things have to be for us to take
them seriously? How likely
do they have to be for it to be a good idea to have
at least some people thinking
hard about them now and starting to 
create institutions to deliberate about and attempt
to reduce these risks? Very low. Well below 1 in 100.

Why would we need to start working on this now? Why not wait until
AGI is clearly close? At least in that case we won't waste any
effort or resources if this turns out not to happen.

Because philosophy takes a long time, as does
international institution building. 200 years isn't too long,
it may well be not long enough, and we may well not have even that long.
We should get going.

◊section{}
Nothing I'm saying here is new. Points like these 
◊link["https://intelligence.org/files/AIPosNegFactor.pdf"]{have}
◊link["http://consc.net/papers/singularity.pdf"]{been}
◊link["https://en.wikipedia.org/wiki/Superintelligence:_Paths,_Dangers,_Strategies"]{made}
by
◊link["https://en.wikipedia.org/wiki/Life_3.0"]{many}
◊link["https://slatestarcodex.com/2015/05/22/ai-researchers-on-ai-risk/"]{people},
◊link["https://en.wikipedia.org/wiki/Human_Compatible"]{time}
and
◊link["https://schneiderwebsite.com/artificial-you.html"]{time}
◊link["https://theprecipice.com/"]{again}.
But for reasons I won't speculate about here, they
have  not sunk in widely, and
those who hold positions like mine are often misinterpreted.

So to be clear, here are some things I'm not saying. 
I'm not saying AGI will definitely or even probably
appear in the next 10 years, or
the next
100 years, or ever.
I'm not saying there would definitely or even probably
be an intelligence explosion 
once there is AGI.
I'm not saying it would definitely be a disaster if
AGI appears before there's been a lot of relevant careful thought and
institution building.
I'm not saying (does anyone?),
as Crane suggests some of his opponents think, that
we need to solve moral issues surrounding AGI in order to address
the use of machine learning in healthcare or finance. 
I'm not saying that we should not be worried or not have
people working on the 
nearer term problems. 

I'm saying there's a significant enough chance that there will be
AGI within 200 years for us to take seriously the momentous but
currently unclear ethical implications this would have. 
The ethical issues to do with AGI are among
the real AI ethics questions, not a distraction from them.
I hope at least
some of the people getting all those jobs
will be working on them.
◊end{}



