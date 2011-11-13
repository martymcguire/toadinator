#!/usr/bin/env perl

use CGI::Simple;
use File::Temp ();
use FindBin qw($Bin); 

$OPENSCAD = "/usr/bin/openscad";
$WORKDIR = $Bin;
$WORKDIR =~ s/cgi-bin/work/;

$q = new CGI::Simple;
$bump_type = $q->param('bump-type');
$bump_count = $q->param('bump-count');
$bump_height = $q->param('bump-height');

$scadfile = File::Temp->new( UNLINK => 0, SUFFIX => '.scad', DIR => $WORKDIR);
$scad = <<END;
include <../scad/${bump_type}-period.scad>
include <../scad/spine.scad>
spine_with_teeth_and_height(${bump_count},${bump_height});
END
print $scadfile $scad;
close($scadfile);

$stlfile = $scadfile->filename;
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
