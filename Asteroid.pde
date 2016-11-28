class Asteroid extends SpaceObject
{
  PShape asteroid;
  float mass;



  Asteroid(float x, float y, float theta, float size)
  {  
    pos = new PVector(x, y);

    radius = size / 2;
    this.theta = theta;

    velocity = new PVector(random(1, 5), random(1, 5));

    isAlive = true;
    create();
  }

  void create()
  {


    asteroid = createShape();
    asteroid.beginShape();
    asteroid.stroke(0);
    asteroid.fill(145, 88, 2);
    asteroid.strokeWeight(2);

    //basic diamond
    asteroid.vertex(-radius, 0);

    //"rocky side"
    asteroid.vertex((-radius - 20), radius - 40);

    //basic diamond
    asteroid.vertex(0, -radius);

    //"rocky side"
    asteroid.vertex((radius  + 15), 0);

    //basic diamond
    asteroid.vertex(radius, 0);

    //"rocky side"
    asteroid.vertex(radius - 15, radius - 12);

    //basic diamond
    asteroid.vertex(0, radius);

    //"rocky side"
    asteroid.vertex(0, radius - 12);



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
    
  }//end update
  
  
}