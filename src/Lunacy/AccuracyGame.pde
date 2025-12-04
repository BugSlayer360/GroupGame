// This is all AI, just to fill in the class, Ender Hale will make it later | December 2 2025 | Lunacy

class AccuracyGame {
  float targetSize = 50;        // Size of the circle you need to press
  float shrinkingCircle = 200;  // How small the circle gets
  boolean active = false;       // Is the mini-game happening now?
  boolean success = false;      // Did the player succeed?
  char requiredKey;             // Which key the player needs to press

  // Method to start the mini-game
  void start() {
    active = true;
    shrinkingCircle = 200;
    success = false;
    char[] options = {'a', 's', 'd', 'f'}; // Keys to choose from
    requiredKey = options[int(random(options.length))]; // Pick one randomly
  }

  // Call this every frame to update the game
  void update() {
    if (!active) return; // If not active, do nothing
    shrinkingCircle -= 2; // Make the circle smaller
    if (shrinkingCircle < 0) {
      active = false; // End game if circle is too small
    }
  }

  // Draw the mini-game elements
  void display() {
    if (!active) return; // If not active, don't draw
    pushStyle();
    noFill();
    stroke(255);
    ellipse(width/2, height/2, targetSize, targetSize); // Outer circle
    stroke(255, 0, 0);
    ellipse(width/2, height/2, shrinkingCircle, shrinkingCircle); // Shrinking circle
    fill(255);
    textAlign(CENTER);
    textSize(32);
    text("Press: " + requiredKey, width/2, height/2 + 100);
    popStyle();
  }

  // Call this to check if the player pressed the correct key
  void checkKey(char keyPressed) {
    if (active) {
      if (keyPressed == requiredKey) {
        success = true;
        active = false; // End the mini-game when succeeded
        println("You pressed the right key!"); // For debugging
      }
    }
  }
}
