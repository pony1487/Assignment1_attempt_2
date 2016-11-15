class Star
{
  String name;
  int num_planets;
  float x, y;
  float mappedX, mappedY;
  float size;
  
  ArrayList<Planet> planets;
  
  boolean overStar;
  
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
        
        planets = new ArrayList<Planet>();
        
        //init planets
        for(int i = 0; i < num_planets;i++)
        {
           Planet p = new Planet();
           
           planets.add(p);
           
           //need to find a way to name each star
           planets.get(i).name = "TEST";
           planets.get(i).size = (int)random(0,50);
           planets.get(i).c = color((int)random(0,255),(int)random(0,255),(int)random(0,255));
        }
        
  }//end constructor
  
  
  //NEED TO MAP X AND Y!!!! 
  void checkForClick() 
  {
  
    if(  ((mouseX <= mappedX + 10) && (mouseX >= mappedX - 10)) && ((mouseY <= mappedY + 10) && (mouseY >= mappedY - 10)) )
    {
      overStar = true;
    } else 
    {
      overStar = false;
    }

    //CONTIUNE HERE 14/11/2016
    if (mousePressed && overStar)
    {
        println("Mouse over Star: " + name);
        //display planets
        //mode = 2;
    }//end if
    else
    {
        println("Not over star");
    }
  }//end update()
  
  void printPlanets()
  {
      for(int i = 0; i < num_planets; i++)
      {
         println("Planet: "  + planets.get(i).name + " Size: " + planets.get(i).size + " Color: " + planets.get(i).c);
      }
    
  }//end printPlanets
  

  
  public String toString()
  {
     
      return name + "\t" + num_planets + "\t" + x + "\t" + y + "\tMappedX: " + mappedX + "\tMappedY: " + mappedY;
  }
  
}