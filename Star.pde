class Star
{
  String name;
  int num_planets;
  float x, y;
  float mappedX, mappedY;
  float size;
  
  
  ArrayList<Planet> planets;
  
  boolean overStar;
  boolean isClicked;
  
  Star()
  {
  }
  
  Star(TableRow row)
  {
        name = row.getString("name");
        num_planets = row.getInt("num_planets");
        x = row.getFloat("x_pos");
        y = row.getFloat("y_pos");
        size = row.getFloat("size");
        
        isClicked = false;
        
        planets = new ArrayList<Planet>();
        
        //init planets
        for(int i = 0; i < num_planets;i++)
        {
           //planet attributes 
           float radius = random(50,500);
           float size = random(5,30);
           float speed = random(0.001,0.002);
           color c = color((int)random(0,255),(int)random(0,255),(int)random(0,255));
           //create new planet
           Planet p = new Planet(radius,size,speed);
           
           planets.add(p);
           
           //Could do this way and have a default Planet() constructor that does nothing then intialise each star here
           /*
           planets.get(i).size = random(5,30);
           planets.get(i).radius = random(50,300);
           planets.get(i).speed = random(0.1,0.005);
           planets.get(i).c = color((int)random(0,255),(int)random(0,255),(int)random(0,255));
           */
        }
        
  }//end constructor
  
  
  //NEED TO MAP X AND Y!!!! 
  void checkForClick() 
  {
  
    if(  ((mouseX <= mappedX + 10) && (mouseX >= mappedX - 10)) && ((mouseY <= mappedY + 10) && (mouseY >= mappedY - 10)) )
    {
      overStar = true;
      text(name, mappedX + 15, mappedY - 25);
    } else 
    {
      overStar = false;
    }

    //CONTIUNE HERE 14/11/2016
    if (mousePressed && overStar)
    {
        //println("Mouse over Star: " + name);
       
        //display planets
        //mode = 2;
        //drawPlanets();
        isClicked = true;
        
    }
    else
    {
        isClicked = false;
    }
   
    
  }//end update()
  
  void printPlanets()
  {
      for(int i = 0; i < num_planets; i++)
      {
         println("Planet Radius: "  + planets.get(i).radius + " Size: " + planets.get(i).size + " Speed: " + planets.get(i).speed);
      }
    
  }//end printPlanets
  
  void drawPlanets()
  {
    for(int i = 0; i < planets.size();i++)
    {  
        planets.get(i).render();
    }
    
    
  }
  

  int getNumPlanets()
  {
     return num_planets; 
  }
  
  public String toString()
  {
     
      return name + "\t" + num_planets + "\t" + x + "\t" + y + "\tMappedX: " + mappedX + "\tMappedY: " + mappedY;
  }
  
}