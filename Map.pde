class Map
{
  Tile tiles[][] = new Tile[100][100];
  
  Map()
  {
    for( int i = 0; i < 100; i++ )
      for( int j = 0; j < 100; j++ )
        tiles[i][j] = new Tile( 0 );
  }
  
  public void display()
  {
    rectMode(CORNER);
    for( int i = 0; i < tiles.length; i++ )
      for( int j = 0; j < tiles[0].length; j++ )
        tiles[i][j].display(i*50,j*50);
  }
}
