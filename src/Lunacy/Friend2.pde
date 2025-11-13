class Friend2{
 // Member Variables
  int x, y;
  PImage sittingImage;
 //Constructor
  Friend2() {
    x = 500;
    y = 250;
    currentImage = loadImage("sittingImageF2.png");
   
  }
 // Member Methods
  void display() {
    imageMode(CENTER);
    image(currentImage, x, y);
  }
  void mousePressed(sanity) {
    if (mouseX > currentImage.X+100 && mouseX < currentImage.X-100 && mouseY > currentImage.Y+100 && mouseY < currentImage.Y-100){
      if (sanity>700){
        currentImage = loadImage("normalSanityF2.png");
      }else if (sanity=<700 && sanity>400){
        currentImage = loadImage("lowSanityF2.png");
      }else{
        currentImage = loadImage("incrediblyLowSanityF2.png");
      }
    }
  }
}
