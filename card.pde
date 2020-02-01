class card {
  int xPos = 0;
  int yPos = 0;
  int myWidth;
  int myHeight;
  int corner;

  card(int xPos, int yPos, int myWidth, int myHeight, int corner) {
    this.xPos = xPos;
    this.yPos = yPos;
    this.myWidth = myWidth;
    this.myHeight = myHeight;
    this.corner = corner;    
  }
  
  void draw() {
  fill(255);
  rectMode(CENTER);
  noStroke();  
  rect(xPos,yPos,myWidth,myHeight,corner);
  }
}
