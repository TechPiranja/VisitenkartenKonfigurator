class tabButton {
  int xPos = 0;
  int yPos = 0;
  int myWidth;
  int myHeight;
  int numOfTabs;
  color backgroundColor = color(30, 30, 30);
  color inactiveColor = color(150, 150, 150);
  color forgroundColor = color(200, 200, 200);
  int activeTab = 0;
  String[] mytextLabels;


  tabButton(int xPos, int yPos, int numOfTabs, int myWidth, int myHeight, String[] mytextLabels) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.numOfTabs = numOfTabs;
    this.myWidth = myWidth;
    this.myHeight = myHeight;
    this.mytextLabels = mytextLabels;
  }

  void draw() {
    pushMatrix();
    translate(xPos, yPos);
    noStroke();
    fill(backgroundColor);
    rect(0, 0, myWidth, myHeight, 8);
    fill(forgroundColor);
    for (int i = 0; i < numOfTabs; i++) {
      if (i == activeTab) {
        fill(forgroundColor);
      } else {
        fill(inactiveColor);
      }
      if (i == 0) {
        rect(0+2 + i * (myWidth-2)/numOfTabs, 0+2, (myWidth-4)/numOfTabs-2, myHeight-4, 5, 0, 0, 5);
      } else if (i == numOfTabs-1) {
        rect(0+2 + i * (myWidth-2)/numOfTabs, 0+2, (myWidth-4)/numOfTabs-2, myHeight-4, 0, 5, 5, 0);
      } else {
        rect(0+2 + i * (myWidth-2)/numOfTabs, 0+2, (myWidth-4)/numOfTabs-2, myHeight-4);
      }
      textFont(myFontUI);
      textAlign(LEFT, BASELINE);
      fill(backgroundColor);
      text(mytextLabels[i], 0+7 + i * (myWidth-2)/numOfTabs, myHeight-5);
    }
    popMatrix();
    
  }


  void mousePressed() {
    for (int i = 0; i < numOfTabs; i++) {
      if (insideRect(mouseX, mouseY, xPos+2 + i * (myWidth-2)/numOfTabs, yPos+2, (myWidth-4)/numOfTabs-2, myHeight-4)) {
        activeTab = i;
      }
    }
  }
}
