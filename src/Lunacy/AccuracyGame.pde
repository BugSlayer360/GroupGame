// Ender Hale made this class | December 2 2025 | Lunacy

class AccuracyGame {

  // Member Variables
  float targetSize = 50;
  float shrinkingCircle = 200;
  boolean active = false;
  boolean success = false;
  char requiredKey;


  // Member Methods
  void start() {
    active = true;
    shrinkingCircle = 200;
    success = false;
    char[] options = {'a', 's', 'd', 'f'}; // Choosing Keys
    requiredKey = options[int(random(options.length))]; // Pick Random Key
  }

  void update() {
    if (!active) return;
    shrinkingCircle -= 2;
    if (shrinkingCircle < 0) {
      active = false;
    }
  }

  void display() {
    if (!active) return;
    pushStyle();
    noFill();
    stroke(255);
    ellipse(width/2, height/2, targetSize, targetSize);
    stroke(255, 0, 0);
    ellipse(width/2, height/2, shrinkingCircle, shrinkingCircle);
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("Press: " + requiredKey, width/2, height/2 + 100);
    popStyle();
  }

  void keyPressed(char k) {
    if (active && k == requiredKey) {
      if (abs(shrinkingCircle - targetSize) < 10) {
        success = true;
      }
      active = false;
    }
  }
}

