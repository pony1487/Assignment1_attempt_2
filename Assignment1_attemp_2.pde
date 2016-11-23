/*
  C15737505 
  Object Oriented Programming Assignment 1
  Ronan Connolly
  
  NOTE: Menu is buttons are slow to react to clicks

*/

 //audio stuff
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
AudioPlayer warp;
AudioPlayer sat_noise;


float volume;

//global variables
float padding;
float centerX;
float centerY;
int rowCount;
float rowCount2;
float maxStarX;
float maxStarY;
int mode;//used to switch between screens

float textX = 500;//used for scrolling readme
float textY = 600;

float dRainTextY;//used to scroll the text in the digitalRain Box

//use for trench function
float scalarX;
float scalarY;

//used to diplay each stars own array of planets
int starIndex;

//used for timer between transition and planet screen
int transTime;


color c;

//fader and fader variables
float faderX;
float faderY;
int faderWidth;
int faderHeight;
color faderColor;

//objects
Fader fader;
Fader fader2;
Button b;
Button b2;
Button b3;
DigitalRain dRain;


//button variables
float buttonX, buttonY;
int buttonWidth, buttonHeight;
float buttonSpacing;


//tables
Table table;


//arrays
String[] menuArray = new String[5];
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<Transition> trans = new ArrayList<Transition>();


void setup()
{
  size(1000,600);
  frameRate(30);
  mode = 0;
  
  //init variables
  padding = 10;
  centerX = width / 2;
  centerY = height / 2;
  c = color(216, 209, 0);
  
  //read data from file 
  table = loadTable("Stars.csv", "header");
  
  rowCount = table.getRowCount();
  loadData();
  
  //fill Transition array with random points
  initTransition();
  
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
  fader = new Fader(faderX, faderY,faderWidth, faderHeight,faderColor, "Volume"); 
  fader2 = new Fader(faderX + 250, faderY, faderWidth, faderHeight, faderColor, "Text Speed");
  
  //init buttons
  initButtons();
  
  //init digitalRain
  dRain = new DigitalRain( width/2.0, (height/2.0 + padding * 4),450,250);
  

  //init for trench function, multiply line x and y be this to increase size and make move
  scalarX = 0;
  scalarY = 0;
  
  //how long the transition screen will show for before moving to planet screen
  transTime = 120;
  
  //init audio stuff
  minim = new Minim(this);
 
  //Play space background noise
  song = minim.loadFile("spacewind.wav");
  warp = minim.loadFile("warpDriveEdited.mp3");
  sat_noise = minim.loadFile("sat_noise.mp3");

  song.play();
  
  volume = 0;
  
  //init text for Drain
  dRainTextY = 20;
  
}//end setup()

void stop( )
{
 
 song.close();
 warp.close();
 sat_noise.close();


}

void draw()
{
  background(0);
  
  //menu
  switch(mode)
  {
    case 0:
      //song.play();
      resetTransition();
      
      //slow to load and to change to this...
      drawSunAtBottom();
      drawMenu();
      drawStarsInBackground();
      break;
     case 1:
     
       drawReadMe();
       break;
    case 2:
    
      //reset audio
      warp.rewind();
      sat_noise.rewind();
      
      textSize(11);
      resetTransition();
      //printStars();
      drawStarGrid();
      strokeWeight(0);
      drawLeftMenu();
      drawHeader(); 
      drawFader();
      drawTrenchDisplay();
      drawDigitalRain();
      break;
    case 3:
       background(0);
       
       sat_noise.rewind();//makes the sound play again while going back and forth entween menus
       warp.play();
       drawTransition();
       
      break;
    case 4:
      
      warp.rewind();
      sat_noise.play();
      resetTransition();
       transTime = 120;//reset time
      drawStarsPlanets();
      break;
    case 5:
      exit(); 
      break;
      
    
  }
  
  
  
  
  
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
     //stars.get(0).printPlanets();
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
  stroke(c);
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
    //text(stars.get(i).name, mappedX + 10, mappedY + 20);
    
    
    //println("Mapped X in main: " + mappedX);
    //println("Mapped Y in main: " + mappedY);
    
    //give each star its mapped values
    stars.get(i).mappedX = mappedX;
    stars.get(i).mappedY = mappedY;
    
    //check for click on star
    stars.get(i).checkForClick();
  }
  
  //get the index of what star you are clicking so that it can be used to display the correct planets for that star
   for(int i = 0; i < stars.size();i++)
   {
       if(stars.get(i).isClicked == true)
       {
          //stars.get(i).drawPlanets();
          starIndex = i;
          println("i: " + starIndex);
          mode = 3;
       }
   }

}//end drawStarGrid





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
  
  //println("Max X from file: " + maxStarX);
  //println("Max Y from file: " + maxStarY);
}//end max




void drawHeader()
{
  //background(0);
  float menuX = 100;
  float lineX = menuX;
    
    //draw bar under menu/header
    stroke(98,117,8);
    strokeWeight(3);
    line(lineX,20, width -120, 20);
    //rect(lineX - 15,12, width - 120, 4);//hard coded until I figure out why line is not working
    
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
    
    
    
    //volume = map(fader.getFaderY(),  555, 320 - 8, 0, 100);
    volume = map(fader.getFaderY(),  500, 320 - 8, 0, 100);
    song.setGain(volume);
   
}//end drawFader()

void drawTrenchDisplay()
{
    
    //this is messy!!! Started to run out of time
    float x = 50;
    float y = padding * 3;
    float displayPadding = 100;
    float rectWidth = width / 2 - displayPadding;
    float rectHeight = height / 2 - (padding * 4);
    
    float centerX = rectWidth / 2 + x;
    float centerY =  rectHeight/ 2 + y;
    float centerRectWidth = 50;
    float centerRectHeight = 50;
    float floor1Y = 70;
    float floor2Y = 35;
    
    //moving line variables
    //left line
    float lineX1 = centerX - (centerRectWidth / 2);
    float lineY1 = centerY - (centerRectHeight / 2);
    float lineX2 = centerX - (centerRectWidth / 2);
    float lineY2 = centerY + (centerRectHeight / 2);
    
    //right line
    float lineX3 = centerX + (centerRectWidth / 2);
    float lineY3 = centerY - (centerRectHeight / 2);
    float lineX4 = centerX + (centerRectWidth / 2);
    float lineY4 = centerY + (centerRectHeight / 2);
    
    stroke(249, 242, 34);
    
    noFill();
    strokeWeight(2);
    //draw border
    rect(x,y,rectWidth,rectHeight);
  
    //draw center box
    //fill(0, 249, 4);
    //stroke(0, 249, 4);
     fill(0, 55, 255);
     stroke(0, 55, 255);
    ellipse(centerX,centerY,20,20);
    noFill();
    rect(centerX - (centerRectWidth / 2),centerY - (centerRectHeight / 2) , centerRectWidth, centerRectHeight);
    
    //stroke(0, 249, 4);
    stroke(0, 55, 255);
    //draw walls
    line(centerX - (centerRectWidth / 2),centerY - (centerRectHeight / 2), x, y);
    line(centerX + (centerRectWidth / 2), centerY - (centerRectHeight / 2), (rectWidth + x), y);
    
    line(centerX - (centerRectWidth / 2),centerY + (centerRectHeight / 2), x, (rectHeight + y));
    line(centerX + (centerRectWidth / 2), centerY + (centerRectHeight / 2), (rectWidth + x),  (rectHeight + y) );
   
    //draw floor
     line(centerX - 100,centerY + floor1Y,centerX + 100 , centerY + floor1Y );
     line(centerX - 40,centerY + floor2Y,centerX + 40 , centerY + floor2Y );
    //text("Star wars trench??", x + 100, y + 100);
    
    
    //draw Moving lines at side
    stroke(255,0,0);
    line(( lineX1 - scalarX), (lineY1 - scalarY), (lineX2 - scalarX), (lineY2 + scalarY));
    line(( lineX3 + scalarX), (lineY3 - scalarY), (lineX4 + scalarX), (lineY4 + scalarY));
  
    //change the values of x and y so it moves
     scalarY += 0.18;
     scalarX += 0.3;
     
     if( (lineX1 + scalarX > rectWidth)  || ( lineY1 + scalarY > rectHeight) ||  (lineX2 + scalarX > rectWidth)  || ( lineY2 + scalarY > rectHeight) )
     {
         scalarY = 0;
         scalarX = 0;
     }
}//end drawCircleDisplay

void initTransition()
{
  //fill array with random "stars"
  //I kept this sepearte from the star class
  for(int i = 0; i < 500; i++)
  {
      float x = random(0, width);
      float y = random(0, height);
      
      Transition t = new Transition(x,y);
      
      trans.add(t);
  }
  
}//end initTransition(0


void drawTransition()
{
    
    background(0);
      
    for(int i = 0; i < trans.size();i++)
    {
        trans.get(i).render();
    }
    
    transTime--;
    
    if(transTime == 0)
    {
       mode = 4; 
    }
    
}//end drawTransistion()


void resetTransition()
{
  background(0);
    
  for(int i = 0; i < trans.size();i++)
  {
      trans.get(i).resetTransition();
  }
}//end resetTransistion()

void drawStarsPlanets()
{ 
   
   fill(249, 242, 34);
   text("Click anywhere to go back", 100,50);
   //Draw stars in background
   drawStarsInBackground();
  
  
  //this stops the Transistion screen from affecting the planets borders
  noStroke();
  Sun s = new Sun(50);//change this somehow so sun can be bigger or smaller
  s.render();
  
  int max = stars.get(starIndex).getNumPlanets();
  
  for(int i = 0; i < max;i++)
  {
      stars.get(starIndex).drawPlanets();
      
  }
  
  if(mousePressed)
  {
    
      mode = 2;
     
  }
   
}//end drawPlanets()

void drawStarsInBackground()
{
   
   for (int i = 0 ; i<trans.size();i++)
   {
    trans.get(i).renderPoints() ;
   } 
  
}

void initButtons()
{
    buttonWidth = 200;
    buttonHeight  = 75;
    buttonSpacing = 100;
    
    String starMap = "MAP";
    String readme = "README";
    String exit = "EXIT";
  
    buttonX = width / 2 - (buttonWidth / 2);
    buttonY = height / 4; 
    
    //create buttons
    b = new Button(buttonX, buttonY, buttonWidth, buttonHeight, starMap);
    b2 = new Button(buttonX, buttonY + buttonSpacing, buttonWidth, buttonHeight, readme);
    b3 = new Button(buttonX, buttonY + (buttonSpacing * 2), buttonWidth, buttonHeight, exit);
  
}//end initButtons()

void drawMenu()
{
  //drawSunAtBottom();
  
  b.render();
  b.drawText();
  b.isClicked();

  b2.render();
  b2.drawText();
  b2.isClicked();
  
  b3.render();
  b3.drawText();
  b3.isClicked();
  textSize(10);
  text("Menu is laggy. Hold over button and click",200,50);
  
  
  
}//end drawMenu()

void drawSunAtBottom()
{
  
  //arc(x, y, width, height, start, stop);
  float x = width / 2;
  float y = height + 140;
  float w = width;
  float h = height;
  float start = -PI;
  float stop = 0;
  
  
  //draw the sun at bottom
  fill(247, 32, 0);
  noStroke();
  
  arc(x,y,w,h,start,stop);
  
  
  //draw another arc above the sun and blur it
  fill(247, 90, 0);
  filter( BLUR, 6 );
  arc(x,y,w,h - 20,start,stop);
  
}//end drawSunAtBottom();

void drawReadMe()
{
  
  String s = "Ronan Connolly C15737505 Assignment";
  String s0 = "Menu: 0";
  String s1 = "Readme: 1";
  String s2 = "Map: 2";
  String s3 = "Star Transition: 3";
  String s4 = "Planets: 4";
  String s5 = "Exit: 5";
  String s6 = "Click and HOLD on Menu buttons, they lag";
  background(0);//might not need this
  textSize(25);
   fill(247, 197, 0);

  textAlign(CENTER, CENTER);
  drawStarsInBackground();
  text(s,textX,textY);
  text(s0,textX,textY + 50);
  text(s1,textX,textY + 75);
  text(s2,textX,textY + 100);
  text(s3,textX,textY + 125);
  text(s4,textX,textY + 150);
  text(s5,textX,textY + 175);
  text(s6,textX,textY + 200);
  
  textY--;
  
  if(textY == -175)
  {
     textY = 600;
  }
  
    if(mousePressed)
  {
    
      mode = 0;
     
  }
  
}//end drawReadme()

void drawDigitalRain()
{
    fill(fader2.c);
    stroke(98,117,8);
    fader2.update();
    fader2.render();
    float faderY = fader2.getFaderY();
    
    float mapped = map(faderY, 320,500, 0, 10);
  
  dRain.render(dRainTextY); 
  dRainTextY = dRainTextY + mapped;
  println(dRainTextY);
  
  //reset the textY position so it scrolls
   if(dRainTextY >= 250)
  {
     dRainTextY = 5; 
  }
  
  
}

void keyPressed()
{
  if (key >= '0' && key <='9')
  {
    mode = key - '0';
  }
  println(mode);
}