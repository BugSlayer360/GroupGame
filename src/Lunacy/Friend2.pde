class Friend2{
 // Member Variables
  int x, y;
  PImage sittingImage, fullSanityImage, moderateSanityImage, lowSanityImage;
 //Constructor
  Friend2() {
    x = 500;
    y = 250;
    sittingImage = loadImage("sittingImage.png");
    fullSanityImage = loadImage("fullSanityImage.png");
    moderateSanityImage = loadImage("moderateSanityImage.png");
    lowSanityImage = loadImage("lowSanityImage.png");
  }
 // Member Methods
  void display() {
    imageMode(CENTER);
    image(sittingImage, x, y);
  }
}
