#!/usr/local/bin/perl

#########################
#
#   MATCH
#   Simulate the match
#   card game in perl
#
#   By Sholto Maud
#   12 May 2016
#   sholto.maud@gmail.com
#
#########################

use strict;
use warnings;
use Switch;
use POSIX;
use Data::Dumper;
use List::Util qw(max);
use List::Util qw( reduce );
use Getopt::Long qw(GetOptions);

my ($number_of_packs, $match_conditions,%packs);
GetOptions('match=s' => \$match_conditions,'packs=n'=>\$number_of_packs) or die "Usage: $0 --packs [2..n] --match [face,suit,both]\n";

my @suits = ("spades","hearts","diamonds","clubs");
my %face_values = ( k => "king", q => "queen", j => "jack", 10 => "ten", 9 => "nine", 8 => "eight", 7 => "seven", 6 => "six", 5 => "five", 4 => "four", 3 => "three", 2 => "two", a => "ace" );
my $pack_size = 52;
my %matches;

prepare_packs();
play();
report();

sub report {
    my @result;
    my $max = max values %matches;
    print "\nMATCH REPORT\n";
    print "===================================\n";
    print "Player# | Card count     \n";
    print "-----------------------------------\n";
    my $winnercount = 0;
    foreach my $player ( sort keys %matches){
        print sprintf("%7s", $player)," | $matches{$player}";
        print "\n";
        if ( $matches{$player} == $max){
            push @result, $player;
        }
    }
    print "===================================\n\n";
    my $declaration = ( $#result > 0 )? "Draw between " . join(' & ',@result) ."!" : "$result[0] is the winner!";
    print "$declaration\n\n";
}

sub play {
    foreach my $i (0 .. $pack_size-1) {
        my %check;
        foreach my $pack ( keys %packs ){
            # print "   Matching hand $i\r";
            my $matcher;

            switch ($match_conditions) {
        		case "face" {
                    $matcher = "$packs{$pack}[$i]{'value'}";
                }
        		case "suit" {
                    $matcher = "$packs{$pack}[$i]{'suit'}";
                }
        		case "both" {
                     $matcher = "$packs{$pack}[$i]{'value'} $packs{$pack}[$i]{'suit'}";
                }
            }

            if (defined $check{$matcher}){
                # Who wins?
                my $winner = ceil(rand($number_of_packs));
                $matches{$winner} += $number_of_packs;
            }
            $check{$matcher}{$pack}++;
        }
    }
    # print "\n";
}

sub prepare_packs {
    for (my $i=1; $i <= $number_of_packs; $i++) {
        # print "    Preparing pack $i\n";
        my @pack;
        foreach my $value ( keys %face_values ){
            foreach my $n (0 .. $#suits) {
                my %card;
                $card{'value'} = $value;
                $card{'suit'} = $suits[$n];
                push @pack, \%card;
            }
        }
        # print "    Shuffling pack\n";
        shuffle(\@pack);
        $packs{$i} = \@pack;
    }
}

# fisher_yates_shuffle from http://www.perlmonks.org/?node_id=199901
sub shuffle{
    my $deck = shift;
    my $i = @$deck;
    while ($i--) {
        my $j = int rand ($i+1);
        @$deck[$i,$j] = @$deck[$j,$i];
    }
}
