# What

A simple Perl script to demonstrate the 'match' card game to recruiters. (See task definition).

# Installing

There are two options for getting the script.

### 1. Download with git CLI
```bash
> git clone https://github.com/shotlom/perl_match.git
```

### 1. Download zip from URL

Either navigate to the following or use the download button on this screen.
https://github.com/shotlom/perl_match/archive/master.zip

# Running

The script takes two command line parameters as follows.

```bash
>perl ./match.pd --packs [2..n] --match [face,suit,both]
```

And produces a different result each time:
[report](./report.jpg)


# The task

Simulate a card game called "Match!" between two computer players using N
packs of cards (standard 52 card, 4 suit packs). The "Match!" matching condition
can be the face value of the card, the suit, or both. The program should ask:

1. how many packs of cards to use (N)
1. which of the three matching conditions to use

and then run a simulation of the cards being shuffled then played from the top of
the pile. When two matching cards are played sequentially, a player is chosen
randomly as having declared "Match!" first and takes ownership of all cards
played in that run. Play continues until the pile is completely exhausted (any
cards played without ending in a "Match!" at the time the pile is exhausted are
ignored). Tally up the total number of cards each player has accumulated and
declare the winner/draw
