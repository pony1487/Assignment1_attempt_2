class Button
{
  float x,y;
  int b_width, b_height;
  String s;
  PFont font;
  
  Button(float x, float y, int b_width, int b_height, String s)
  {
    this.x = x;
    this.y = y; //<>//
    this.b_width = b_width;
    this.b_height = b_height;
    this.s = s;
    font = createFont("Death Star.otf",32);
  }
  
  void render()
  {
     stroke(247, 197, 0);
     noFill();
     rect(x,y,b_width,b_height);
    
    
  }
  
  void drawText()
  {
      fill(247, 197, 0);
      textSize(32);
      textAlign(CENTER);
      textFont(font);
      text(s, x + b_width/2, y + b_height / 2);
    
  }
  
  void isClicked()
  {
      //(mouseX <= mappedX + 10) && (mouseX >= mappedX - 10)) && ((mouseY <= mappedY + 10) && (mouseY >= mappedY - 10))
      if( (mouseX > x) && (mouseX < x  + b_width) && (mouseY > y) && (mouseY < y + b_height) )
      {
          if(mousePressed)
          {
            if(s == "README")
            {
                mode = 1;
            }
            
            if(s == "MAP")
            {
                mode = 2;
            }
            
            if(s == "EXIT")
            {
                mode = 5;
            }
          }
      }
     
    
  }
  
  
}