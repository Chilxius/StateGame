class ExploreState implements GameState
{
  void update( GameData data ){}
  void display( GameData data )
  {
    data.map.display( data.mapX, data.mapY );
    data.character().display( data, width/2, height/2 );
  }
  void keyReact( StateManager manager, boolean pressed )
  {
    if( pressed && key == CODED )
    {
      attemptMove( manager, keyCode );
    }
  }
  
  void attemptMove( StateManager manager, int dir )
  {
    int destX = manager.data.mapX, destY = manager.data.mapY;
    if( dir == LEFT ) destX--;
    if( dir == RIGHT) destX++;
    if( dir == UP   ) destY--;
    if( dir == DOWN ) destY++;
    
    if( manager.data.map.tiles[destX][destY].pathable() )
    {
      manager.data.mapX = destX;
      manager.data.mapY = destY;
    }
  }
  
  void mouseReact( StateManager manager, boolean pressed ){}
  void changeState( StateManager manager, GameState newState ){manager.setState( newState );}
}
