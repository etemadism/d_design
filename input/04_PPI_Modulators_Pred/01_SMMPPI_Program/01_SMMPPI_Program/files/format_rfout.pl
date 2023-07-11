#!/usr/bin/perl
use warnings;
($file)=@ARGV;
#To convert weka-Random forrest output format into svmlight output format
open(FH,"$file") || die "cant find 'rfout' file\n";
open(FL,"> $file.out") || die "cant find 'rfout' file\n";
print FL "predictions,labels\n";
while(<FH>)
{
	chomp;
	if($_ eq '' or $_ =~ /\=\=\=/ or $_ =~ /inst#/)
	{next}
	$_ =~ s/^\s+//;
	$_ =~ s/\+//;
	my @tm = split(/\s+/);
	shift @tm;
	pop @tm;
	my @t1 = split(/:/,$tm[1]);
	my @t2=split(/:/,$tm[0]);
        #print "@tm","\n";
	if($t1[1]==-1)
	{
		print FL "-$tm[2],$t2[1]","\n";
	}else
	{
		print FL "$tm[2],$t2[1]","\n";
	}
}
close(FH);
exit;
