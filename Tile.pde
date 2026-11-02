class Tile
{
  //TESTING
  color tileColor;
  
  Tile( int x )
  {
    if( x == 0 )
      tileColor = color(200);
    else
      tileColor = color(100);
  }
  
  public void display( int x, int y )
  {
    stroke(255);
    fill( tileColor );
    rect( x, y, 50, 50 );
  }
}
