class UFO extends SpaceObject
{
    PShape ufo;
    
    UFO(float x, float y, float theta, float size)
    {
        pos = new PVector(x, y);
        this.size = size;
        this.theta = theta;
        
        radius = size / 2;
         velocity = new PVector(random(1, 5), random(1, 5));
         isAlive = true;
        
        create();
    }
    
    void create()
    {
      ufo = createShape();
      ufo.beginShape();
      ufo.stroke(255);
      ufo.noFill();
      ufo.strokeWeight(2);
      
      ufo.vertex(-radius, 0);
      ufo.vertex(-radius, 5);
      
      ufo.vertex(radius, 5);
      ufo.vertex(radius, 0);
      
      
      ufo.endShape(CLOSE);
    }
    
    void render()
    {
      pushMatrix(); // Stores the current transform
      translate(pos.x, pos.y);
      rotate(theta);  
      shape(ufo, 0, 0);
      popMatrix(); // Restore the transform
    }
    
    void update()
    {
      
      
    pos.add(velocity);
    
    //rotate anti clockwise
    theta -= 0.01;


    if (pos.x > width + 100 || pos.x < -100)
    {
       
      velocity.x = velocity.x * -1;      
    }

    if (pos.y > height + 100 || pos.y < -100)
    {
     
       velocity.y = velocity.y * -1; 
    }
    
     //check if alive
    if(!isAlive)
    {
        
        spaceObjects.remove(this);
    }
    
    
   }
}