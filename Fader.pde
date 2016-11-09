class Fader
{
   float faderX;
   float faderY;
   float minY;
   float maxY;
   
   int faderWidth;
   int faderHeight;
   
   boolean over; //is mouse over slider?
   color c;
   
   Fader(float faderX,float faderY, int faderWidth, int faderHeight, color c)
   {
     this.faderX = faderX;
     this.faderY = faderY;
     //this.minY = minY;
     //this.maxY = maxY;
     this.faderWidth = faderWidth;
     this.faderHeight = faderHeight;
     this.c = c;
     
   }
   
   void render()
   {
       rect(  faderX, faderY, faderWidth,faderHeight);
   }
   
   void update()
   {
     
     
   }
  
}