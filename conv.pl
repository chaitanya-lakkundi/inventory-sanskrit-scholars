#!/usr/bin/perl

# The extracted text from PDF file contains some special characters.
# To translate the special characters (with different font mapping) into unicode

open (FILE, $ARGV[0]);
open (MAP, "cmap");
open (OUT, "> $ARGV[0].out");

@data = <MAP>;
for $line (<FILE>) {
	for $conv (@data) {
		($findc, $repc) = split ("=", $conv);
		if ($line =~ m/$findc/) {
		    chomp($repc);
		    $line =~ s/$findc/$repc/g;
		}
	}
    print OUT $line;
}
