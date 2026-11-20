class ExploreState implements GameState
{
  Button menuButton;
  boolean noClip = false;
  GhostImage ghostImage;
  
  ExploreState( GameData data )
  { 
    data.setResolution( data.ritchieWidth, data.ritchieHeight );
    push();
    data.applyScale();
    
    menuButton = new Button( "Menu", 100, 100, 75, 50 );
    
    pop();
  }
  
  void update( GameData data )
  {
    if( ghostImage != null && ghostImage.timer > 0 ) ghostImage.update();
  }
  
  void display( GameData data )
  { 
    data.setResolution( data.ritchieWidth, data.ritchieHeight );
    push();
    data.applyScale();
    
    data.map.display( data, int(data.charPos().x), int(data.charPos().y) );
    data.character().display( data, data.ritchieWidth/2, data.ritchieHeight/2 );
    
    menuButton.drawButton();
    
    text( ""+noClip, 50, 50 );
    
    if( ghostImage != null && ghostImage.timer > 0 ) ghostImage.display();
    
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
            interactWith( d, x, y, i, j, d.map.tiles[i][j].code );
            if( i == x && j == y )
            {
              getLootFrom( d, d.map.tiles[i][j] );
              d.map.tiles[i][j].clearTile();
            }
            //return; //WORRY
          }
  }
  
  private void getLootFrom( GameData data, Tile t )
  {
    if( t.code == '[' )
    {
      data.theCharacter.getItem("lockpick");
      ghostImage = new GhostImage(data, "lockPick", data.ritchieWidth/2, data.ritchieHeight/2);
    }
    if( t.code == ']' )
    {
      data.theCharacter.getItem("rope");
      ghostImage = new GhostImage(data, "rope", data.ritchieWidth/2, data.ritchieHeight/2);
    }
  }
  
  private void interactWith( GameData d, int x, int y, int mx, int my, char code )
  {
    //change state to appropriate mini-game
    //send that game the coordiantes so it can clear the tile
    println( code + " " + x + ":" + y + "   " + mx + ":" + my );
    
    if( code == '@' )
      changeState( manager, new LockpickState(manager.data) );
    if( code == '[' && x == mx && y == my )
      println("FOUND LOCKPICK");
    if( code == ']' && x == mx && y == my )
      println("FOUND OTHER THING I GUESS");
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
      
      if( manager.data.map.tiles[int(destPos.x)][int(destPos.y)].isTrap() )
      {
        manager.data.character().position = destPos;
        manager.data.trapType = manager.data.map.tiles[int(destPos.x)][int(destPos.y)].code;
        changeState( manager, new TrapState(manager.data, manager.data.trapType) );
      }
      else
        manager.data.character().position = destPos;
    }
  }
  
  void mouseReact( StateManager manager, boolean pressed )
  {
    if( menuButton.isButtonUsed(pressed, manager.data.mX(), manager.data.mY() ) )
      manager.setState( new MenuState( manager.data ) );
  }
  
  void changeState( StateManager manager, GameState newState ){manager.setState( newState );}
  
  class GhostImage
  {
    PImage image;
    float xPos, yPos;
    int timer;
    
    GhostImage( GameData data, String type, float x, float y )
    {
      image = data.mapImages.get(type);
      xPos = x;
      yPos = y;
      timer = 500;
      
      println(type + " image created");
    }
    
    public void display()
    {
      push();
      tint(255,timer);
      image(image,xPos,yPos);
      pop();
    }
    
    public void update()
    {
      timer-=15;
      yPos-=2;
    }
  }
}
