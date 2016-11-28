class Planet
{
    float posX, posY;
    //controls size of orbit
    float radius;
    float theta; 
    float size;
    float speed;//add this to theta to increase speed
    color c;
 
 
  
  Planet(float radius,float size, float speed )
  {
        posX = width/2;
        posY = height/2;
        this.size = size;
        this.radius = radius;
        
        
        this.speed = speed;
        theta = 0;
        c = color(random(0,255),random(0,255),random(0,255));
    
  }
  
  void render()
  {
      //controls speed
      theta += speed;
  
  posX = radius * cos( theta );
  posY = radius * sin( theta );
  
  pushMatrix();
  translate( width / 2, height / 2 );
  fill( c );
  ellipse( posX, posY, size, size );
  popMatrix();
  
  //controls arc
  //radius = radius + 0.1f;
    
    
  }
  
  float getPlanetX()
  {
     return posX;
  }
  
  float getPlanetY()
  {
     return posY;
  }
  

  
  
}