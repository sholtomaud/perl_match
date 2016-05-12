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
use Data::Dumper;

my ($number_of_packs, $match_conditions) = @ARGV;
print Dumper \@ARGV;

my %cards = (
        k => "king",
        q => "queen",
        j => "jack",
        10 => "ten",
        9 => "nine",
        8 => "eight",
        7 => "seven",
        6 => "six",
        5 => "five",
        4 => "four",
        3 => "three",
        2 => "two",
        1 => "ace"
);

my @suits = ["spades","hearts","diamonds","clubs"];

my %packs = {};

sub prepare_packs {
    for (my $i=0; $i <= $number_of_packs; $i++) {
       print "$i\n";
    }

}

sub shuffle_packs {

}

# foreach my $key ( keys %hash )
# {
#     if ( defined $mycard{'face_values'}{$card} || $mycard{'suits'}{$suit} ){
#             print "MATCH!\n";
#     }
#     else{
#         next;
#     }
#
# }

# print "key: $key, value: $hash{$key}\n";
print Dumper(\%cards);
