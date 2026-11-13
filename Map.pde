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
  
  public void display(GameData data, int x, int y)
  { 
    //data.setResolution( data.ritchieWidth, data.ritchieHeight );
    push();
    //data.applyScale();
    
    rectMode(CENTER);
    imageMode(CENTER);
    for( int i = 0; i < tiles.length; i++ )
      for( int j = 0; j < tiles[0].length; j++ )
        tiles[i][j].display(data.ritchieWidth/2+i*64-x*64,data.ritchieHeight/2+j*64-y*64);
        
    pop();
  }
  
  public void openMatchingDoor( PVector pos )
  {
    char clearCode = char(int(tiles[int(pos.x)][int(pos.y)].code) - 32);
    for( int i = 0; i < 100; i++ )
      for( int j = 0; j < 100; j++ )
        if( tiles[i][j].code == clearCode )
        {
          tiles[i][j].clearTile();
          tiles[int(pos.x)][int(pos.y)].clearTile();
          //return; //only triggers one
        }
  }
}
