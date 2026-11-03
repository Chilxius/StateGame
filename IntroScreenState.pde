class IntroScreenState implements GameState
{
  Button startButton;
  
  IntroScreenState()
  {
    startButton = new Button("Start Game", width/2, height-200, 150,100);
  }
  
  void update( GameData data ) {}
  
  void display( GameData data )
  {
    background(0);
    
    fill(255);
    textSize(75);
    textAlign(CENTER);
    text("BEST GAME EVAR",width/2,height/2);
    
    data.character().display(data, width/2, height/2-200);
    
    startButton.drawButton();
  }
  
  void keyReact( StateManager manager, boolean pressed )
  {
    //TESTING
    if( key == 'f' && pressed )
      manager.data.character().setFaceStyle( int(random(5)) );
    if( key == 'c' && pressed )
      manager.data.character().setClothColor( color( int(random(255)), int(random(255)), int(random(255)) ) );
    if( key == 's' && pressed )
      manager.data.character().setSkinColor( color( int(random(255)), int(random(255)), int(random(255)) ) );
    if( key == 'h' && pressed )
      manager.data.character().setHairStyle( int(random(5)) );
    if( key == 'd' && pressed )
      manager.data.character().setHairColor( color( int(random(255)), int(random(255)), int(random(255)) ) );
    if( key == 'g' && pressed )
      manager.data.character().setClothStyle( int(random(5)) );
      
    //ALSO TESTING
    if( pressed && keyCode == LEFT )
      manager.data.mapX--;
    if( pressed && keyCode == RIGHT )
      manager.data.mapX++;
    if( pressed && keyCode == UP )
      manager.data.mapY--;
    if( pressed && keyCode == DOWN )
      manager.data.mapY++;
  }
  
  void mouseReact( StateManager manager, boolean pressed )
  {    
    if( startButton.isButtonUnderMouse() ) //If mouse over button
    {
      if( pressed )  //If button being pressed
        startButton.buttonClicked(); //Button sets 'pressed' to true
      else //If being released
      {
        if( startButton.buttonReleased() ) //Un-press button (returns True if under mouse, meaning a complete click event has happened)
          changeState( manager, new TitleScreenState() ); //Change state
      }
    }
    else if( !pressed ) //If mouse button released
    {
      startButton.buttonReleased(); //Un-press button
    }
  }
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
