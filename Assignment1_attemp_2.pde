/*
  C15737505 
  Object Oriented Programming Assignment 1
  Ronan Connolly

*/

//global variables
float padding;
float centerX;
float centerY;
int rowCount;
float maxStarX;
float maxStarY;



//fader and fader variables
float faderX;
float faderY;
int faderWidth;
int faderHeight;
color faderColor;

//objects
Fader fader;


//tables
Table table;

//arrays
String[] menuArray = new String[5];
ArrayList<Star> stars = new ArrayList<Star>();

void setup()
{
  size(1000,600);
  
  //init variables
  padding = 10;
  centerX = width / 2;
  centerY = height / 2;
  
  //read data from file 
  table = loadTable("Stars.csv", "header");
  rowCount = table.getRowCount();
  loadData();
  
  //get max and min values of stars X and Y
  starMaxMin();
  //set up fader
  //Do these have to be global???
  faderX = 60;
  faderY = height - 50;
    
  faderWidth = 125;
  faderHeight = 20;
  color faderColor = color(0,102,102);
  
  //init fader
  fader = new Fader(faderX, faderY,faderWidth, faderHeight,faderColor);  
  
  
}//end setup()

void draw()
{
  background(0);
  
  //printStars();
  drawStarGrid();
  strokeWeight(0);
  drawLeftMenu();
  drawHeader(); 
  drawFader();
  clickStar();
  
  
  
  
}//end draw()

void loadData()
{
    for(TableRow row : table.rows())
    {
        Star s = new Star(row);
        
        stars.add(s);
    }
  
}//end loadData()

void printStars()
{
     for(int i = 0; i < stars.size();i++)
    {
        println(stars.get(i));
        
    }
    
}//end prinStars()

void drawStarGrid()
{
  
  float gridX = width /  2;
  float gridY = padding * 3;
  
  int gridBorder = 50;
  
  float grid_width = gridX - gridBorder;
  float grid_height = height / 2;
  
  int rect_size = 25;
  
  //draw Border around grid
  stroke(98,117,8);
  strokeWeight(3);
  noFill();
  rect(gridX - 2, gridY - 2, grid_width + 2, grid_height -20);

  
  //print grid 
  for( int i = (int)gridX ; i < width - gridBorder; i = i + rect_size)
  {
      for(int j = (int)gridY; j < height / 2; j = j + rect_size)
      {
       stroke(0, 55, 255);
       strokeWeight(1);
       fill(0);
       rect(i,j, rect_size, rect_size);
       
       //debug
       //println("i: " + i + "j: " + j);
      }
  }  
  
  
  //draw the stars
  int crossWidth = 4;
  
  for(int i = 0; i < stars.size();i++)
  {
    
    fill(255);
    
    float mappedX = map(stars.get(i).x, 0, maxStarX, gridX, width - gridBorder);
    float mappedY = map(stars.get(i).y, 0, maxStarY, gridY, height / 2);
    
    //uncomment to see star positions
    //strokeWeight(5);
    //stroke(255);
    //point(mappedX, mappedY);
    
    //draw crosses
    stroke(255);
    line(mappedX - crossWidth, mappedY, mappedX + crossWidth, mappedY);
    line(mappedX, mappedY - crossWidth, mappedX, mappedY + crossWidth);
    
    //print cirlce
    noFill();
    ellipse(mappedX, mappedY, stars.get(i).size,stars.get(i).size);
    textAlign(CENTER);
    text(stars.get(i).name, mappedX + 10, mappedY + 20);
  }

}//end drawStarGrid

void clickStar()
{
    for(int i = 0; i < stars.size();i++)
    {
       stars.get(i).update();
    }
  
  
}//end clickStar()



void starMaxMin()
{
  //find max X
  maxStarX = stars.get(0).x;
   for(int i = 0; i < stars.size();i++)
  {
    if(stars.get(i).x > maxStarX)
    {
      maxStarX = stars.get(i).x;
      
    }
    
  }
  
  //find max Y

  maxStarY = stars.get(0).y;
  for(int i = 0; i < stars.size();i++)
  {
    if(stars.get(i).y > maxStarY)
    {
      maxStarY = stars.get(i).y;
      
    }
    
  }
  
}//end max

void drawBorder()
{
  //fill(164, 171, 181);
  //outer rect
  rect(padding, padding, width - (padding * 2),height - (padding * 2) );
  
  //fill(92, 93, 94);
  //inner rect
  rect(padding * 2, padding * 2, width - (padding * 4),height - (padding * 4) );
  
}//end drawBorder()


void drawHeader()
{
  //background(0);
  float menuX = 100;
  float lineX = menuX;
  float space = (width - padding) / menuArray.length;
  
 
  
  //DO this better!
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
    fill(98,117,8);
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

void drawFader()
{
    //This is messy and could be cleaned up
    //back panel variables
    float panelX = 50;
    float panelY = height / 2;
    
    int panelHeight = 275;
    int panelWidth = 150;
    
    //padding of box/panel/rect around the fader
    float bottomPadding = (height / 2) - panelHeight;
    float sidePadding = (panelWidth / 2) + panelX;
    
    
    
    //fader variables
    /*
    float faderX = panelX + 10;
    float faderY = height - 50;
    
    int faderWidth = 125;
    int faderHeight = 20;
    color c = color(0,102,102);
    */
    
    
    //create Fader object
    //happeing each frame and reseting the faders Y value??---Has to be done in setup()
   // Fader fader = new Fader(faderX,faderY,faderWidth, faderHeight,c);
    
    //draw fader background
    stroke(98,117,8);
    noFill();
    rect(panelX, panelY, panelWidth,panelHeight);
    
    //draw line
    
    line(sidePadding, panelY + 25, (panelWidth / 2) + panelX, (height - bottomPadding) - 25);
    
    //draw fader 
    
    fill(fader.c);
    fader.update();
    fader.render();
    fader.leftMenuLight();
    
    
  
   
  
  
}//end draw()Throttle