class Map
{
  MapData mapData;
  Tile tiles[][] = new Tile[100][100];
  
  Map( HashMap<String,PImage> images )
  {
    mapData = new MapData();
    
    String tileData = mapData.mapString;
    
    for( int i = 0; i < 100; i++ )
      for( int j = 0; j < 100; j++ )
        tiles[j][i] = new Tile( tileData.charAt(i*100+j), images );
  }
  
  public void display(int x, int y)
  {
    push();
    rectMode(CORNER);
    imageMode(CORNER);
    for( int i = 0; i < tiles.length; i++ )
      for( int j = 0; j < tiles[0].length; j++ )
        tiles[i][j].display(i*50+x*50,j*50+y*50);
    pop();
  }
}
