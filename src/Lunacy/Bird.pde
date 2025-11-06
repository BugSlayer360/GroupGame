class Bird {
  
  // Member Variables
  int x, y, w, speed;
  boolean left, evil;
  PImage bird, evilBird;
  
  // Constructors
  Bird() {

    // Checking Which Side Bird Spawns
    if(random(2)==1) {
      left = true;
    } else {
      left = false;
    }

    if(left == true) {
      x = int(random(-50,-10));
    } else {
      x = int(random(width/2+10,width/2+50));
    }

    w = 10;
    evil = false;
    y = int(random(0,height/2));
    speed = int(random(5,8));
    bird = loadImage("bird.png");
    evilBird = loadImage("evilBird.png");
  }

  // Member Methods
  void update() {
    if(left == true) {
      x+=speed;
    }
    if(right = true) {
      x-=speed;
    }
    
  }
  void display() {
    imageMode(CENTER);
    if (evil) {
      image(evilBird, x, y);
    } else {
      image(bird, x, y);
    }
  }

  boolean reachedSideRight() {
    if (x>width+w && left == true) {
      return true;
    } else {
      return false;
    } 
  }

  boolean reachedSideLeft() {
    if (x<0-w && left == false) {
      return true;
    } else {
      return false;
    }
  }
  
}

