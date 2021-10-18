#lang pollen

◊(define-meta title "Reviewer Sabbaticals")
◊(define-meta published "2021-03-05")
◊(define-meta topics "academia")
◊(define-meta summary "An idea for improving academic publishing:
sabbaticals for reviewing")
◊(define-meta date "2021-03-05")
◊(define-meta month-day "03-05")
◊(define-meta update #f)
◊(define-meta feed-date "2021-03-05T17:46:36-05:00")
◊(define-meta uuid "2e88fbc0-7897-482f-9e03-65f2ec850fc4")


◊lead-in{How can we} make academic publishing better?
I was thinking a bit about this earlier in the week, prompted by
the ◊link["https://dailynous.com/2021/03/02/philosophy-journal-horror-stories/"]{journal horror stories} recounted on Daily Nous and
the thread about ◊link["https://news.ycombinator.com/item?id=26314397"]{paying peer reviewers
$450 a pop} on Hacker News.

I think I have a better idea
than paying per review:
offer sabbaticals for academics to spend a chunk
of their time reviewing and the rest of their time however 
they want. Fund reviewers, not reviews.◊note{Loosely inspired
by ◊link["https://doi.org/10.1038/477529a"]{proposals} to 
◊link["https://nintil.com/categories/fund-people-not-projects/"]{fund people, not projects}.}



◊section{Problems with Pay-Per-Review}

Many of academic publishing's problems come
down to lack of incentives for reviewers to (1) accept review 
requests, (2) do a good job on their reviews, and (3) complete
their reviews quickly.◊note{There are other problems, of
course, some of which might call for more radical
changes than those I'll be talking about. But even if we 
◊link["https://dx.doi.org/10.1093/bjps/axz029"]{should abolish 
pre-publication peer review}, it still seems that there will
be a need for post-publication peer review. So there'd
still be
reason to incentivize these things.}


Paying reviewers might help with each of these, assuming
that one gets paid less for late or poor reviews. But overall I don't
think it's a good idea.

One potential problem: where will the money come from? 

Of course Elsevier
and Springer and the like
◊link["https://www.theguardian.com/science/2017/jun/27/profitable-business-scientific-publishing-bad-for-science"]{make
absurd profits} that they could put
to good use by improving their product and compensating their laborers.
But... well, let's just say I'm not sanguine about that.
I suppose they could just raise their
prices to keep up their profits, but even that wouldn't
be easy to convince them to do. What's in it for them?

In any case, the bigger issue here
is that journals should
be free to read and publish in, but without a serious funding effort
such journals will not be able to pay their reviewers. 
And if the non-free journals start paying their reviewers,
the free journals will have an even harder time finding reviewers
than they already do, which will make them less attractive to
submit to, which will eventually make them less prestigious, 
which will make them even less attractive to submit to, and so on.
This would be bad.

I don't think we should reject the proposal on this basis,
though. We just have to add to it a requirement for a serious
funding effort on behalf of the free and open journals. It 
would be better to significantly improve academic
publishing without needing a serious funding effort, but
why think that's possible? Until someone suggests
a cheaper alternative, priceyness should not
knock the pay-reviewers-and-fund-open-journals
proposal out of the running.

The other problem, though, is worse:
money isn't that great of an incentive for getting academics
to review.

If you ask the declining reviewers why they decline,
the slow reviewers why they're slow, and the poor reviewers
why they didn't do a better job, I'd bet they wouldn't say "You get
what you pay for." They'd say they didn't have enough time.

That might be bullshit in many cases, and weak enough bullshit
for $450 to cut through in some. But in many other 
cases---I'd expect most---it
isn't. Getting an extra $450 isn't going let you spend less time
teaching or completing your administrative duties, and it shouldn't
get you to spend less time on your own research, at least if you don't
yet have tenure. So it's only good motivation for those who value
whatever non-work time they have at less 
than $450/(however many hours they take per review). I 
think this will not that big of a group, especially when intersected
with
those who get the most review requests. 

A high enough price could overcome
this. Pay someone enough to retire on and they'll
do the review on time. But I suspect that any
feasible price range will not improve things much. 

I also worry that in some cases paying for a timely review
might make things worse. Suppose you're a well-enough-paid academic
with lots of time commitments. You accept a review request
with the understanding that you get paid if you get it done within
4 weeks, but not otherwise. But as the weeks pass and 
obligations accumulate, you find yourself thinking "$450 would be
nice, but I'm just too busy for it to be worth it. I'll just finish
that review next month and not get paid." And then you might not feel so
bad about turning in a late review, since it feels to you like
you've shouldered some of the cost yourself and because the contract
allows you to submit late if you're willing to forgo the $450.
On top of that there's now no
longer any incentive to get the late review done quickly or well,
since they're already not paying you.
And I doubt imposing fines for late reviews
would fly. It'd just encourage a lot more declining and
hasty/sloppy reviewing.

So pay-per-review seems unlikely to improve things much,
even if you can get the money for it.



◊section{An Alternative: Reviewer Sabbaticals}

What's keeping academics from reviewing quickly enough,
 well enough, and, well,  enough
is that they don't have the time. So why not pay them with time?
Give them a reviewer sabbatical.

Suppose some time-pressured academics are offered not to be paid
per review on top of their other duties, but are instead given
a semester-long sabbatical to work on whatever they want with
no teaching or administrative duties, so long as they accept
~2 review requests per week and do the reviews quickly (like
within a week or two) and well.
Many would jump at the chance.

And this would do a lot of good. If there are
10 such sabbatical-reviewers in a 15-week semester, 
that's
~30 reviews each, so ~300 good, very quick reviews in a semester,
and ~600 in the year. This would at least put a dent in
philosophy's reviewing needs,◊note{It's hard to know how many total
reviews there are every year across all philosophy journals.
For a rough estimate
it's helpful to look at the ◊link["https://webapps.itcs.umich.edu/blogic/Imprint/submissions/statistics.php"]{stats}
that ◊link["https://ergosubmissions.org/statistics/last_12_months"]{some}
journals ◊link["https://philosophicalreview.org/statistics"]{provide}, but none report how many total reviews they
used per year.
I also suspect there should be more reviews than there are,
and the question we really want to answer is how
many reviews there ◊i{should} be every year, which is
of course even harder to estimate.}
 and of course going to 20 or 30
reviewers per
semester would be even better. Seems like a good idea to me.

◊p[#:style "margin-left:3em;"]{
◊emph{"But who is gonna
pay for it? How are the reviewers picked? Are researchers
too specialized for there to be 30 submissions in a 
semester that they can competently review? Would being
a sabbatical reviewer give one too much power in shaping
a subfield?"}
}

All good questions. Here are some first thoughts.



◊section{Who pays?}

Paying with time, as I'm proposing, is really just another
way of paying with money, since someone needs to pay the
reviewer's salary
(or at least a significant chunk of it) while they're on
their reviewer sabbatical. So where does that money come from?

Not the for-profit publishers, I assume. And
I'd rather the sabbaticals not come from them anyways,
since they'd probably require you
to review only for their own journals. Perhaps the publishers
can be
required to contribute to whoever else is paying, though, 
at least if they want to get reviews from the
 quick reviewing sabbaticalists.

Universities might be a better option.
I'd think they care somewhat about improving academic research
and the publishing process, so if they could be convinced
that giving out reviewer sabbaticals would do that, perhaps
they could be tempted. Especially if they're also convinced
that competitor universities will do the same.

But even if this could happen it'd probably be
only the rich universities that would be able to do it, which is not ideal
for various reasons. It would also be difficult
for universities to coordinate about various aspects of this
that we'd like to be coordinated. 

The best option, it seems to me, would be to have some central granting
agency fund the reviewer sabbaticals, with support from universities,
for-profit-publishers (while
they still exist), private foundations, and/or government funds.
The agency could issue
semester-long reviewer sabbatical grants to researchers at
any university, based on the expected quality of the reviewing
	and need for reviews within the researcher's 
research area(s).

How much would it cost? It depends. But with a 
$50,000 stipend for a semester, that's
$1M of grants per year
for the 10 reviewer sabbaticals per semester scenario.
There will also be operating costs
	and probably some additional costs 
that I haven't thought of, but this
gives us a sense of the order of magnitude. 
And it's loose change for the Harvards, 
Elseviers,  Templeton Foundations, and NEH/NSFs of the
world. 

My guess is that spending 
the marginal $1M in this way would do more to advance research
as a whole than the same money spent funding particular
researchers to pursue a specific projects.◊note{And my guess
is that this would be true up to, I dunno, maybe 
$5-10M a year for philosophy?
One would have to figure out how many reviews are needed per year
and how much value comes from funding traditional research projects,
among other things.}
 It would also
improve many researchers' lives, which is a nice bonus.
 		


◊section{Who gets the sabbaticals?}

Having a granting agency setup also helps with this
question. There would be some kind of review board
which would get information about and simple applications
from potential reviewer sabbiticalists, and distribute
funding for reviewer sabbaticals on this basis.

They would look 
for evidence  that a candidate
is a good reviewer. Editors can be
	giving out some kind of commendations to good
	reviewers or making nominations to help
	with this.◊note{Kind of like the British Journal
	of Philosophy of Science's
	◊link["http://www.thebsps.org/about/honorary-members/"]{Referee
	of the Year
	Awards}. More of this kind of thing should be 
	happening anyways.}
	Candidates can
	also submit the reviews they've produced and
	information about how quickly they completed them.
	A nice side effect is that this incentivizes good
	reviewing for those who aren't yet on a reviewer
	sabbatical but would like to get one.

They should also make sure that the candidate
is competent to review in an area broad
or popular enough to get enough submissions
to review in a single semester. If they aren't but are
otherwise a good candidate, perhaps funding a
	teaching reduction rather than a sabbatical
	would make sense. This deals with the question
	about researchers being too specialized to
	review 30 papers in a semester.
	
If there are too many candidates that clearly meet the criteria,
a lottery can decide who among them gets funded. This
might be complicated, since there will be various
overlapping mixes of reviewing competences among candidates
and different amounts
of need for reviews in different subfields, but I don't
see there being enough complication here to sink the proposal.



◊section{Too Much Power?}

Hopefully the process of reviewing the reviewers would eliminate
the worst cases of biased reviewing. Even so, one concern about
the proposal is that it will give a small number of people a lot
of influence over a subfield. If someone reviews 30 papers in their
niche in  a single semester,
they might have more influence over its direction for the
year than we would want. 

I'm not too worried about this, though. 
We can require that the sabbaticalists not re-review
submissions for multiple journals. So they can keep a given paper
out of at most one journal. And since most journals will require
two reviews for acceptance, they won't have all that much power
in getting submissions accepted.
Second, given that their influence wouldn't be very strong, 
a semester isn't a long time for exerting influence.
Third, I assume (associate) editors at popular journals already
have more influence than what a sabbatical reviewer would have,
even a repeat sabbatical reviewer.



◊section{}

I'm sure there are a lot of complications that
I haven't thought of and 
I wouldn't be too surprised if there's some
deep flaw I've missed. 
But even if there isn't,
I have no idea how to make the proposal really happen.
Anybody know someone who is or can influence someone
with plenty of spare millions that they'd want
to use to aid philosophical research?
◊end{}

