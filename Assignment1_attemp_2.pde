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
  //background(0);
  drawHeader();
  
}//end draw()

void drawBorder()
{
  fill(164, 171, 181);
  //outer rect
  rect(padding, padding, width - (padding * 2),height - (padding * 2) );
  
  fill(92, 93, 94);
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
  float menuX = 100;
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
  fill(255, 238, 0);
  line(200,200,400,400);
  
  
}//end drawHeader()