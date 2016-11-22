class Sun
{
   float x;
   float y;
   
   float radius;
   color c;
   
   
   
   Sun(float radius)
   {
     x = width/2;
     y = height/2;
     
     this.radius = radius;
     c = color(252, 42, 5);
     
   }
  
  void render()
  {
     fill(c);
     ellipse(x,y, radius * 2, radius * 2); 
     
     
    
  }
  
}