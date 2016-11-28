class Asteroid extends SpaceObject
{
    PShape asteroid;
    
    Asteroid()
    {
      
    }
    
    void create()
    {
      asteroid = createShape();
      asteroid.beginShape();
      asteroid.stroke(255);
      asteroid.noFill();
      asteroid.strokeWeight(2);
      asteroid.vertex(-radius, radius);
      asteroid.vertex(0, - radius);
      asteroid.vertex(radius, radius);
      asteroid.vertex(0, 0);
      asteroid.endShape(CLOSE);
    }
    
    void render()
    {
          pushMatrix(); // Stores the current transform
          translate(pos.x, pos.y);
          rotate(theta);  
          shape(asteroid, 0, 0);
          popMatrix(); // Restore the transform
    }
    
    void update()
    {
    }
  
}