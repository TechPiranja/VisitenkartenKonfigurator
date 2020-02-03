class button {
  int xPos = 0;
  int yPos = 0;
  int myWidth;
  int myHeight;
  String label;
  color backgroundColor = color(80, 80, 80);
  color inactiveColor = color(150, 150, 150);
  color forgroundColor = color(200, 200, 200);
  int pressed = 0;


  button(int xPos, int yPos, int myWidth, int myHeight, String label) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.myWidth = myWidth;
    this.myHeight = myHeight;
    this.label = label;
  }

  void draw() {
    pushMatrix();
    translate(xPos, yPos);
    noStroke();
    fill(backgroundColor);
    rect(0, 0, myWidth, myHeight, 8);
    fill(forgroundColor);
    textFont(myFontUI);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(label,myWidth/2, myHeight/2);
    fill(backgroundColor);    
    popMatrix();    
  }


  void mousePressed() {
      if (insideRect(mouseX, mouseY, xPos, yPos, myWidth, myHeight)) { //<>//
        pressed = 1;
      }
  }
  
  void changeLabel(String label)
  {
    this.label = label;
  }
}
