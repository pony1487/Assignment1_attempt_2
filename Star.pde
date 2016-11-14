class Star
{
  String name;
  int num_planets;
  float x, y;
  float size;
  
  boolean overStar;
  
  
  Star(TableRow row)
  {
        name = row.getString("name");
        num_planets = row.getInt("num_planets");
        x = row.getFloat("x_pos");
        y = row.getFloat("y_pos");
        size = row.getFloat("size");
  }//end constructor
  
  
  //NEED TO MAP X AND Y!!!! 
  void checkForClick(float x, float y) 
  {
    if (mouseOver(x, y)) 
    {
      overStar = true;
    } else 
    {
      overStar = false;
    }

    if (mousePressed && overStar)
    {
        println("Mouse over Star: " + name);
    }//end if
  }//end update()

  boolean mouseOver(float x, float y)
  {
    if (( mouseX >= x && mouseX <= (x + 10)) || (mouseY >= y && mouseY <= (y + 10)))
    {
      return true;
    } else
    {
      return false;
    }
  }//end mouseOver()
  

  
  public String toString()
  {
     
      return name + " " + num_planets + " " + x + " " + y;
  }
  
}