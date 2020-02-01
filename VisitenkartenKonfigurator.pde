textField textFieldTest;
card myCard;
button myButton;

slider sliderTest; 
PFont myFontUI; 
PImage apple; 
PImage top;

void setup()
{
  size(1024,768);    
  sliderTest = new slider(530, 80, 200, 20);                      //erzeugt ein slider Objekt mit an x: 720, y: 450, Breite: 200, Höhe: 20 
  sliderTest.myValue = 0.5; 
  textFieldTest = new textField(540, 400, 200, 40, "test");  
  myCard = new card(512,384,450,250,10);
  myButton = new button(550,480,170,44, "Create Text");
  myFontUI = createFont("lmmono10-regular.otf", 32);   
  apple = loadImage("apple.png");  
  top = loadImage("top.png");
}

void draw()
{      
  colorMode(RGB, 255, 255, 255);
  background(230);     
  
  colorMode(HSB, 360, 100, 100);  
  imageMode(CORNER);
  noTint();
  image(top, -180, -200, 1022*1.5, 680*1.5);
  
  //pushStyle();  
  //myCard.draw();    
  //popStyle();    
  
  imageMode(CENTER);
  tint(sliderTest.myValue * 360, 50, 90);
  image(apple, 630, 235, 428/5, 525/5);
  
  textAlign(CENTER);
  text(textFieldTest.myText, 630, 330);
  
  if (myButton.pressed == 1)
    {
      print("lol");
      myButton.pressed = 0;
    }
    
  myButton.draw();  
  sliderTest.draw();
  textFieldTest.draw();   
}

boolean insideRect(int xPos, int yPos, int targetXPos, int targetYPos, int targetWidth, int targetHeight) {
  if (xPos > targetXPos && xPos < targetXPos + targetWidth && yPos > targetYPos && yPos < targetYPos + targetHeight) {
    return true;
  }
  return false;
}

void mousePressed()
{
  sliderTest.mousePressed();
  textFieldTest.mousePressed();
  myButton.mousePressed();
}

void keyPressed() {
  textFieldTest.keyPressed();
}

void mouseDragged() {
  sliderTest.mouseDragged();
}

void mouseReleased() {
  sliderTest.mouseReleased();
}
