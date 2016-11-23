class DigitalRain
{
   float borderX, borderY;
   int w, h;
   String s;
   float textX;
   float textY;
   float temp = 15;
   String[] array;
   
   
   
   //Load a file of strings and have that displayed
   
   DigitalRain(float borderX, float borderY, int w, int h, String[] array)
   {
       this.borderX = borderX;
       this.borderY = borderY;
       this.w = w;
       this.h = h;
       
       
       textX = 150;
       textY = 20;
      // s = "Test Test Test Tese";
       this.array = array;
     
       
   }
  
  void render(float y)
  {
     noFill();
     stroke(255);
     rect(borderX,borderY, w, h);  
     fill(247, 197, 0);
     
     for(int i = 0; i < array.length; i++)
     {
       text(array[i], borderX + textX, borderY + y);
       
     }
     
     
    
    
  }
  
  void printList()
  {
     for(int i = 0; i < lines.size();i++)
     {
        println(lines.get(i)); 
     }
  }
}