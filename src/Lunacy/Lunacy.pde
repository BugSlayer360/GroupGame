// Ender Hale, Nico Snow, Forrest Jefferson | November 6 2025 | Lunacy
BirdGame bg;

void setup() {
  size(500,500);
  bg = new BirdGame();
}

void draw() {
  background(135,206,235);
  bg.start();
  bg.update();
  //bg.keyPressed(char k);
}

void keyPressed() {
  
}
