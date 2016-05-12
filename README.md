# The task

Simulate a card game called "Match!" between two computer players using N
packs of cards (standard 52 card, 4 suit packs). The "Match!" matching condition
can be the face value of the card, the suit, or both. The program should ask:

(i) how many packs of cards to use (N)
(ii) which of the three matching conditions to use

and then run a simulation of the cards being shuffled then played from the top of
the pile. When two matching cards are played sequentially, a player is chosen
randomly as having declared "Match!" first and takes ownership of all cards
played in that run. Play continues until the pile is completely exhausted (any
cards played without ending in a "Match!" at the time the pile is exhausted are
ignored). Tally up the total number of cards each player has accumulated and
declare the winner/draw
