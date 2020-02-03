class dragImage {
  int xPos = 0;
  int yPos = 0;
  int myValue = 0;
  float myWidth = 0;
  float myHeight = 0;
  String imagePath;
  boolean dragState = false;  
  boolean mask = false;
  PImage img;
  PImage BGmask;
  PGraphics maskImage;

  dragImage(int xPos, int yPos, float myWidth, float myHeight, String imagePath, boolean mask) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.myWidth = myWidth;
    this.myHeight = myHeight;
    this.imagePath = imagePath;
    this.img = loadImage(imagePath);
    this.mask = mask;
    
    if (mask)
    {
      // maskimage same h/w as image
      maskImage = createGraphics((int)myWidth,(int)myHeight);
      maskImage.beginDraw();
      maskImage.endDraw();
      img.resize(100,100);
    }    
  }
  
  void draw() {
    pushMatrix();
    translate(xPos, yPos);
    imageMode(CORNER);
    if (mask)
    {
      img.mask(maskImage);
      BGmask.mask(circle);  
    }
    noTint();
    image(BGmask, 0, 0, myWidth, myHeight);  
    popMatrix();
  }
    
  void mousePressed() {
    if (insideRect(mouseX, mouseY, xPos, yPos, (int)myWidth, (int)myHeight)) {
      dragState = true;
      print(myWidth);
    }    
  }

  void mouseDragged() {
    if (dragState) {
      xPos = mouseX - (int)(myWidth/2);
      yPos = mouseY - (int)(myHeight/2);
    }
  }

  void mouseReleased() {
    dragState = false;
  }
}
