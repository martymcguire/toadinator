//side_with_holes();
middle_with_holes();

pin_offset = 30;

module side_with_holes(){
  difference(){
    side();
    translate([63, 12, pin_offset]) pin();
    translate([69, 71, pin_offset]) pin();
    translate([10, 71, pin_offset]) pin();
  }
}

module middle_with_holes(){
  difference(){
    middle();
    translate([63, 12, pin_offset]) pin();
    translate([69, 71, pin_offset]) pin();
    translate([10, 71, pin_offset]) pin();
  }
}

module middle(){
  import_stl("middle.stl");
}
module side(){
  import_stl("side.stl");
}
module pin(){
  rotate([0,180,0]) import_stl("trt_pinpeg_hole_negative_large.stl");
}