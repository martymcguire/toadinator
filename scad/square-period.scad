module period(a,f){
  linear_extrude(height = 16, center = false, convexity = false, twist = 0)square([f/2,a],center =false);
}