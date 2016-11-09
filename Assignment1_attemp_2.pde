/*
  C15737505 
  Object Oriented Programming Assignment 1
  Ronan Connolly

*/

//global variables
float padding;
float centerX;
float centerY;

//arrays
String[] menuArray = new String[5];

void setup()
{
  size(800,600);
  
  //init variables
  padding = 10;
  centerX = width / 2;
  centerY = height / 2;
  
  
  
}//end setup()

void draw()
{
  background(0);
  
  
  drawLeftMenu();
  drawHeader();
  
  
}//end draw()

void drawBorder()
{
  //fill(164, 171, 181);
  //outer rect
  rect(padding, padding, width - (padding * 2),height - (padding * 2) );
  
  //fill(92, 93, 94);
  //inner rect
  rect(padding * 2, padding * 2, width - (padding * 4),height - (padding * 4) );
  
}//end drawBorder()

void drawDisplay()
{
  float displayX = (width / 4) * 2;
  float displayY = padding * 3;
  float display_width = 250;
  float display_height = 250;
  
  rect(displayX, displayY, display_width, display_height);
  
  
  
}//end drawDisplay()

void drawHeader()
{
  //background(0);
  float menuX = 100;
  float lineX = menuX;
  float space = (width - padding) / menuArray.length;
  
 
  
  
  menuArray[0] = "Test";
  menuArray[1] = "Test";
  menuArray[2] = "Test";
  menuArray[3] = "Test";
  menuArray[4] = "Test";
  
  for(int i = 0; i < menuArray.length;i++)
  {
    fill(255);
    text(menuArray[i], menuX, padding);
    textAlign(CENTER);
    menuX = menuX + space; 
  }
  
    //draw bar under menu/header
    fill(215,255,0);
    //line doesnt change color???
    //line(lineX,20, width, 20);
    rect(lineX - 15,12, width - 120, 4);//hard coded until I figure out why line is not working
    
}//end drawHeader()

void drawLeftMenu()
{
   float menuY = padding * 3;
   float space = (height - padding) / 10;
   int count = 100;
   
   //varibales for small rects on the side
   float rectX = padding + 10;
   float rectY = padding + 10;
   int rectWidth = 15;
   int rectHeight = rectWidth / 2;
   
   for(int i = 0; i < height; i++)
   {
       text(count, padding, menuY);
       menuY = menuY + space;
       count = count - 10;
   }
   
  
  //draw rects
   for(int i = 0; i < height; i++)
   {
       fill(98,117,8);
       rect(rectX, rectY,rectWidth, rectHeight);
       rectY = rectY + 10;
   }
}//drawLeftMenu()