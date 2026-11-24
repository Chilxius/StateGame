class ExploreState implements GameState
{
  Button menuButton;
  boolean noClip = false;
  GhostImage ghostImage;
  ArrayList<GhostImage> ghostImages;
  
  ExploreState( GameData data )
  { 
    data.setResolution( data.ritchieWidth, data.ritchieHeight );
    push();
    data.applyScale();
    
    ghostImages = new ArrayList<GhostImage>();
    menuButton = new Button( "Menu", 100, 75, 175, 100 );
    
    pop();
  }
  
  void update( GameData data )
  {
    //for( GhostImage ghostImage: ghostImages ) ghostImage.update();
    for( int i = 0; i < ghostImages.size(); i++ )
    {
      ghostImages.get(i).update();
      if( ghostImages.get(i).timer <= 0 )
        ghostImages.remove(i);
    }
  }
  
  void display( GameData data )
  { 
    data.setResolution( data.ritchieWidth, data.ritchieHeight );
    push();
    data.applyScale();
    
    background(0);
    
    data.map.display( data, int(data.charPos().x), int(data.charPos().y) );
    data.character().display( data, data.ritchieWidth/2, data.ritchieHeight/2 );
    
    menuButton.drawButton();
    
    //text( ""+noClip, 50, 50 );
    
    for( GhostImage ghostImage: ghostImages ) ghostImage.display();
    
    drawHUD( data );
    
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
  
  private void drawHUD( GameData data )
  {
    //String [] hudElements = {"sword","lockpick","rope","mattock","antidote","rat"};
    String [] hudElements = {"lockpick","rope","mattock","antidote","rat"};
    
    push();
    stroke(255);
    strokeWeight(5);
    rectMode(CENTER);
    imageMode(CENTER);
    textSize(data.defaultCharSize*0.75);
    textAlign(LEFT,CENTER);
    
    //Draw all HUD elements
    for( int i = 0; i < hudElements.length; i++ )
    {
      //Draw Backgroud Rectangles
      fill(0);
      rect(data.defaultCharSize, 200+i*data.defaultCharSize*1.5, data.defaultCharSize*1.2, data.defaultCharSize*1.2, 10);
      //Draw item type
      if( !data.theCharacter.hasItem(hudElements[i]) )
        tint(200,75);
      else noTint();
      image( data.mapImages.get(hudElements[i]), data.defaultCharSize, 200+i*data.defaultCharSize*1.5, data.defaultCharSize, data.defaultCharSize);
      
      //Print Quantities
      fill(200);
      text(": " + data.theCharacter.item.get(hudElements[i]), data.defaultCharSize*1.75, 200+i*data.defaultCharSize*1.5);
    }
    
    pop();
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
            //return; //WORRIED about turning this off...
          }
  }
  
  private void getLootFrom( GameData data, Tile t )
  {
    if( t.code == '[' )
    {
      data.theCharacter.getItem("mattock");
      ghostImages.add( new GhostImage(data, "mattock", data.ritchieWidth/2, data.ritchieHeight/2) );
    }
    if( t.code == ']' )
    {
      data.theCharacter.getItem("rope");
      ghostImages.add( new GhostImage(data, "rope", data.ritchieWidth/2, data.ritchieHeight/2) );
    }
    if( t.code == '{' )
    {
      data.theCharacter.getItem("antidote");
      ghostImages.add( new GhostImage(data, "antidote", data.ritchieWidth/2, data.ritchieHeight/2) );
    }
    if( t.code == '}' )
    {
      data.theCharacter.getItem("rat");
      ghostImages.add( new GhostImage(data, "rat", data.ritchieWidth/2, data.ritchieHeight/2) );
    }
    if( t.code == '(' )
    {
      data.theCharacter.getItem("lockpick");
      ghostImages.add( new GhostImage(data, "lockpick", data.ritchieWidth/2, data.ritchieHeight/2) );
    }
    if( t.code == ')' )
    {
      data.theCharacter.getItem("sword");
      ghostImages.add( new GhostImage(data, "sword", data.ritchieWidth/2, data.ritchieHeight/2) );
    }
  }
  
  private void interactWith( GameData d, int x, int y, int mx, int my, char code )
  {
    //change state to appropriate mini-game
    //send that game the coordiantes so it can clear the tile
    //println( code + " " + x + ":" + y + "   " + mx + ":" + my );
    
    if( code == '@' )
      changeState( manager, new LockpickState(manager.data) );
      
    //if( code == '[' && x == mx && y == my )
    //  println("FOUND LOCKPICK");
    //if( code == ']' && x == mx && y == my )
    //  println("FOUND OTHER THING I GUESS");
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
      {
        manager.data.character().position = destPos;
        shiftGhostImages( manager.data, dir );
      }
    }
  }
  
  private void shiftGhostImages( GameData data, char dir )
  {
    int dX = 0, dY = 0;
    if( dir == 'a' ) dX = data.defaultCharSize;
    if( dir == 'd' ) dX = -data.defaultCharSize;
    if( dir == 'w' ) dY = data.defaultCharSize;
    if( dir == 's' ) dY = -data.defaultCharSize;
    
    for( GhostImage g: ghostImages )
      g.adjust( dX, dY );
  }
  
  void mouseReact( StateManager manager, boolean pressed )
  {
    if( menuButton.isButtonUsed(pressed, manager.data.mX(), manager.data.mY() ) )
      manager.setState( new MenuState( manager.data ) );
  }
  
  void changeState( StateManager manager, GameState newState ){manager.setState( newState );}
  
  //*****************************//
  //** Temporary Fading Images **//
  //*****************************//
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
    }
    
    public void display()
    {
      push();
      tint(255,timer);
      image(image,xPos,yPos);
      pop();
    }
    
    public void adjust( int x, int y )
    {
      xPos += x;
      yPos += y;
    }
    
    public void update()
    {
      timer-=15;
      yPos-=2;
    }
  }
}
