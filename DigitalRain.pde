class DigitalRain
{
   float borderX, borderY;
   int w, h;
   String s;
   float textX;
   float textY;
   float temp = 15;
   String[] array;
   float arcx;
   float arcy;
   float scalar;
   float arcStart;
   
   
   
   //Load a file of strings and have that displayed
   
   DigitalRain(float borderX, float borderY, int w, int h, String[] array)
   {
       this.borderX = borderX;
       this.borderY = borderY;
       this.w = w;
       this.h = h;
       
       arcx = borderX + (w / 2);
       arcy = borderY + (h / 2);
       
       scalar = 0.1;
       arcStart = 0;
       
       
       textX = 150;
       textY = 20;
      // s = "Test Test Test Tese";
       this.array = array;
     
       
   }
  
  void render(float s, float a)
  {
     noFill();
     stroke(255);
     rect(borderX,borderY, w, h);  
     fill(247, 197, 0);
     
     /*
     for(int i = 0; i < array.length; i++)
     {
       text(array[i], borderX + textX, borderY + y);
       
     }
     */
     
     strokeWeight(3);
     noFill();
     //arc(arcx, arcy, 200,200,0,HALF_PI);
      arc(arcx, arcy, 200, 200, arcStart, HALF_PI + scalar);
     arc( arcx, arcy, 75, 75, -arcStart, HALF_PI - scalar);
      arcStart = arcStart + a;
      
      //scalar = scalar + 0.1;
      scalar = scalar + s;
     
     
    
    
  }
  
  void printList()
  {
     for(int i = 0; i < lines.size();i++)
     {
        println(lines.get(i)); 
     }
  }
}