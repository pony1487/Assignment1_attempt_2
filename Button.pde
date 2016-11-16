class Button
{
  float x,y;
  int b_width, b_height;
  String s;
  
  Button(float x, float y, int b_width, int b_height, String s)
  {
    this.x = x;
    this.y = y;
    this.b_width = b_width;
    this.b_height = b_height;
    this.s = s;
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
      text(s, x + b_width/2, y + b_height / 2);
    
  }
  
  
}