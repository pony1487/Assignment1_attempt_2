class Transition
{
   float x;//used for stars
   float y;
   
   float x2;//increase these so it "looks" like warp drive
   float y2;
   
   float x3;//used to presever the original values of the coords so they dont move while drawing the stars behind the planets
   float y3;
   
   float size;
   float speed;
   
   Transition(float x, float y)
   {
     this.x = x;
     this.y = y;
     this.x2 = x;
     this.y2 = y;
     
     x3 = x;
     y3 = y;
     size = random(0,5);
     speed = 0;
   }
  
   void render()
   {
       stroke(255);
       strokeWeight(size); 
       line(x,y,x2,y2);
       
       
       if(x >= width /2)
       {
           x = x + speed;
           y = y + speed;
           speed = speed + 0.02f;
       }
       else
       {
          x = x - speed;
          y = y + speed;
          speed = speed + 0.02f;
       }
   }//end render()
   
   //NOT USED
   void renderPoints()
   {
       stroke(255);
       strokeWeight(size); 
       point(x3,y3);
     
   }
   
   void resetTransition()
   {
     
   }
}