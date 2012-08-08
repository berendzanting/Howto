#!/usr/bin/perl

my $a = 0;
my $b = 1;
my $c = 1;

while($a < 10000)
{
  $c = $a + $b;
  $a = $b;
  $b = $c;
  print "$c\n";
}
