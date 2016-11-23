class Fader
{
  float faderX;
  float faderY;
  float minY;
  float maxY;

  float newY;

  int faderWidth;
  int faderHeight;

  boolean over; //is mouse over slider?

  color c;
  
  String label;



  Fader(float faderX, float faderY, int faderWidth, int faderHeight, color c, String label)
  {
    this.faderX = faderX;
    this.faderY = faderY;
    //this.minY = minY;
    //this.maxY = maxY;
    this.faderWidth = faderWidth;
    this.faderHeight = faderHeight;
    this.c = c;
    this.label = label;
  }

  void update() 
  {
    if (mouseOver()) 
    {
      over = true;
    } else 
    {
      over = false;
    }

    if (mousePressed && over)
    {
      //update fader Y axis to follow mouseY
      faderY = mouseY;

      //check if at top or bottom of back panel
      if (faderY <= (height / 2) + 20)
      {
        faderY = (height / 2) + 20;
      }

      if (faderY >= height - 50)
      {
        faderY = height - 50;
      }
    }//end if
  }//end update()

  boolean mouseOver()
  {
    if (( mouseX > faderX && mouseX < (faderX + faderWidth)) || (mouseY > faderY && mouseY < (faderY + faderHeight)))
    {
      return true;
    } else
    {
      return false;
    }
  }//end mouseOver()

  void render()
  {
    rect(  faderX, faderY, faderWidth, faderHeight);
    fill(255);
    text(label, faderX + (faderWidth / 2),faderY + (faderHeight / 2));

    //println("Y: " + faderY);
    //println(mouseY);
  }//end render()


  void leftMenuLight()
  {
    float mappedY;
    float rectX = padding + 10;
    int rectWidth = 15;
    int rectHeight = rectWidth / 2;

    //hard coded: TO BE CHANGED
    mappedY = map(faderY, 555, 320 - 8, height, 0);

    fill(215, 255, 0);
    noStroke();
    rect(rectX, mappedY, rectWidth, rectHeight);
    
    //used for debugging
    //println("MappedY: " + mappedY);
    //println("Y: " + faderY);
  }
  
  float getFaderY()
  {
      return faderY;
  }
}//end class