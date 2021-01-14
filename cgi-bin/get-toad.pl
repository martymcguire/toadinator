#!/usr/bin/env perl

use CGI::Simple;
use File::Temp ();
use FindBin qw($Bin); 

$OPENSCAD = "/usr/bin/openscad";
$WORKDIR = $Bin;
$WORKDIR =~ s/cgi-bin/work/;

$q = new CGI::Simple;
my $bump_type   = $q->param('bump-type');
my $bump_count  = int($q->param('bump-count'));
my $bump_height = int($q->param('bump-height'));

# Sanitize inputs
my %valid_bump_types = (
  triangle => 1,
  sawtooth => 1,
  square   => 1
);
$bump_type   = ($valid_bump_types{$bump_type} == 1) ? $bump_type : 'triangle';
$bump_count  = (($bump_count >= 7) && ($bump_count <= 25)) ? $bump_count : 10;
$bump_height = (($bump_height >= 2) && ($bump_height <= 20)) ? $bump_height : 5;

my $scadfile = File::Temp->new( UNLINK => 0, SUFFIX => '.scad', DIR => $WORKDIR);
my $scad = <<END;
include <../scad/${bump_type}-period.scad>
include <../scad/spine.scad>
spine_with_teeth_and_height(${bump_count},${bump_height});
END
print $scadfile $scad;
close($scadfile);

my $stlfile = $scadfile->filename;
$stlfile =~ s/scad$/stl/;
system($OPENSCAD, "-s", $stlfile, $scadfile);

print "Content-Type: application/sla\n";
print "Content-Disposition: attachment; filename=spine-${bump_type}-${bump_count}_bumps-${bump_height}_tall.stl\n";
print "\n";
open(STL, "<$stlfile");
while(<STL>){
  print $_;
}
close(STL);
