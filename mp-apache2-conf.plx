#!/usr/bin/perl
my $conf = "/etc/apache2/apache2.conf";
my @c = `cat $conf`;
my $name = `uname -n`; chomp $name;
die "$0: unable to determine ServerName. Stop\n" unless $name;
open(C,">$conf") || die "$0: unable to write to $conf. Stop.\n"; select C;
foreach (@c) {
    next if /^ServerName /;
    print;
    print "ServerName $name\n" if /ServerRoot /;
}
close(C);
1;
