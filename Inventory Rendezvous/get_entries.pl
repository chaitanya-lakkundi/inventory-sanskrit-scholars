#!/usr/bin/perl

use warnings;
use strict;

#open(names_FILE, $ARGV[0]);
open(names_FILE, "all_names");
open(out_FILE, ">output_entries");
my @all_names = <names_FILE>;

chomp(my $cur_name = shift @all_names);
my $next_name;
my @data = `cat *.txt.out.out.out`;
OUTER:
while (@all_names) {
    chomp($next_name = shift @all_names);
    my $bkp_name = $next_name;
    chop($next_name);   
#sometimes last character is hyphen(-) marking continuation to nextline
    print out_FILE "\n\nSTART ENTRY\n\n";
#    print "CUR NAME = $cur_name \n NEXT NAME = $next_name\n";
    print out_FILE "$cur_name\n";
    for (@data) {
        chomp(my $line = shift @data);
        my $bkp = $line;
        $line =~ s/ //g;
        $next_name =~ s/ //g;
        if($line =~ m/\Q$next_name\E/) {
            print out_FILE "\n\nEND ENTRY\n\n";
            $cur_name = $bkp_name;
            next OUTER;
        }
#        print $line,"\n";
        print out_FILE $bkp."\n";
    }
}
