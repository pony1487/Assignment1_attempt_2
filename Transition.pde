class Transition
{
   float x;//used for stars
   float y;
   
   float x2;//increase these so it "looks" like warp drive
   float y2;
   
   float size;
   float speed;
   
   Transition(float x, float y)
   {
     this.x = x;
     this.y = y;
     this.x2 = x;
     this.y2 = y;
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
   
   void resetTransition()
   {
     
   }
}