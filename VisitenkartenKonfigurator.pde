ArrayList<dragText> dragTextList = new ArrayList<dragText>();
textField textFieldTest;
card myCard;
card transCard;
card transCard2;
button changePage;
button addDragText;
tabButton tabButtonTest;
slider sliderTest; 
slider sliderTestBG; 
slider cardWidth;
slider cardHeight;
PFont myFontUI; 
PImage bottom;
PImage metallBG;
PImage pappeBG;
PImage woodBG;
PImage topHand;
int scene;
PImage apple;

PImage test;
PGraphics maskImage;
dragImage ii;

void setup()
{
  size(1024,768);   
  scene = 0;
  String[] tabLabels = {"metall", "carton", "glass", "paper"}; 
  tabButtonTest = new tabButton(350, 630, 4, 500, 30, tabLabels);
  tabButtonTest.activeTab = 3; 
  
  transCard = new card(780, 90, 230, 400, 10);
  transCard2 = new card(332, 530, 677, 225, 10);
  cardWidth = new slider(795, 150, 200, 20);
  cardWidth.myValue = 0.5;
  cardHeight = new slider(795, 250, 200, 20);
  cardHeight.myValue = 0.25;  
  sliderTestBG = new slider(795, 350, 200, 20);
  sliderTestBG.myValue = 0.5;
  sliderTest = new slider(795, 450, 200, 20);
  sliderTest.myValue = 0.5; 
  textFieldTest = new textField(350, 560, 200, 40, "test");  
  
  changePage = new button(828,702,170,40, "Edit Etui");
  addDragText = new button(600,560,170,40, "Add Text");
  
  myFontUI = createFont("lmmono10-regular.otf", 32);   
  metallBG = loadImage("metallBG.jpg");
  pappeBG = loadImage("pappeBG.jpg");
  woodBG = loadImage("glass.png");
  bottom = loadImage("bottom.jpg");
  topHand = loadImage("TopHand.png");  
  apple = loadImage("apple.png");
  ii = new dragImage(530, 310, 428/5, 525/5, "wApple.png");  
  
  maskImage = createGraphics(200,220);
  maskImage.beginDraw();
  maskImage.rect(500, 350, 400, 300);
  maskImage.endDraw();
  apple.resize(200, 220);
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
    image(bottom, -210, -115, 1022*1.3, 680*1.3);  
    test = get(mouseX, mouseY, 200, 220);
    
    pushStyle();  
    fill(sliderTestBG.myValue * 360, 50, 90);
    if (tabButtonTest.activeTab == 0) {
      image(metallBG, 320 - (int)(cardWidth.myValue * 360)/5, 180 - (int)(cardHeight.myValue * 180)/2 , 150 + (int)(cardWidth.myValue * 360), 150 + (int)(cardHeight.myValue * 180));
    } else if (tabButtonTest.activeTab == 1) {
      image(pappeBG, 320 - (int)(cardWidth.myValue * 360)/5, 180 - (int)(cardHeight.myValue * 180)/2 , 150 + (int)(cardWidth.myValue * 360), 150 + (int)(cardHeight.myValue * 180));
    } else if (tabButtonTest.activeTab == 2) {
      image(woodBG, 320 - (int)(cardWidth.myValue * 360)/5, 180 - (int)(cardHeight.myValue * 180)/2 , 150 + (int)(cardWidth.myValue * 360), 150 + (int)(cardHeight.myValue * 180));
    } else {
      tint(sliderTestBG.myValue * 360, 50, 90);
      rectMode(CORNER);
      myCard = new card(320 - (int)(cardWidth.myValue * 360)/5, 180 - (int)(cardHeight.myValue * 180)/2 , 150 + (int)(cardWidth.myValue * 360), 150 + (int)(cardHeight.myValue * 180),10);
      myCard.draw();  
    }
    imageMode(CENTER);
    tint(sliderTest.myValue * 360, 50, 90);
    
    
    apple.mask(maskImage);
    test.mask(apple);  
    ii.draw();
    noTint();
    image(test, mouseX, mouseY, 200, 220);
    
    for(int i = 0; i < dragTextList.size(); i++) {
    dragTextList.get(i).draw();
    }
    
    textAlign(CENTER);
    
    fill(0, 0, 100, 150);
    transCard.draw();
    transCard2.draw();
    
    fill(0);   
    textSize(32);
    text("Width", 834, 130);
    text("Height", 842, 230);
    text("Background", 874, 330);
    text("Design", 842, 430);
    
    popStyle();  
    image(topHand, -210, -115, 1022*1.3, 680*1.3);  
    tabButtonTest.draw();       
    sliderTest.draw();
    sliderTestBG.draw();
    cardWidth.draw();
    cardHeight.draw();
    textFieldTest.draw();    
    addDragText.draw();   
        
    if (addDragText.pressed == 1)
    {
      dragText t = new dragText(400, 250, textFieldTest.myText);
      dragTextList.add(t);
      addDragText.pressed = 0;
    }
  }
  
  changePage.draw();
  if (changePage.pressed == 1)
    {
      if (scene == 0)
      scene = 1;
      else 
      scene = 0;
      changePage.pressed = 0;
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
  changePage.mousePressed();
  addDragText.mousePressed();
  
  ii.mousePressed();
  
  for(int i = 0; i < dragTextList.size(); i++) {
    dragTextList.get(i).mousePressed();
  }
  
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
  
  ii.mouseDragged();
  
  for(int i = 0; i < dragTextList.size(); i++) {
    dragTextList.get(i).mouseDragged();
  }
}

void mouseReleased() {
  sliderTest.mouseReleased();
  sliderTestBG.mouseReleased();
  cardWidth.mouseReleased();
  cardHeight.mouseReleased();
  
  ii.mouseReleased();
  
  for(int i = 0; i < dragTextList.size(); i++) {
    dragTextList.get(i).mouseReleased();
  }
}
