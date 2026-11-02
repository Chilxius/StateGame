class IntroScreenState implements GameState
{
  Button startButton;
  
  IntroScreenState()
  {
    startButton = new Button("Please Push Me",500,500,300,200);
  }
  
  void update( GameData data ) {}
  
  void display( GameData data )
  {
    background(0);
    fill(255);
    textSize(75);
    textAlign(CENTER);
    text("BEST GAME EVAR",width/2,height/2);
    
    
    
    startButton.drawButton();
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed ) {}
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
