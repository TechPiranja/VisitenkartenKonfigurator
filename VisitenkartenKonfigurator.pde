textField textFieldTest;
card myCard;
button myButton;
tabButton tabButtonTest;

slider sliderTest; 
slider sliderTestBG; 
slider cardWidth;
slider cardHeight;
PFont myFontUI; 
PImage apple; 
PImage metallBG;
PImage pappeBG;
PImage woodBG;
int scene;

void setup()
{
  size(1024,768);   
  scene = 0;
  String[] tabLabels = {"metall", "carton", "glass", "paper"}; 
  tabButtonTest = new tabButton(420, 580, 4, 202, 30, tabLabels);  //erzeugt ein tabButton Objekt mit an x: 720, y: 500, Anzahl der Tabs: 4, Breite: 202, Höhe: 30 und den in obigem Array gespreicherten Text Labels
  tabButtonTest.activeTab = 3;  
  sliderTest = new slider(100, 220, 200, 20);                      //erzeugt ein slider Objekt mit an x: 720, y: 450, Breite: 200, Höhe: 20 
  sliderTest.myValue = 0.5; 
  sliderTestBG = new slider(100, 120, 200, 20);
  sliderTestBG.myValue = 0.5;
  cardWidth = new slider(750,120,200,20);
  cardWidth.myValue = 0.5;
  cardHeight = new slider(750,220,200,20);
  cardHeight.myValue = 0.5;
  textFieldTest = new textField(420, 500, 200, 40, "test");  
  myButton = new button(800,700,170,44, "Edit Etui");
  myFontUI = createFont("lmmono10-regular.otf", 32);   
  apple = loadImage("apple.png");  
  metallBG = loadImage("metallBG.jpg");
  pappeBG = loadImage("pappeBG.jpg");
  woodBG = loadImage("woodBG.jpg");
}

void draw()
{      
  colorMode(RGB, 255, 255, 255);
  background(230); 
      
  if (scene == 0)
  {    
    textSize(30);
    colorMode(HSB, 360, 100, 100);  
    imageMode(CORNER);
    noTint();
    
    pushStyle();  
    fill(sliderTestBG.myValue * 360, 50, 90);
    imageMode(CENTER);
    if (tabButtonTest.activeTab == 0)
    {
    tint(sliderTestBG.myValue * 360, 50, 90);
    image(metallBG, 512,300, 10 + (int)(cardWidth.myValue * 360),10 + (int)(cardHeight.myValue * 360));
    }else if (tabButtonTest.activeTab == 1){
    tint(sliderTestBG.myValue * 360, 50, 90);
    image(pappeBG, 512,300, 10 + (int)(cardWidth.myValue * 360),10 + (int)(cardHeight.myValue * 360));
    }else if (tabButtonTest.activeTab == 2){
    tint(sliderTestBG.myValue * 360, 50, 90);
    image(woodBG, 512,300, 10 + (int)(cardWidth.myValue * 360),10 + (int)(cardHeight.myValue * 360));
    }
    else
    {
    myCard = new card(512,300, 10 + (int)(cardWidth.myValue * 360),10 + (int)(cardHeight.myValue * 360),10);
    myCard.draw();  
    }
    imageMode(CENTER);
    tint(sliderTest.myValue * 360, 50, 90);
    image(apple, 530, 310, 428/(3 /cardWidth.myValue), 525/(3/cardWidth.myValue));
    textAlign(CENTER);
    
    fill(0);
    text("Background", 182, 100);
    text("Width", 790, 100);
    text("Height", 800, 200);
    
    
    text(textFieldTest.myText, 500, 330);
    popStyle();  
    
    
    tabButtonTest.draw();    
    sliderTest.draw();
    sliderTestBG.draw();
    cardWidth.draw();
    cardHeight.draw();
    textFieldTest.draw();
    
    myButton.draw();
  if (myButton.pressed == 1)
    {
      if (scene == 0)
      scene = 1;
      else 
      scene = 0;
      myButton.pressed = 0;
    }
  }
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
  sliderTestBG.mousePressed();
  cardWidth.mousePressed();
  cardHeight.mousePressed();
  textFieldTest.mousePressed();
  myButton.mousePressed();
  
  //int lastPrintSizeSelection = tabButtonTest.activeTab;
  tabButtonTest.mousePressed();
}

void keyPressed() {
  textFieldTest.keyPressed();
}

void mouseDragged() {
  sliderTest.mouseDragged();
  sliderTestBG.mouseDragged();
  cardWidth.mouseDragged();
  cardHeight.mouseDragged();
}

void mouseReleased() {
  sliderTest.mouseReleased();
  sliderTestBG.mouseReleased();
  cardWidth.mouseReleased();
  cardHeight.mouseReleased();
}
