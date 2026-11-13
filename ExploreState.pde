class ExploreState implements GameState
{
  Button menuButton;
  boolean noClip = false;
  
  ExploreState()
  {
    menuButton = new Button( "Menu", 100, 100, 75, 50 );
  }
  
  void update( GameData data ){}
  void display( GameData data )
  { 
    data.setResolution( data.ritchieWidth, data.ritchieHeight );
    push();
    data.applyScale();
    
    data.map.display( int(data.charPos().x), int(data.charPos().y) );
    data.character().display( data, data.ritchieWidth/2, data.ritchieHeight/2 );
    
    menuButton.drawButton();
    
    text( ""+noClip, 50, 50 );
    
    pop();
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
        checkInteractions( manager.data );
    }
    
    if( pressed && key == '!' )
      noClip = !noClip;
  }
  
  private void checkInteractions( GameData d )
  {
    int x = int(d.character().position.x);
    int y = int(d.character().position.y);
    
    for( int i = x-1; i <= x+1; i++ )
      for( int j = y-1; j <= y+1; j++ )
        if( i >= 0 && j >= 0 && i < 100 && j < 100 )  //Ignore if outside map
          if( d.map.tiles[i][j].cleared == false )  //Check if not cleared (walls and floors start cleared)
          {
            interactWith( d, i, j, d.map.tiles[i][j].code );
            return;
          }
  }
  
  private void interactWith( GameData d, int x, int y, char code )
  {
    //change state to appropriate mini-game
    //send that game the coordiantes so it can clear the tile
    println( code );
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
    
    if( manager.data.map.tiles[int(destPos.x)][int(destPos.y)].pathable() || noClip )
    {
      if( manager.data.map.tiles[int(destPos.x)][int(destPos.y)].isButton() )
      {
        manager.data.map.openMatchingDoor( destPos );
      }
      manager.data.character().position = destPos;
    }
  }
  
  void mouseReact( StateManager manager, boolean pressed )
  {
    if( menuButton.isButtonUsed(pressed) )
      manager.setState( new MenuState( manager.data ) );
  }
  
  void changeState( StateManager manager, GameState newState ){manager.setState( newState );}
}
