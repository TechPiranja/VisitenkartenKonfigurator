class dragText {
  int xPos = 0;
  int yPos = 0;
  int myValue = 0;
  int myWidth = 0;
  int myHeight = 40;
  String text;
  boolean dragState = false;  

  dragText(int xPos, int yPos, String text) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.text = text;
    
    for (int i = 0; i < text.length(); i++) {
        myWidth += textWidth(text.charAt(i))+12;
    }
  }

  void draw() {
    pushMatrix();
    fill(0);
    textFont(myFontUI);
    textAlign(LEFT, BASELINE);
    translate(xPos, yPos);
    text(text, 10, 30);
    popMatrix();
  }
  
  void mousePressed() {
    if (insideRect(mouseX, mouseY, xPos, yPos, myWidth, myHeight)) {
      dragState = true;
      print(myWidth);
    }    
  }

  void mouseDragged() {
    if (dragState) {
      xPos = mouseX - 30;
      yPos = mouseY - 30;
    }
  }

  void mouseReleased() {
    dragState = false;
  }
}
