class Tile
{
  //TESTING
  color tileColor;
  PImage tileImage;
  
  //Tile type determined by character in map string
  Tile( char c, HashMap<String,PImage> images )
  {
    if( c == '#' )
    {
      tileColor = color(0,0,0,0);
      tileImage = images.get("stone wall");
    }
    else
      tileColor = color(100);
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
}
