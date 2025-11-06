class Friend2{
 // Member Variables
  int x, y;
  PImage sittingImage, fullSanityImage, moderateSanityImage, lowSanityImage;
 //Constructor
  Friend2() {
    x = 500;
    y = 250;
    sittingImage = loadImage("sittingImage2.png");
    fullSanityImage = loadImage("fullSanityImage2.png");
    moderateSanityImage = loadImage("moderateSanityImage2.png");
    lowSanityImage = loadImage("lowSanityImage2.png");
  }
 // Member Methods
  void display() {
    imageMode(CENTER);
    image(sittingImage, x, y);
  }
}





