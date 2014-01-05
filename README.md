Morph
=====

Part of a research project with Dr. Greene at University of Wisconsin-Eau Claire
to identify common morphemes in a language, e.g. the German '*heit*' affix as in
*Freiheit* (freedom) and *Sicherheit* (security), or the English '*ter*' affix as
in *internal* or *enter*. Such common strings may not be etymologically related,
since languages grow organically and have no overseers during early development
who would ensure no collisions in the space of morphemes.

Frequently occuring substrings are identified by taking each substring of each word
in a large dictionary and counting the occurrences thereof. The resulting map can
be sorted as a list according to the occurrence count, or a weight may be given
as a coefficient to the substring's length or its frequency.

Usage
=====

`morph L F [files ...]`

where L is the length weight and F is the frequency weight. If no input files are
given, the program will read from stdin.

The weight function is as follows:

  weight(word, L, F) = L * length(word) + F * freq(word)

The main purpose of this function is to weed out shorter sequences of letters like
*an* or even *a* that will inevitably occur thousands of times more than *ana* or
*and*. For example, the words *anaglyph* and *anamorphosis* have *ana* occurring
twice between them, but *a* occurring four times.

Floating-point numbers may be used for L and F.

To sort only by a morpheme's frequency count, write `morph 0 x` where *x* is any
nonzero number. If *x* is positive, more frequent morphemes will be printed first.

To sort only by a morpheme's length, write `morph x 0`.

To skip sorting entirely, write `morph 0 0`. The resulting list of frequencies will
have an indeterminate order.

Future
======

I feel that this program would be vastly more useful with an interactive GUI.
Constantly rewriting terminal commands and piping them into less and grep with
different weights of L and F does not sound like a fun time. I have no experience
with GUI programming but I would like to explore this in the future.

Another possibility would be to allow the input list to have a second field for
each word, containing a multiplier for the frequencies it contributes to its
substrings' counts.
