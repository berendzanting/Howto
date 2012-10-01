#!/usr/bin/perl
# Synchronisation
my $command1 = $ARGV[0];
my $command2 = $ARGV[1];

# Argumenten: r = recursief, v = verbose, a = archive, n = dry-run
sub sync
{
  my($options, $source, $dest) = @_;
  system("rsync -$options --delete $source $dest");
}

sub interactive
{
  my($source, $dest) = @_;
  sync("rvan", $source, $dest);
  print "This was a dry-run (DRY-RUN).\n";
  print "Are you sure you want to (over)write [y,n]: ";
  my $answer=<STDIN>;
  if(($answer =~ /Y/)||($answer =~ /y/))
  {
    print "Press ctrl-Z and bg %1 to move the process to the backgroud.\n";
    sync("ra", $source, $dest);
    print "Sync done.\n";
  }
}

my $source="/home/backup/";
my $dest="rsync://nas/backup/backup/";
if(($command1 =~ "heiloo")||($command2 =~ "heiloo"))
{
  $source='/home/backup/';
  $dest='xxx@host:/home/backup/';
}

print "Syncing from $source to $dest\n";
if(($command1 =~ "go")||($command2 =~ "go"))
{
  sync("ra", $source, $dest);
}
else
{
  interactive($source, $dest);
}
