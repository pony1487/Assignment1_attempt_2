class DigitalRain
{
   float borderX, borderY;
   int w, h;
   String s;
   float textX;
   float textY;
   
   
   
   
   DigitalRain(float borderX, float borderY, int w, int h)
   {
       this.borderX = borderX;
       this.borderY = borderY;
       this.w = w;
       this.h = h;
       
       textX = 55;
       textY = 20;
       s = "Test Test Test Tese";
       
       
   
       
      
       
   }
  
  void render(float y)
  {
     noFill();
     stroke(255);
     rect(borderX,borderY, w, h);  
     fill(247, 197, 0);
     text(s, borderX + textX, borderY + y);
     
     
    
    
  }
  
}