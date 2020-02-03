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
PImage circle;

//2 Scene
PImage etui;
PImage etuiTop;
PImage etuiTopClap;
PImage curCard;

int scene;

dragImage ii;
dragImage ii2;

void setup()
{
  size(1024,768, P3D);   
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
  circle = loadImage("circle.png");
  
  //2 Scene
  etui = loadImage("etui.jpg");
  etuiTop = loadImage("etuiTop.png");
  etuiTopClap = loadImage("etuiTopClap.png");
  
  ii = new dragImage(530, 310, 100, 100, "circle.png", true);  
  ii2 = new dragImage(300, 310, 100, 100, "circle.png", false);  
  smooth(8);
  textSize(30);
}

void draw()
{      
  colorMode(RGB, 255, 255, 255);
  background(255); 
      
  if (scene == 0)
  {    
    colorMode(HSB, 360, 100, 100);  
    imageMode(CORNER);
    noTint();
    image(bottom, -210, -115, 1022*1.3, 680*1.3);  
    
    ii.BGmask = get(ii.xPos, ii.yPos, 100, 100);
    ii2.BGmask = get(ii2.xPos, ii2.yPos, 100, 100);
    
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
      myCard = new card(320 - (int)(cardWidth.myValue * 360)/5, 180 - (int)(cardHeight.myValue * 180)/2 , 150 + (int)(cardWidth.myValue * 360), 150 + (int)(cardHeight.myValue * 180),0);
      myCard.draw();  
    }
    imageMode(CENTER);
    tint(sliderTest.myValue * 360, 50, 90);
    
    
    //circle.mask(maskImage);
    //test.mask(circle);  
    ii.draw();
    ii2.draw();
    
    //image(test, mouseX, mouseY,100, 100);
    
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
    
    curCard = get(320 - (int)(cardWidth.myValue * 360)/5, 180 - (int)(cardHeight.myValue * 180)/2 , 150 + (int)(cardWidth.myValue * 360), 150 + (int)(cardHeight.myValue * 180));
     
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
  else
  {
    image(etui, 50, 70, 920, 600);  
    
    noStroke();
    beginShape();
    texture(curCard);
    vertex(200, 528, 0, 0);
    vertex(325, 625, 0, 150 + (int)(cardHeight.myValue * 180));
    vertex(573, 508, 150 + (int)(cardWidth.myValue * 360), 150 + (int)(cardHeight.myValue * 180));
    vertex(446, 415, 150 + (int)(cardWidth.myValue * 360), 0);
    endShape();
    
    noStroke();
    beginShape();
    texture(curCard);
    vertex(204, 352, 0, 0);
    vertex(300, 426, 0, 150 + (int)(cardHeight.myValue * 180));
    vertex(550, 325, 150 + (int)(cardWidth.myValue * 360), 150 + (int)(cardHeight.myValue * 180));
    vertex(447, 250, 150 + (int)(cardWidth.myValue * 360), 0);
    endShape();
    
    //text(mouseX, 100, 100);
    //text(mouseY, 100, 120);
    
    image(etuiTop, 50, 70, 920, 600);  
    image(etuiTopClap, 50, 70, 920, 600);  
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
  
  //make list out of them!
  ii.mousePressed();
  ii2.mousePressed();
  
  for(int i = 0; i < dragTextList.size(); i++) {
    dragTextList.get(i).mousePressed();
  }
  
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
  
  //make list out of them!
  ii.mouseDragged();
  ii2.mouseDragged();
  
  for(int i = 0; i < dragTextList.size(); i++) {
    dragTextList.get(i).mouseDragged();
  }
}

void mouseReleased() {
  sliderTest.mouseReleased();
  sliderTestBG.mouseReleased();
  cardWidth.mouseReleased();
  cardHeight.mouseReleased();
  
  //make list out of them!
  ii.mouseReleased();
  ii2.mouseReleased();
  
  for(int i = 0; i < dragTextList.size(); i++) {
    dragTextList.get(i).mouseReleased();
  }
}
