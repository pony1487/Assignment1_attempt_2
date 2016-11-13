class Star
{
  String name;
  int num_planets;
  float x, y;
  
  
  Star(TableRow row)
  {
        name = row.getString("name");
        num_planets = row.getInt("num_planets");
        x = row.getFloat("x_pos");
        y = row.getFloat("y_pos");
  }//end constructor
  

  
  public String toString()
  {
     
      return name + " " + num_planets + " " + x + " " + y;
  }
  
}