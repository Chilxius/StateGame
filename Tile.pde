class Tile
{
  //TESTING
  char code;
  color tileColor;
  PImage tileImage, clearedImage;
  boolean pathable;
  boolean cleared; //door opened, boss fought, button pushed, etc.
  
  //Tile type determined by character in map string
  Tile( char c, HashMap<String,PImage> images )
  {
    code = c;
    if( c == '#' )
    {
      tileColor = color(0,0,0,0);
      tileImage = images.get("stone wall");
      pathable = false;
    }
    else if( c == '@' )
    {
      tileColor = color(100);
      tileImage = images.get("door");
      clearedImage = images.get("door frame");
      pathable = false;
    }
    else if( c >= 65 && c <= 90 )
    {
      tileColor = color(100);
      tileImage = images.get("sealed door");
      clearedImage = images.get("door frame");
      pathable = false;
    }
    else if( c >= 97 && c <= 122 )
    {
      tileColor = color(100);
      tileImage = images.get("stone button");
      clearedImage = images.get("pushed stone button");
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
      if( cleared )
        image(clearedImage,x,y,50,50);
      else
        image(tileImage,x,y,50,50);
    }
  }
  
  public void clearTile()
  {
    cleared = true;
    pathable = true;
  }
  
  public boolean isButton()
  {
    return code >= 97 && code <= 122;
  }
  
  public boolean pathable()
  {
    return pathable;
  }
}
