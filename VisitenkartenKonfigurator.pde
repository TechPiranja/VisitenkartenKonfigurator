ArrayList<dragText> dragTextList = new ArrayList<dragText>();
ArrayList<dragText> dragTextListEtui = new ArrayList<dragText>();
ArrayList<dragImage> dragImageList = new ArrayList<dragImage>();

textField textFieldTest;
toggleButton toggleMask;
toggleButton toggleLabel;

card myCard;
card transCard;
card transCard2;
card transCard3;
card transCard4;

button changePage;
button addDragText;
button addDragImage;

tabButton tabButtonTest;
tabButton etuiColorTab;

slider sliderTest; 
slider sliderTestBG; 
slider cardWidth;
slider cardHeight;
slider etuiColor;

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
PImage etuiWhole;
PImage etuiTopClap;
PImage curCard;
PImage gravur;

int scene;

void setup()
{
  size(1024,768, P3D);   
  scene = 0;
  String[] tabLabels = {"metall", "carton", "glass", "paper"}; 
  String[] colorLabels = {"Silver", "RGB"}; 
  tabButtonTest = new tabButton(350, 560, 4, 500, 30, tabLabels);
  tabButtonTest.activeTab = 3; 
  etuiColorTab = new tabButton(608, 100, 2, 250, 30, colorLabels);
  etuiColorTab.activeTab = 0;
  
  toggleMask = new toggleButton(490, 710);
  toggleLabel = new toggleButton(170, 630);
  
  transCard = new card(780, 90, 230, 300, 10);
  transCard2 = new card(328, 530, 550, 225, 10);
  transCard3 = new card(585, 35, 405, 158, 10);
  transCard4 = new card(20, 600, 700, 150, 10);
  
  cardWidth = new slider(795, 150, 200, 12, false);
  cardWidth.myValue = 0.5;
  cardHeight = new slider(795, 250, 200, 12, false);
  cardHeight.myValue = 0.25;  
  sliderTestBG = new slider(795, 250, 200, 12, true);
  sliderTestBG.myValue = 0.5;
  sliderTest = new slider(795, 350, 200, 12, true);
  sliderTest.myValue = 0.5; 
  etuiColor = new slider(608, 150, 200, 12, true);
  etuiColor.myValue = 0;
  textFieldTest = new textField(350, 630, 200, 40, "test");    
  
  addDragText = new button(600,630,120,40, "Add Text");
  addDragImage = new button(600, 702, 120, 40, "Add Image");
  changePage = new button(945,702,50,40, ">");
  
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
  etuiWhole = loadImage("etuiWhole.png");
  etuiTopClap = loadImage("etuiTopClap.png");
  smooth(8);
  textSize(30);
}

void draw()
{        
  colorMode(RGB, 255, 255, 255);  
  changePage.changeLabel(scene == 0 ? ">" : "<");
  //------------------------ SCENE 0 ------------------------
  if (scene == 0)
  {   
    background(240); 
    createTransCardForEtui();
    
    addDragText.xPos = 600;
    addDragText.yPos = 630;
    textFieldTest.xPos = 353;
    textFieldTest.yPos = 630;
    
    colorMode(HSB, 360, 100, 100);  
    imageMode(CORNER);
    noTint();
    image(bottom, -210, -115, 1022*1.3, 680*1.3);  
    
    for(int i = 0; i < dragImageList.size(); i++) {
      dragImageList.get(i).BGmask = get(dragImageList.get(i).xPos, dragImageList.get(i).yPos, 100, 100);
    }
    
    pushStyle();  
    fill(sliderTestBG.myValue * 360, 50, 90);
    if (tabButtonTest.activeTab == 0) {
      image(metallBG, 320 - (int)(cardWidth.myValue * 360)/7, 180 - (int)(cardWidth.myValue * 360)/7 ,  220 + (int)(2.5 *( cardWidth.myValue * 90)),  140 + (int)(1.2 * (cardWidth.myValue * 90)));
    } else if (tabButtonTest.activeTab == 1) {
      image(pappeBG, 320 - (int)(cardWidth.myValue * 360)/7, 180 - (int)(cardWidth.myValue * 360)/7 ,  220 + (int)(2.5 *( cardWidth.myValue * 90)),  140 + (int)(1.2 * (cardWidth.myValue * 90)));
    } else if (tabButtonTest.activeTab == 2) {
      image(woodBG, 320 - (int)(cardWidth.myValue * 360)/7, 180 - (int)(cardWidth.myValue * 360)/7 ,  220 + (int)(2.5 *( cardWidth.myValue * 90)),  140 + (int)(1.2 * (cardWidth.myValue * 90)));
    } else {
      tint(sliderTestBG.myValue * 360, 50, 90);
      rectMode(CORNER);
      myCard = new card(320 - (int)(cardWidth.myValue * 360)/7, 180 - (int)(cardWidth.myValue * 360)/7 ,  220 + (int)(2.5 *( cardWidth.myValue * 90)),  140 + (int)(1.2 * (cardWidth.myValue * 90)),0);
      myCard.draw();  
    }
    imageMode(CENTER);
    tint(sliderTest.myValue * 360, 50, 90);
    
    
    tint(sliderTest.myValue * 360, 50, 90);    
    for(int i = 0; i < dragImageList.size(); i++) {
      if(dragImageList.get(i).mask == false) dragImageList.get(i).draw();
    }  
    for(int i = 0; i < dragTextList.size(); i++) {
    dragTextList.get(i).draw();
    }
    for(int i = 0; i < dragImageList.size(); i++) {
      if(dragImageList.get(i).mask) dragImageList.get(i).draw();
    }    
    
    textAlign(CENTER);
    
    fill(0, 0, 100, 150);
    transCard.draw();
    transCard2.draw();    
    
    fill(0);   
    textSize(32);
    text("Size", 830, 130);
    pushStyle();
    fill(0);   
    textSize(22);
    text((220 + (int)(2.5 *( cardWidth.myValue * 90))) + "x" + (140 + (int)(1.2 * (cardWidth.myValue * 90))), 954, 130);
    popStyle();
    text("Background", 880, 230);
    text("Design", 846, 330);
    text("Emboss", 402 ,730);
        
    popStyle();  
    image(topHand, -210, -115, 1022*1.3, 680*1.3);  
    tabButtonTest.draw();       
    sliderTest.draw();
    sliderTestBG.draw();
    cardWidth.draw();
    //cardHeight.draw();
    textFieldTest.draw();    
    addDragText.draw();     
    addDragImage.draw();
    toggleMask.draw();
       
    if (addDragText.pressed == 1)
    {
      dragText t = new dragText(400, 250, textFieldTest.myText);
      dragTextList.add(t);
      addDragText.pressed = 0;
    }
    if (addDragImage.pressed == 1)
    {
      dragImage i = new dragImage(530, 310, 100, 100, "circle.png", toggleMask.myStateActive); 
      dragImageList.add(i);
      addDragImage.pressed = 0;
    }
  }
  //------------------------ SCENE 1 ------------------------
  else
  {
    background(255);
    noTint();
    image(etui, 50, 20, 920, 600);  
    etuiColorTab.draw();    
    if (etuiColorTab.activeTab == 1) etuiColor.draw();
    noStroke();
    beginShape();
    texture(curCard);
    vertex(200, 478, 0, 0);
    vertex(325, 575, 0, 140 + (int)(1.2 * (cardWidth.myValue * 90)));
    vertex(573, 458, 220 + (int)(2.5 *( cardWidth.myValue * 90)), 140 + (int)(1.2 * (cardWidth.myValue * 90)));
    vertex(446, 365, 220 + (int)(2.5 *( cardWidth.myValue * 90)), 0);
    endShape();
    
    colorMode(HSB, 360, 100, 100);  
    if (etuiColorTab.activeTab == 1) tint(etuiColor.myValue * 360, 50, 90);
    image(etuiWhole, 50, 20, 920, 600);
    noTint();
    noStroke();
    beginShape();
    texture(curCard);
    vertex(204, 302, 0, 0);
    vertex(300, 376, 0, 140 + (int)(1.2 * (cardWidth.myValue * 90)));
    vertex(550, 275, 220 + (int)(2.5 *( cardWidth.myValue * 90)), 140 + (int)(1.2 * (cardWidth.myValue * 90)));
    vertex(447, 200, 220 + (int)(2.5 *( cardWidth.myValue * 90)), 0);
    endShape();
    colorMode(HSB, 360, 100, 100);  
    if (etuiColorTab.activeTab == 1) tint(etuiColor.myValue * 360, 50, 90);
    image(etuiTop, 50, 20, 920, 600);  
    image(etuiTopClap, 50, 20, 920, 600);  
    
    fill(0, 0, 0, 20);
    transCard3.draw();
    transCard4.draw();
    toggleLabel.draw();
    
    colorMode(RGB, 255, 255, 255);  
    fill(0);
    text("Color", 608, 75);
    text("Label", 50, 650);
    
    
    if (toggleLabel.myStateActive)
    {
      addDragText.xPos = 280;
      addDragText.yPos = 680;
      textFieldTest.xPos = 50;
      textFieldTest.yPos = 680;
      addDragText.draw();  
      textFieldTest.draw();  
      
      colorMode(RGB, 255, 255, 255);  
      fill(255);
      noStroke();
      rect(490,620,210,110,0);
      
      for(int i = 0; i < dragTextListEtui.size(); i++) {
      dragTextListEtui.get(i).draw();
      }
    
      gravur = get(490, 620, 210, 110);
      noTint();   
      
      noStroke();
      beginShape();
      texture(gravur);
      vertex(566, 397, 0, 0);
      vertex(633, 442, 0, 110);
      vertex(773, 373, 210, 110);
      vertex(702, 332, 210, 0);
      endShape();   
    }  
    
    if (addDragText.pressed == 1)
    {
      dragText t = new dragText(750, 650, textFieldTest.myText);
      dragTextListEtui.add(t);
      addDragText.pressed = 0;
      print("test");
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

void mousePressed() {
  toggleLabel.mousePressed();
  toggleMask.mousePressed();
  etuiColor.mousePressed();
  sliderTest.mousePressed();
  sliderTestBG.mousePressed();
  cardWidth.mousePressed();
  cardHeight.mousePressed();
  textFieldTest.mousePressed();
  changePage.mousePressed();
  addDragText.mousePressed();
  addDragImage.mousePressed();
  
  for(int i = 0; i < dragTextList.size(); i++) {
    dragTextList.get(i).mousePressed();
  }  
  for(int i = 0; i < dragTextListEtui.size(); i++) {
    dragTextListEtui.get(i).mousePressed();
  }
  for(int i = 0; i < dragImageList.size(); i++) {
    dragImageList.get(i).mousePressed();
  } 
  
  tabButtonTest.mousePressed();
  etuiColorTab.mousePressed();
}

void keyPressed() {
  textFieldTest.keyPressed();
}

void mouseDragged() {
  etuiColor.mouseDragged();
  sliderTest.mouseDragged();
  sliderTestBG.mouseDragged();
  cardWidth.mouseDragged();
  cardHeight.mouseDragged();  
  
  for(int i = 0; i < dragTextList.size(); i++) {
    dragTextList.get(i).mouseDragged();
  }
  for(int i = 0; i < dragTextListEtui.size(); i++) {
    dragTextListEtui.get(i).mouseDragged();
  }
  for(int i = 0; i < dragImageList.size(); i++) {
    dragImageList.get(i).mouseDragged();
  } 
}

void mouseReleased() {
  etuiColor.mouseReleased();
  sliderTest.mouseReleased();
  sliderTestBG.mouseReleased();
  cardWidth.mouseReleased();
  cardHeight.mouseReleased();
  
  for(int i = 0; i < dragTextList.size(); i++) {
    dragTextList.get(i).mouseReleased();
  }
  for(int i = 0; i < dragTextListEtui.size(); i++) {
    dragTextListEtui.get(i).mouseReleased();
  }
  for(int i = 0; i < dragImageList.size(); i++) {
    dragImageList.get(i).mouseReleased();
  } 
}

void createTransCardForEtui()
{
  colorMode(HSB, 360, 100, 100);  
  for(int i = 0; i < dragImageList.size(); i++) {
    dragImageList.get(i).BGmask = get(dragImageList.get(i).xPos, dragImageList.get(i).yPos, 100, 100);
  }
 fill(sliderTestBG.myValue * 360, 50, 90);
    if (tabButtonTest.activeTab == 0) {
      image(metallBG, 320 - (int)(cardWidth.myValue * 360)/7, 180 - (int)(cardWidth.myValue * 360)/7 ,  220 + (int)(2.5 *( cardWidth.myValue * 90)),  140 + (int)(1.2 * (cardWidth.myValue * 90)));
    } else if (tabButtonTest.activeTab == 1) {
      image(pappeBG, 320 - (int)(cardWidth.myValue * 360)/7, 180 - (int)(cardWidth.myValue * 360)/7 ,  220 + (int)(2.5 *( cardWidth.myValue * 90)),  140 + (int)(1.2 * (cardWidth.myValue * 90)));
    } else if (tabButtonTest.activeTab == 2) {
      image(woodBG, 320 - (int)(cardWidth.myValue * 360)/7, 180 - (int)(cardWidth.myValue * 360)/7 ,  220 + (int)(2.5 *( cardWidth.myValue * 90)),  140 + (int)(1.2 * (cardWidth.myValue * 90)));
    } else {
      tint(sliderTestBG.myValue * 360, 50, 90);
      rectMode(CORNER);
      myCard = new card(320 - (int)(cardWidth.myValue * 360)/7, 180 - (int)(cardWidth.myValue * 360)/7 ,  220 + (int)(2.5 *( cardWidth.myValue * 90)),  140 + (int)(1.2 * (cardWidth.myValue * 90)),0);
      myCard.draw();  
    }
  tint(sliderTest.myValue * 360, 50, 90);    
  for(int i = 0; i < dragTextList.size(); i++) {
  dragTextList.get(i).draw();
  }
  for(int i = 0; i < dragImageList.size(); i++) {
  dragImageList.get(i).draw();
  }   
  noTint();
  curCard = get(320 - (int)(cardWidth.myValue * 360)/7, 180 - (int)(cardWidth.myValue * 360)/7 ,  220 + (int)(2.5 *( cardWidth.myValue * 90)),  140 + (int)(1.2 * (cardWidth.myValue * 90))); 
}
