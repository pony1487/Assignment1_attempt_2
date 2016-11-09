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
      
   void update() 
   {
      if (mouseOver()) 
      {
        over = true;
      } 
      else 
      {
        over = false;
      }
      
      if(mousePressed && over)
      {
          faderY = mouseY;
          
         // mouseDragged();
         
      }
      
    
  }//end update()
  
   boolean mouseOver()
   {
      if(( mouseX > faderX && mouseX < (faderX + faderWidth)) || (mouseY > faderY && mouseY < (faderY + faderHeight)))
      {
        return true; 
      }
      else
      {
        return false; 
      }
      
      
   }//end mouseOver()
   
   void render()
   {
       rect(  faderX, faderY, faderWidth,faderHeight);
       
       println("Y: " + faderY);
       println(mouseY); 
      
   }//end render()
   
   
   void mouseDragged() 
   {
      faderY = faderY - 1;
      if (faderY < height / 2) 
      {
          faderY = 0;
      }  
    }//end mouseDragged()
    
    
    
}//end class