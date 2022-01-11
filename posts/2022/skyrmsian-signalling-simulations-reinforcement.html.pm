#lang pollen

◊(define-meta title "Some Skyrmsian Signalling Simulations: Reinforcement Learning")
◊(define-meta feed-date "2022-01-11T22:12:54+01:00")
◊(define-meta uuid "c8ce8350-99e4-4f84-b03c-1aaf2e081ece")
◊(define-meta published "2022-01-11")
◊(define-meta date "2021-01-11")
◊(define-meta month-day "01-11")
◊(define-meta update #f)

◊(define schar "Simon")
◊(define rchar "Reese")
◊(define dest "Callias's house")
◊(define (strat . elements)
	`(span [[style "font-family: 'Roboto Mono'; font-weight: bold"]] ,@elements))

◊(script #:src "lib/p5.js")
◊(script #:src "lib/sender-receiver.js")


◊section{1. An Old Puzzle about Meaning, Rehashed}
◊sc{Sophistical ◊schar}: Very mysterious! You said you had no idea how to get
to ◊dest, yet you've driven us here on your first try
without a single missed turn. 

◊sc{Reasonable ◊rchar}: Are you joking? You gave me directions. I just turned "left"
when you said "left" and right when you said "right".

◊sc{◊schar}: But how did you know to go right when I said "right" and
left when I said "left"?

◊sc{◊rchar}: That's what those words mean. 

◊sc{◊schar}: Hm, yes I suppose they do. But 
why do those words mean that? Does the sound of
"left" somehow resemble the leftward turn?

◊sc{◊rchar}: Of course not. Words don't have to resemble
what they mean.
It's just a matter of more or less arbitrary convention that
we English speakers use "left" for left and "right" for right.

◊sc{◊schar}: And how did English speakers manage to coordinate that
"left" would mean left, "right" would mean right, and so on 
for all the other words?

◊sc{◊rchar}: Don't ask me; I wasn't there. I'm just using the
language as I found it.

◊sc{◊schar}: Well, it can't be that they did it like we did with
the driving, since we were relying on the conventions of 
English already being established.

◊sc{◊rchar}: I guess there was Middle English, and before that Old English, and ---

◊sc{◊schar}: Surely they didn't say, in Old English, "Let's use these
Middle English conventions instead".

◊sc{◊rchar}: No, but that's still where the meanings of "left" and
"right" probably came from. The sounds just drifted a bit.

◊sc{◊schar}: In any case, this won't help us with the real
mystery, since we can just ask the same question about all the preceding
languages.
How did the speakers of the first ones
manage to coordinate on the meanings of those?

◊sc{◊rchar}: Maybe they started with a simpler communication
system, a kind
of proto-language with pointing and stuff,
	and used that to establish the first real languages.

◊sc{◊schar}: Maybe. But that just pushes the question back again, right? 
How did the symbols (gestures, sounds, whatever)
of the proto-language come to have ◊emph{their}
meanings? At some point we need to give a different kind of 
answer.

◊sc{◊rchar}: Okay, whatever, you're right: very mysterious. Can
we go inside now? I've paid 50 drachma for this course and
don't want to miss the start.

◊section{2. Skyrms's Solution and Simulations}

In his wonderful book,
◊a[#:href "https://global.oup.com/academic/product/signals-9780199582945?"]{
◊emph{Signals: Evolution, Learning, and Information} (2010)},
Brian Skyrms gives the beginning of a different kind of answer
to this puzzle,
building on ideas from David Lewis's ◊a[#:href "https://www.abebooks.com/9780631232575/Convention-Philosophical-Study-Lewis-David-0631232575/plp"]{◊emph{Convention} (1969)}.
Skyrms shows how, starting from scratch,
very simple agents can spontaneously learn (or
evolve) to use meaningful symbols. 
In fact, it turns out that it is "easy to learn to 
signal" (p. 114).

Skyrms appeals to various simulations to make his case.
The simulations are described in a reasonable amount of detail
and graphs of the most relevant
data resulting from them are included.
This may be convincing enough, but
I think it can go by a bit too quickly for the lessons
to really sink in. 

I found myself wishing there were some simulations
online somewhere I could easily run for myself (and which my
students could run for themselves).
I couldn't find any, so I made some.◊note{Using JavaScript and 
the ◊a[#:href "https://p5js.org/"]{p5.js} library. If you want
to learn p5.js, I highly recommend Daniel Shiffman's 
◊a[#:href "https://thecodingtrain.com/learning/nature-of-code/"]{Nature
of Code 2.0} and other learning materials.}
The rest of this post
walks through a handful of them.

So let's build up to the puzzle about how meaning can originate, 
this time with some Skyrmsian simulations to go with it.

◊section{3. Sender-Receiver Games}

S can see where the target is, but cannot move. R can move, but cannot
see where the target is. Each round, S and R both get rewarded if R makes
it to the target and neither gets rewarded otherwise.

If there is no communication between them, R just has to guess where
to go, which in this setup will get about
a 50% success rate.◊note{If it's
not there already, you can speed it up with the slider beneath the
simulation. What's graphed
is the average success over the previous 100 rounds (or however many there have been, if fewer than 100).}

◊div[#:class "sketch-container"]{
◊div[#:id "sr-no-messages-div"]{
◊div[#:class "sketch-buttons"]{
◊button[#:class "sketch-button" #:id "no-mess-pb" #:onclick "playButton(this,sr_NoMessages)"]{Start} 
◊button[#:class "sketch-button" #:onclick "resetButton(sr_NoMessages)"]{Reset}
}
}
◊div[#:style "display: flex"]{Speed:
◊input[#:id "no-mess-slider" #:type "range" #:min "0" #:max "12" #:step ".25" #:value "0" #:content "Speed" #:class "slider"]
}}


But suppose S can send a message,
either a '◊strat{0}' or a '◊strat{1}', and that
R can receive this message.◊note{What
does it mean for S to send a message that R receives? In
this case, just that S and R each have a one digit "working memory",
that the symbol in the message S sends is determined by S's
working memory and when that message
reaches R, R's working memory digit will change. It in fact changes
to whichever digit the message displays, which in fact corresponds to
the digit in S's working memory. But things needn't be that way.
Everything that will follow would work just as
well even if the digit of the message (and in S's working memory) 
caused a different symbol to appear in R's working memory.
All that matters is that a '◊strat{0}' has one effect on R and a
'◊strat{1}' has a different one.}
Then our setup is what is called a sender-receiver game.◊note{Or
signalling game, or Lewis signalling game, or Lewis-Skyrms signalling game.}


On its own this won't do anything. If S sends messages 
randomly, they will do no better
than before. And even if S's messages are informative about where
the goal is, that won't help if R is still just guessing.
For the messages to help, S needs to send them in a way that conveys
information about where the goal is and R needs to base its 
decisions on what messages it receives.

In other words, for S's messages to function as signals,
both S and R need to pick reasonable ◊emph{strategies} about
how to act and stick to them.

For example, if S uses the ◊strat{[L🡒0, R🡒1]} strategy, then it will 
send a '◊strat{0}' whenever the goal is on the left,
	and a '◊strat{1}' whenever the goal
is on the right. If R is using the strategy that matches,
they'll succeed every time.

But there's nothing about a '◊strat{0}' that makes it intrinsically
well suited to mean left and nothing about '◊strat{1}' that makes it
intrinsically well suited to mean right. S could just as 
well use the ◊strat{[L🡒1, R🡒0]} strategy instead. And if R's strategy
matches, they will also succeed.◊note{And notice that if you pick
the anti-matched strategy, they will do much worse than 50%. This
is a good reminder that S and R here are extremely simple and
do no more than what we put in.} It is arbitrary which symbol
is used for left and which is used for right.


◊div[#:class "sketch-container"]{
◊div[#:id "sr-given-meaning-div"]{
◊div[#:class "sketch-buttons"]{
	◊button[#:class "sketch-button" #:onclick "playButton(this,sr_Given)"]{Start} 
	◊button[#:class "sketch-button" #:onclick "resetButton(sr_Given)"]{Reset}
}}
◊div[#:style "display: flex"]{Speed:
◊input[#:id "no-mess-slider" #:type "range" #:min "0" #:max "12" #:step ".25" #:value "0"]
}
◊div[#:style "display: flex; justify-content: space-evenly;"]{
◊form[#:class "strat-choice"]{S Strategy
◊label[#:class "strat-label"]{◊input[#:type "radio" #:name "ss" #:checked "" #:onclick "sSet(sr_Given,'random')"]{}[Random]}
◊label[#:class "strat-label"]{◊input[#:type "radio" #:name "ss" #:onclick "sSet(sr_Given,'L🡒0, R🡒1')"]{[L🡒0, R🡒1]}}
◊label[#:class "strat-label"]{◊input[#:type "radio" #:name "ss" #:onclick "sSet(sr_Given,'L🡒1, R🡒0')"]{[L🡒1, R🡒0]}}}
◊form[#:class "strat-choice"]{R Strategy
◊label[#:class "strat-label"]{◊input[#:type "radio" #:name "ss" #:checked "" #:onclick "rSet(sr_Given,'random')"]{}[Random]}
◊label[#:class "strat-label"]{◊input[#:type "radio" #:name "ss" #:onclick "rSet(sr_Given,'0🡒L, 1🡒R')"]{[0🡒L, 1🡒R]}}
◊label[#:class "strat-label"]{◊input[#:type "radio" #:name "ss" #:onclick "rSet(sr_Given,'1🡒L, 0🡒R')"]{[1🡒L, 0🡒R]}}}
}
}


So in in order to use messages to coordinate
R's movements with S's observations, S and R will need to
have coordinated on 
what those symbols mean. How can
they manage to do this if they don't already have some
meaningful symbols to communicate with? This was the puzzle.


◊section{4. Simple Reinforcement Learning}

Skyrms shows us how if S and R are reinforcement learners,
they can learn a signalling system together.

At its most basic,◊note{The reinforcement learning
that has been driving much of the impressive work in AI recently is
much more sophisticated.
There are loads of materials online for learning about this, many of them
closely following the popular textbook, ◊a[#:href "http://incompleteideas.net/book/the-book.html"]{Sutton and Barto (2018)}.
It is also usually uses neural networks, so that less needs to be
specified by hand. What we'll be doing is simple enough that this
would be more trouble than it's worth, but perhaps in a later post
I'll add simulations that use neural networks.} reinforcement learning amounts to 
the following:
◊ol{
◊li{Try something.}
◊li{If you got rewarded, be more disposed to do that same thing next time.}
◊li{Repeat.}
}

Now we'll introduce some very
simple reinforcement learning into our
simulations.

Let's choose S's strategy, like we did before, but then
let R learn what to do.

Instead of acting randomly, or having just one strategy
and sticking to it no matter what, R will act in
an intermediate way. Each round it will pick a strategy, not totally
randomly, but ◊emph{weighted} randomly, with one tendency to pick
one strategy and another to pick the other. 
Then, when R gets a reward from making it to the goal,
it can adjust the weights
so that it tends to pick that strategy 
more often in the future.

One way to picture this---which in fact corresponds closely to the 
naive way it is implemented
here---is to think of R as having a bag of strategies (maybe
written on little pieces of paper)
that it randomly draws from, starting off with one copy of each of the
two strategies in the bag. If a strategy doesn't work, nothing happens: 
the strategy is returned to the bag, and we're back where we started. 
If a strategy does work, though, 
R adds another copy of that strategy to the bag. And so when
R randomly draws next time, it has a greater chance than before
of drawing the strategy that had succeeded.

Simple enough, but surprisingly powerful, especially in
a setup as simple as ours:

◊div[#:class "sketch-container"]{
◊div[#:id "sr-rlearn-div"]{
◊div[#:class "sketch-buttons"]{
	◊button[#:class "sketch-button" #:onclick "playButton(this,sr_rLearn)"]{Start} 
	◊button[#:class "sketch-button" #:onclick "resetButton(sr_rLearn)"]{Reset}
}}
◊div[#:style "display: flex"]{Speed:
◊input[#:id "no-mess-slider" #:type "range" #:min "0" #:max "12" #:step ".25" #:value "0"]
}
◊div[#:style "display: flex; justify-content: space-evenly;"]{
◊form[#:class "strat-choice"]{S Strategy
◊label{◊input[#:type "radio" #:name "ss" #:checked "" #:onclick "sSet(sr_rLearn,'random')"]{}[Random]}
◊label{◊input[#:type "radio" #:name "ss" #:onclick "sSet(sr_rLearn,'L🡒0, R🡒1')"]{[L🡒0, R🡒1]}}
◊label{◊input[#:type "radio" #:name "ss" #:onclick "sSet(sr_rLearn,'L🡒1, R🡒0')"]{[L🡒1, R🡒0]}}}
}
}


As you can see, if S is sticking to one strategy for sending messages,
R can quickly learn how to react to them appropriately.◊note{What happens
if you switch S's strategy after a few hundred or 1000 rounds? Why is R's learning
different? How could we change the algorithm if we didn't want
this effect?}

Similarly we can fix only R's strategy and let S learn what signals
to send to get R to go towards the goal.
This is a little less intuitive---it feels odd that the receiver
can determine what the sender's messages will mean---but the
way it works is exactly the same, since S also gets rewarded when
R makes it to the goal.

◊div[#:class "sketch-container"]{
◊div[#:id "sr-slearn-div"]{
◊div[#:class "sketch-buttons"]{
	◊button[#:class "sketch-button" #:onclick "playButton(this,sr_sLearn)"]{Start} 
	◊button[#:class "sketch-button" #:onclick "resetButton(sr_sLearn)"]{Reset}
	}
}
◊div[#:style "display: flex"]{Speed:
◊input[#:id "no-mess-slider" #:type "range" #:min "0" #:max "12" #:step ".25" #:value "0"]
}
◊div[#:style "display: flex; justify-content: space-evenly;"]{
◊form[#:class "strat-choice"]{R Strategy
◊label{◊input[#:type "radio" #:name "ss" #:checked "" #:onclick "rSet(sr_sLearn,'random')"]{}[Random]}
◊label{◊input[#:type "radio" #:name "ss" #:onclick "rSet(sr_sLearn,'0🡒L, 1🡒R')"]{[0🡒L, 1🡒R]}}
◊label{◊input[#:type "radio" #:name "ss" #:onclick "rSet(sr_sLearn,'1🡒L, 0🡒R')"]{[1🡒L, 0🡒R]}}}
}
}


This is progress. It shows that S and R don't have to start out
already coordinated and they don't need us to choose both of their
strategies by hand. If one of them is already acting like the
messages already have certain meanings, the other can coordinate
with them without doing anything sophisticated.

But so far it has still involved one or the other 
of them taking the meanings as
given and having the other learn from them. 

If an aspiring signaller knows that their partner will be following their
lead, it might make sense to act as if the messages already have a certain meaning and wait for their partner
to catch on. But what if they don't know that?
Or what if they are too simple a creature to reason about how others will
be reacting to what they do?

Can we have ◊emph{both} S and R start out picking randomly and 
learning a signalling system through the kind of simple
reinforcement learning we've already seen, or do we need
to add something else to the mix?

Give it a few tries to see for yourself:
◊div[#:class "sketch-container"]{
◊div[#:id "sr-both-learn-div"]{
◊div[#:class "sketch-buttons"]{
	◊button[#:class "sketch-button" #:onclick "playButton(this,sr_bothLearn)"]{Start} 
	◊button[#:class "sketch-button" #:onclick "resetButton(sr_bothLearn)"]{Reset}
	}
	}
◊div[#:style "display: flex"]{Speed:
	◊input[#:id "no-mess-slider" #:type "range" #:min "0" #:max "12" #:step ".25" #:value "0"]
}
}

Given how utterly simple an algorithm S and R are following,
it's a bit surprising that this works so quickly and consistently.
How can it do so?

At the beginning S and R have a 50% of success per round.
Soon enough,
a pair of strategies will happen to work by luck. Maybe the goal was on the left, S picked ◊strat{[L🡒0, R🡒1]}, and R picked ◊strat{[0🡒L, 1🡒R]}.

Through reinforcement, S and R will be more likely to use those strategies in the future. They might sometimes get lucky with the other
strategy pair as well, evening the 
proportions back out. But even if so, eventually there
will be a period where one successful strategy pair comes up
enough times more
often than the other 
to open up a significant gap between them. From there
a positive feedback loop takes over, giving both S and R a strong
tendency towards their strategy in that initially
more successful strategy pair.

We can see, then, how 
behaviors that start out with no meaning
can be bootstrapped into meaningful signals
using only a simple learning
mechanism. Not only that, 
this learning mechanism is not specific to signalling, but,
in some form or other, is useful in
general and is pervasive among living things.

◊section{5. Less Help: Learning by Forgetting}

This puts a big dent in the puzzle, I think, but we shouldn't
stop here.
The setup for S and R is a very simple one, and some 
of the simplifications help make it a lot easier to get a
signalling system going. We don't want to know only how
meaning can emerge just in these easiest of circumstances,
so we should make things harder on S and R and see if this
approach still works.

Consider, for example, these strategies that S and R
are sampling from. We've limited them to two each, the two
that are sensible for signalling. We haven't, for example,
included the strategy ◊strat{[L🡒0, R🡒0]} for S or ◊strat{[0🡒L, 1🡒L]} for
R.◊note{Quick
exercise: why would these strategies be bad ones for signalling?}

If you know you're trying to signal, it makes sense not to consider
these as options. But what if you don't even know that signalling
is a possibility or would be a good thing?◊note{This was part of 
Rousseau's concerns about language origins:
"The first difficulty that arises is to imagine how languages could
have become necessary; for, Men [in the state of nature]
having no relations with one
another and no need of any, one cannot conceive the necessity or
the possibility of this invention if it was not indispensable"
◊emph{Second Discourse}, I.25 (trans. Gourevitch).
} Why should R rule out the possibility of doing the same thing
no matter what S does ahead of time?

Having seen the
success of the simple reinforcement we've been using,
it's worth giving it a shot
with these other strategies included to see what will happen:

◊div[#:class "sketch-container"]{
◊div[#:id "sr-all-strats-div"]{
◊div[#:class "sketch-buttons"]{
	◊button[#:class "sketch-button" #:onclick "playButton(this,sr_allStrats)"]{Start} 
	◊button[#:class "sketch-button" #:onclick "resetButton(sr_allStrats)"]{Reset}
	}
}
◊div[#:style "display: flex"]{Speed:
	◊input[#:id "no-mess-slider" #:type "range" #:min "0" #:max "12" #:step ".25" #:value "0"]
	}
}

Well, it sometimes it works within a couple thousand rounds.
But often it takes
longer to coordinate and in many cases there's no coordination
even in 50,000 rounds.◊note{I would need to make the simulations
more efficient to run them much past that.}

This is concerning. If a couple extra options make
learning this much harder here, how will the reinforcement
learning approach play out
for more realistic creatures and environments, where there
are way more than two ways to act, way more than two 
relevant states of the world, and way more than two agents interacting?

Rather than arguing abstractly about how big a problem this is,
I think the right reaction to this and similar problems arising
from adding different complexities is to try out different
kinds of learning algorithms to see if they'll do better.
After all, animals (and bacteria, for that matter), learn in 
much more sophisticated ways than what we've allowed S
and R. What changes to their learning
algorithms would make them better at learning to signal?

Plenty of options are worth exploring, but I'll just
mention one tweak which Skyrms discusses and which
happens to help: forgetting.

You might have noticed in the earlier simulations that
even when S and R have learned to coordinate on one strategy pair,
they each still have some small disposition to choose the other
strategies, which means their coordination will never be
total and every now and then they'll fail. We could change
the way their learning works so that these leftover
strategies will eventually be eliminated. Doing that 
helps when these extra strategies are present, too.

In the next simulation, S and R don't just add
new tokens to their
strategy bags, they also destroy some old ones. Once their total
number of strategy tokens reaches a certain threshold---I'll
call the Forgetting Point---they
randomly remove one token from their strategy bag each
round.◊note{I've set the Forgetting Point here at 64.
How can it be changed so that they'll learn faster? Is there
a trade-off here?}
◊div[#:class "sketch-container"]{
◊div[#:id "sr-forgetting-div"]{
◊div[#:class "sketch-buttons"]{
	◊button[#:class "sketch-button" #:onclick "playButton(this,sr_forgetting)"]{Start} 
	◊button[#:class "sketch-button" #:onclick "resetButton(sr_forgetting)"]{Reset}
	}
}
◊div[#:style "display: flex"]{Speed:
	◊input[#:id "no-mess-slider" #:type "range" #:min "0" #:max "12" #:step ".25" #:value "0"]
}
◊;◊label{Starting Strategies:
◊;◊input[#:type "number" #:value "4" #:min "4" #:max "4000" #:oninput "sr_forgetting.startStratNum = parseInt(this.value); sr_forgetting.startOver()"]{}}
◊label{Forgetting Point:
◊input[#:style "font-style: normal; background-color: white; border-width: .1rem;" #:type "number" #:value "64" #:min "2" #:max "10000" #:oninput "sr_forgetting.forgettingPoint = parseInt(this.value)"]{}}
}

Significantly better, though it still
takes more time than without the extra strategies.

◊section{6. Where to go from here?}

◊p[#:style "margin-left: 5rem"]{
"How do these results generalize? 
This is not so much a 
single question as an invitation to explore an emerging field"
(Skyrms 2010, p. 19).
}


There is plenty left to explore.  

You might be wondering whether signalling systems have to be learned,
	or whether they could also be evolved.
Evolution by natural selection
is remarkably similar to learning via reinforcement with forgetting.
This is not lost on Skyrms, and much of the book is about similar
results about the emergence of signalling through
evolution. Indeed, it was evolutionary game-theoretic work 
that came first.◊note{I plan to do another post at some point with
an evolutionary simulation you can play around with.}
One thing I myself would like to explore here is the combination:
signalling systems as they emerge in groups of evolved reinforcement
learners.

You probably also realize the signalling systems we've
seen so far are very minimal. They share some important
	and philosophically interesting features with human
language and other animal communication systems, but it doesn't
take much effort to think of many important and interesting features
which they lack.

So you might also want to explore questions about
how other aspects of human language (and other animal communication
systems) could have possibly emerged.  

If you want to get more seriously into those questions and
want to read work by philosophers
in this simulation-centric tradition, you should read Skyrms's
book and take a look at his
◊a[#:href "https://faculty.sites.uci.edu/skyrms/papers/"]{other
work}.

But you should also check out the research of◊ul{
	◊li{◊a[#:href "https://faculty.sites.uci.edu/jeffreybarrett/publications/"]{Jeffrey Barrett}}
	◊li{◊a[#:href "https://travislacroix.github.io/research/"]{Travis LaCroix}}
	◊li{◊a[#:href "https://faculty.sites.uci.edu/shuttegg/"]{Simon Hutteger}}
	◊li{◊a[#:href "http://cailinoconnor.com/research/"]{Cailin O'Connor}}
	◊li{◊a[#:href "https://manolomartinez.net/"]{Manolo Martínez}}
	◊li{◊a[#:href "https://www.shane.st/"]{Shane Steinert-Threlkeld}}
	◊li{◊a[#:href "https://eowagner.github.io/"]{Elliot Wagner}, and}
	◊li{◊a[#:href "https://www.kevinzollman.com/papers.html"]{Kevin Zollman}.◊note{If you think
I should add someone to the list, let me know!}}
	}
And you might also want to see the closely 
related work by linguists and psychologists,
like ◊a[#:href "https://arxiv.org/abs/2104.05857"]{Hawkins et al. (2021)}
(and its references). And for an
overview of recent work on emergent communication
by machine learning researchers, see 
◊a[#:href "https://arxiv.org/abs/2006.02419.pdf"]{Lazaridou and
Baroni (2020)}.

Finally, you might be worried that all of this must be on the wrong track,
at least as far as understanding human linguistic meaning is concerned.
You might think that while certain animal communication systems can
be understood in this bottom-up kind of way, genuine human
linguistic meaning cannot.
Perhaps there is an unbridgeable gulf between
the merely reactive animal (and machine) behavior and the creative,
rational, intentional, and normatively significant (etc.)
behavior of humans. And perhaps to understand
anything interesting 
about human meaning we must appeal to these special human traits.
If you have this kind of worry, you're in good philosophical 
company. But for arguments against them, see the work of
◊a[#:href "https://philpeople.org/profiles/ruth-garrett-millikan"]{Ruth Millikan} and
◊a[#:href "https://www.doritbar-on.com/publications.html"]{Dorit Bar-On}.

