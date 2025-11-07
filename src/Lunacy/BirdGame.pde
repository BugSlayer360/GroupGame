class BirdGame {

  // Member Variables
  ArrayList<Bird> birds = new ArrayList<Bird>();
  boolean inMiniGame;
  AccuracyGame accuracy;
  PVector crosshair;

  // Constructors
  BirdGame() {
    accuracy = new AccuracyGame();
    inMiniGame = true;
    crosshair = new PVector(width/2, height/2);
  }

  // Member Methods
  void start() {
    birds.clear();
    birds.add(new Bird());
  }

  void update() {
    if (!inMiniGame) return;

    // Update Crosshair to follow mouse
    crosshair.set(mouseX, mouseY);

    // Update and Draw Birds
    for (int i = birds.size() - 1; i >= 0; i--) {
      Bird b = birds.get(i);
      b.update();
      b.display();

      if (b.reachedSideRight() || b.reachedSideLeft()) {
        birds.remove(i);
        birds.add(new Bird());
      }
    }

    // Draw accuracy game if active
    if(accuracy.active) {
      accuracy.update();
      accuracy.display();
    }

    // Draw Crosshair
    pushStyle();
    stroke(0);
    strokeWeight(2);
    line(crosshair.x - 10, crosshair.y, crosshair.x +10, crosshair.y);
    line(crosshair.x, crosshair.y-10, crosshair.x, crosshair.y+10);
    popStyle();
  }

  void keyPressed(char k) {
    if (k == ' ') {
      accuracy.start();  // start the accuracy timing mini-game
    } else if (k == 27) { // escape key
      inMiniGame = false; // exit the mini-game
    }
  }

