// what kind of wave? this kind:
//include <tooth-period.scad>;
//include <triangle-period.scad>;
//include <square-period.scad>;

module spine_with_teeth_and_height(teeth, height){
  union(){
    spine();
    wave(teeth,height);
  }
}

module spine(){
	translate([0,-14,-4.5]) import_stl("../stl/spine.stl");
}

/*
 * numPeaks > 6
 * tweak amplitude based on numPeaks
 */
module wave(numPeaks, amplitude){
    //color([255,0,255]) cube([straight_length,2,16]);
    straight_length = 45;
    curve_len = 11;
    r = 41.75;
    half_d = r*3.14159265;
	frequency = (straight_length + curve_len) / numPeaks;
    straightPeaks = floor(straight_length / frequency);
    curvePeaks = floor(curve_len / frequency);
	for(i=[0:straightPeaks-1])
		color([0,0,255])translate([i*frequency,0,0]) period(amplitude,frequency);

   theta = (frequency / half_d) * 180;
   bonus_theta = ((straight_length - (frequency*straightPeaks)) / half_d) * 180;
   translate([39.68, -41.16]){
	 for(i=[0:curvePeaks]){
		rotate([0,0,(i*-theta) - 7 + bonus_theta]){
         translate([0,r*0.98,0]){
           period(amplitude,frequency);
         }
       }
     }
   }
}
