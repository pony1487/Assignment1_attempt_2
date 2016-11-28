class DigitalRain
{
   float borderX, borderY;
   int w, h;
   String s;

   float arcx;
   float arcy;
   float scalar;
   float arcStart;
   
   
   
   //Load a file of strings and have that displayed
   
   DigitalRain(float borderX, float borderY, int w, int h)
   {
       this.borderX = borderX;
       this.borderY = borderY;
       this.w = w;
       this.h = h;
       
       arcx = borderX + (w / 2);
       arcy = borderY + (h / 2);
       
       scalar = 0.1;
       arcStart = 0;
       
       
    
     
       
   }
  
  void render(float s, float a,float c)
  {
     noFill();
     stroke(98,117,8);
     rect(borderX,borderY, w, h);  
    
     
     
     strokeWeight(3);
     //stroke(random(0,255), random(0,255) ,c);
     stroke( 247, 197,c);
     
      //hal border
     stroke(171, 173, 171);
     fill(110, 0, 0);
     ellipse(arcx,arcy, 220,220);
     noFill();
     stroke(204, 206, 204);
     ellipse(arcx,arcy, 234,234);
     stroke(98,117,8);
     ellipse(arcx,arcy, 240,240);
     
     
     //draw hal eye
     noStroke();
     fill(c,0,0);
     ellipse(arcx,arcy, 20,20);
     
     
     //draw arc rotating
     noFill();
     stroke( 230,0,0);
     arc( arcx, arcy, 25, 25, arcStart, HALF_PI + scalar);
     
     stroke( 230,0,0);
     arc( arcx, arcy, 30, 30, -arcStart, HALF_PI - scalar);
     
     stroke( 230,0,0);
     arc( arcx, arcy, 35, 35, arcStart, HALF_PI + scalar);
     
     stroke( 230,0,0);
     arc( arcx, arcy, 40, 40, -arcStart, HALF_PI - scalar);
     
     stroke( 230,0,0);
     arc( arcx, arcy, 45, 45, arcStart, HALF_PI + scalar);
     
     stroke( 200, 0, 0);
     arc( arcx, arcy, 50, 50, -arcStart, HALF_PI - scalar);
     
     stroke( 230,0,0);
     arc( arcx, arcy, 55, 55, arcStart, HALF_PI + scalar);
     
     stroke( 230,0,0);
     arc( arcx, arcy, 60, 60, -arcStart, HALF_PI - scalar);
     
     stroke( 190, 0, 0);
     arc( arcx, arcy, 75, 75, arcStart, HALF_PI + scalar);
     
     stroke( 180, 0, 0);
     arc( arcx, arcy, 100, 100, arcStart, HALF_PI + scalar);
     
     stroke( 160, 0, 0);
     arc(arcx, arcy, 200, 200, arcStart, HALF_PI + scalar);
     
     stroke( 140 + s, 0, 0);
     arc( arcx, arcy, 210, 210, arcStart, HALF_PI + scalar);
     
     stroke( 110 + s, 0, 0);
     arc( arcx, arcy, 215, 215, -arcStart, HALF_PI - scalar);
     
         
      //arc speed is mapped to the fader
      arcStart = arcStart + a;
      scalar = scalar + s;
     
  }
  
}