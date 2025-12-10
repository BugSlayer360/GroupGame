// Ender Hale made this class | Lunacy
// I helped! -Forrest
// Sure..... -Ender
// I did! - Forrest
class Bird {

  // ------------- Member Variables ---------------
  int x, y, w, h;
  float speed;
  boolean spawnLeft, evil;
  PImage bird, evilBird, dove, leftFacingBird;

  // Flight mode: 0=straight, 1=parabola, 2=wavy, 3=bezier
  int flightMode;

  // Parabola variables
  float a, b, c;

  // Sine variables
  float baseY, amplitude, frequency, t;

  // Bezier variables
  float startY, midY, endY, t2;




  // ------------- Constructor -------------
  Bird() {

    // Pick a random flight path
    flightMode = int(random(0, 4));

    // Checking Which Side Bird Spawns
    if (random(2) < 1) {
      spawnLeft = true;
      x = -50;
    } else {
      spawnLeft = false;
      x = width + 50;
    }

    // Set variables
    w = 50;
    h = 50;
    evil = false;
    speed = random(2, 7);

    bird = loadImage("bird.png");
    evilBird = loadImage("evilBird.png");
    dove = loadImage("dove.png");
    leftFacingBird = loadImage("leftFacingBird.png");

    bird.resize(w, h);
    evilBird.resize(w, h);
    leftFacingBird.resize(w, h);
    // dove.resize(w, h);

    // Setup curve variables based on the chosen flight mode
    setupFlightPath();
  }





  // ------------- Member Methods -------------

  // Sets up flight path variables depending on mode
  void setupFlightPath() {

    if (flightMode == 0) {
      // Straight
      y = int(random(50, 400));
    }

    if (flightMode == 1) {
      // Parabola
      a = random(-0.0005, 0.0005);
      b = random(-1, 1);
      c = random(100, 400);
      y = int(a*x*x + b*x + c);
    }

    if (flightMode == 2) {
      // Sine wave
      baseY = random(50, 400);
      amplitude = random(20, 80);
      frequency = random(0.03, 0.08);
      t = 0;
      y = int(baseY);
    }

    if (flightMode == 3) {
      // Bezier swoop
      startY = random(50, 400);
      midY = random(100, 400);
      endY = random(50, 450);
      t2 = 0;
      y = int(startY);
    }
  }





  void update() {

    // Horizontal movement
    if (spawnLeft == true) {
      x += speed;
    } else x -= speed;

    // Vertical movement by mode
    switch(flightMode) {

    case 1: // Parabola
      y = int(a*x*x + b*x + c);
      break;

    case 2: // Sine wave
      t += 0.1;
      y = int(baseY + sin(t * frequency) * amplitude);
      break;

    case 3: // Bezier swoop
      t2 += 0.005;
      t2 = min(t2, 1);
      y = int(
        (1-t2)*(1-t2)*startY +
        2*(1-t2)*t2*midY +
        t2*t2*endY
        );
      break;
    }
  }





  // Show bird depending on picture
  void display() {
    imageMode(CENTER);

    if (evil == true) {
      image(evilBird, x, y);
    } else if (spawnLeft == true) {
      image(bird, x, y);
    } else {
      image(leftFacingBird, x, y);
    }
  }


  // Has the bird passed the screen?
  boolean reachedSide() {
    if (x>width+w || x<0-w) {
      return true;
    } else {
      return false;
    }
  }
  
  
  boolean clicked(int tempX, int tempY) {
    if (tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      return true;
    } else {
      return false;
    }
  }
}
