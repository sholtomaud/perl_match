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
use Getopt::Long qw(GetOptions);

my ($number_of_packs, $match_conditions) = @ARGV;
my %packs;

my $source_address;
GetOptions('from=s' => \$source_address) or die "Usage: $0 --from NAME\n";
if ($source_address) {
    say $source_address;
}

my @suits = ("spades","hearts","diamonds","clubs");
my %face_values = ( k => "king", q => "queen", j => "jack", 10 => "ten", 9 => "nine", 8 => "eight", 7 => "seven", 6 => "six", 5 => "five", 4 => "four", 3 => "three", 2 => "two", a => "ace" );
my $pack_size = 52;
my %matches;

prepare_packs();
play();
report();

sub report {
    print "\nMATCHES\n";
    print "===========================\n";
    print "Card        | Packs     \n";
    print "---------------------------\n";
    foreach my $card ( keys %matches){
        print sprintf("%-11s", $card)," |";
        foreach my $pack (keys %{$matches{$card}}){
            print " $pack";
        }
        print "\n";
    }
    print "===========================\n\n";
}

sub play {
    foreach my $i (0 .. $pack_size-1) {
        my %check;
        foreach my $pack ( keys %packs ){
            # print $packs{$pack}[$i]{'value'};
            my $card = "$packs{$pack}[$i]{'value'} $packs{$pack}[$i]{'suit'}";
            if (defined $check{$card}){
                my $ke;
                foreach my $matchpack ( keys %{$check{$card}}){
                    $matches{$card}{$matchpack}++;
                    $matches{$card}{$pack}++;
                }
            }
            $check{$card}{$pack}++;
        }
    }
}

sub prepare_packs {
    for (my $i=1; $i <= $number_of_packs; $i++) {
        my @pack;
        foreach my $value ( keys %face_values ){
            foreach my $n (0 .. $#suits) {
                my %card;
                $card{'value'} = $value;
                $card{'suit'} = $suits[$n];
                push @pack, \%card;
            }
        }
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
