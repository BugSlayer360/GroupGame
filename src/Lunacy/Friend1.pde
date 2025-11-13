class Friend1{
 // Member Variables
  int x, y;
  PImage sittingImage;
 //Constructor
  Friend1() {
    x = 0;
    y = 250;
    currentImage = loadImage("sittingImageF1.png");
   
  }
 // Member Methods
  void display() {
    imageMode(CENTER);
    image(currentImage, x, y);
  }
  void mousePressed(sanity) {
    if (mouseX > currentImage.X+100 && mouseX < currentImage.X-100 && mouseY > currentImage.Y+100 && mouseY < currentImage.Y-100){
      if (sanity>700){
        currentImage = loadImage("normalSanityF1.png");
      }else if (sanity=<700 && sanity>400){
        currentImage = loadImage("lowSanityF1.png");
      }else{
        currentImage = loadImage("incrediblyLowSanityF1.png");
      }
    }
  }
}
