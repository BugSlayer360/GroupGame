// Ender Hale made this class | December 2 2025 | Lunacy

class Bird {
  
  // Member Variables
  int x, y, w;
  float speed;
  boolean left, evil;
  PImage bird, evilBird;
    bird = loadImage("bird.png");
    evilBird = loadImage("evilBird.png"); //loadImage() called inside constructor could be inefficient if creating many birds
  
  // Constructors
  Bird() {

    // Checking Which Side Bird Spawns
    if(random(2)==1) {
      left = true;
      x = int(random(-50,-10));
    } else {
      left = false;
      x = int(random(width/2+10,width/2+50));
    }

    // Set variables
    w = 10;
    evil = false;
    y = int((x*x)/1028+x/2+random(200,400)); //I thought that the bird should swoop down. If you dissagree with me, tell me.
    speed = 1;
  }


  // Member Methods
  // Move the bird depending on side spawned
  void update() {
    if(left == true) {
      x+=speed;
    }
    if(left == false) {
      x-=speed;
    }
    
  }  
  // Show bird depending on picture
  void display() {
    imageMode(CENTER);
    if (evil) {
      image(evilBird, x, y);
    } else {
      image(bird, x, y);
    }
  }

  // Has the bird passed the screen?
  boolean reachedSideRight() {
    if (x>width+w && left == true) {
      return true;
    } else {
      return false;
    } 
  }

  // Has the bird passed the screen?
  boolean reachedSideLeft() {
    if (x<0-w && left == false) {
      return true;
    } else {
      return false;
    }
  }
  
}//reachedSideLeft/reachedSideRight could be simplified
