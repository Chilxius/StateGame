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
    //Convert arrows to keys
    if( key == CODED )
    {
      if( keyCode == UP ) key = 'w';
      if( keyCode == DOWN ) key = 's';
      if( keyCode == LEFT ) key = 'a';
      if( keyCode == RIGHT ) key = 'd';
    }
    if( pressed )
    {
      if( isDirection(key) )
        attemptMove( manager, key );
      if( key == ' ' )
        checkInteractions( manager.data.character() );
    }
  }
  
  private void checkInteractions( Character c )
  {
    int x = int(c.position.x);
    int y = int(c.position.y);
    
    //check all surrounding tiles
  }
  
  private boolean isDirection( char c )
  {
    return c == 'a' || c == 's' || c == 'd' || c == 'w';
  }
  
  private void attemptMove( StateManager manager, char dir )
  {
    PVector destPos = new PVector(manager.data.charPos().x,manager.data.charPos().y);
    if( dir == 'a' ) destPos.x--;
    if( dir == 'd' ) destPos.x++;
    if( dir == 'w' ) destPos.y--;
    if( dir == 's' ) destPos.y++;
    
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
