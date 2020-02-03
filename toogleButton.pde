class toggleButton {
  int myXPos = 0;
  int myYPos = 0;
  int myWidth = 60;
  int myHeight = 20;
  color backgroundColor = color(30, 30, 30);
  color forgroundColor = color(200, 200, 200);
  boolean myStateActive = false;

  toggleButton(int xPos, int yPos) {
    myXPos = xPos;
    myYPos = yPos;
  }

  void draw() {
    pushMatrix();
    translate(myXPos, myYPos);
    noStroke();
    fill(backgroundColor);
    rect(0, 0, myWidth, myHeight, 8);
    fill(forgroundColor);
    if (!myStateActive) {
      rect(0+2, 0+2, myWidth*0.6-4, myHeight-4, 5);
    }  else {
      rect(0+myWidth-myWidth*0.6+2, 0+2, myWidth*0.6-4, myHeight-4, 5);
    }
    popMatrix();
  }

  void mousePressed() {
    if (insideRect(mouseX, mouseY, myXPos, myYPos, myWidth, myHeight)) {
      myStateActive = !myStateActive;
    }
  }
}
