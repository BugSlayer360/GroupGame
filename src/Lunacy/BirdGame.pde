class BirdGame {
  
  //member variables
  int x, y, speed, l;
  PImage bird, dimentedBird;
  
  // constructors
  l=int(random(1,3));
  if(l==1){
    x=-10;
  } else {
    x=width+10
  }
  y=int(random(0,width));
  speed=3
