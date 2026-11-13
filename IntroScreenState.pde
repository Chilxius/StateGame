class IntroScreenState implements GameState
{
  Button startButton;
  
  IntroScreenState( GameData data )
  {
    startButton = new Button("Start Game", data.ritchieWidth/2, data.ritchieHeight-200, 150,100);
    
    background(100);
    
    drawGradient( data );
    
    
    //image( data.introPic, width/2, height/3, 300, 300 );
    fill(255);
    textSize(75);
    textAlign(CENTER);
    text("BEST GAME EVAR",data.ritchieWidth/2,data.ritchieHeight/2);
  }
  
  void update( GameData data ) {}
  
  void display( GameData data )
  {
    
    image( data.introPic, data.ritchieWidth/2, data.ritchieHeight/3-50, 300, 300 );
    
    //image( data.creditPics.get("ritchie"), width/2, height/3-50, 300, 300 );
    
    //data.character().display(data, width/2, height/2-200);
    
    startButton.drawButton();
  }
  
  private void drawGradient( GameData data )
  {
    noStroke();
    for( int i = 50; i>=0; i -- )
    {
      fill( 100-i*2, 0, 200-i*4, 200 );
      circle( data.ritchieWidth/2, data.ritchieHeight/2, data.ritchieWidth/30*i );
    }
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
  }
  
  void mouseReact( StateManager manager, boolean pressed )
  {    
    if( startButton.isButtonUsed(pressed) )
      changeState( manager, new TitleScreenState( manager.data ) );
  }
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
