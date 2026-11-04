class ExploreState implements GameState
{
  void update( GameData data ){}
  void display( GameData data )
  {
    data.map.display( int(data.charPos().x), int(data.charPos().y) );
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
    PVector destPos = new PVector(manager.data.charPos().x,manager.data.charPos().y);
    if( dir == LEFT ) destPos.x--;
    if( dir == RIGHT) destPos.x++;
    if( dir == UP   ) destPos.y--;
    if( dir == DOWN ) destPos.y++;
    
    if( manager.data.map.tiles[int(destPos.x)][int(destPos.y)].pathable() )
    {
      if( manager.data.map.tiles[int(destPos.x)][int(destPos.y)].isButton() )
      {
        manager.data.map.openMatchingDoor( destPos );
      }
      manager.data.character().position = destPos;
    }
  }
  
  void mouseReact( StateManager manager, boolean pressed ){}
  void changeState( StateManager manager, GameState newState ){manager.setState( newState );}
}
