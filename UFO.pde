class UFO extends SpaceObject
{
    PShape ufo;
    
    UFO()
    {
    }
    
    void create()
    {
      ufo = createShape();
      ufo.beginShape();
      ufo.stroke(255);
      ufo.noFill();
      ufo.strokeWeight(2);
      ufo.vertex(-radius, radius);
      ufo.vertex(0, - radius);
      ufo.vertex(radius, radius);
      ufo.vertex(0, 0);
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
    }
}