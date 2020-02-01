
class slider {
  int xPos = 0;
  int yPos = 0;
  int myWidth;
  int myHeight;
  color backgroundColor = color(30, 30, 30);
  color forgroundColor = color(200, 200, 200);
  float myValue = 1.0;
  boolean dragState = false;

  slider(int xPos, int yPos, int myWidth, int myHeight) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.myWidth = myWidth;
    this.myHeight = myHeight;
  }

  void draw() {
    pushMatrix();
    translate(xPos, yPos);
    noStroke();
    fill(backgroundColor);
    rect(0, 0, myWidth, myHeight);
    drawColorgradient();
    fill(forgroundColor);
    stroke(backgroundColor);
    strokeWeight(2);
    colorMode(HSB, 1, 100, 100);
    fill(myValue, 50, 90);
    rect(0 + (myWidth - myHeight) * myValue, 0 - myHeight * 0.5, myHeight, myHeight*2, 5);
    popMatrix();
  }

  void drawColorgradient() {
    for(int i = 0; i < myWidth-4; i++) {
      noStroke();
      colorMode(HSB, myWidth-4, 100, 100);
      fill(i, 50, 90);
      rect(2+i, 2, 1, myHeight-4);
    }
  }
  
  void mousePressed() {
    if (insideRect(mouseX, mouseY, xPos, yPos, myWidth, myHeight)) {
      dragState = true;
      myValue = constrain((mouseX - xPos)/float(myWidth), 0, 1);
    }
  }

  void mouseDragged() {
    if (dragState) {
      myValue = constrain((mouseX - xPos)/float(myWidth), 0, 1);
    }
  }

  void mouseReleased() {
    dragState = false;
  }
}
