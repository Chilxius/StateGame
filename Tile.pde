class Tile
{
  //TESTING
  //char code;
  color tileColor;
  PImage tileImage;
  boolean pathable;
  boolean cleared; //door opened, boss fought, etc.
  
  //Tile type determined by character in map string
  Tile( char c, HashMap<String,PImage> images )
  {
    if( c == '#' )
    {
      tileColor = color(0,0,0,0);
      tileImage = images.get("stone wall");
      pathable = false;
    }
    else if( c == 'D' )
    {
      tileColor = color(100);
      tileImage = images.get("door");
      pathable = true;
    }
    else
    {
      tileColor = color(100);
      pathable = true;
    }
  }
  
  //Draws tile on specific location
  public void display( int x, int y )
  {
    stroke(255);
    fill( tileColor );
    rect( x, y, 50, 50 );
    if( tileImage != null )
    {
      noTint();
      image(tileImage,x,y,50,50);
    }
  }
  
  public boolean pathable()
  {
    return pathable;
  }
}
