module period(a,f){
  linear_extrude(height = 16, center = false, convexity = false, twist = 0)polygon(points=[[0,0],[f/2,a],[f,0]], paths=[[0,1,2]]);
}