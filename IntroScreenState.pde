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
    
    data.map.display();
    
    fill(255);
    textSize(75);
    textAlign(CENTER);
    text("BEST GAME EVAR",width/2,height/2);
    
    data.character().display(data, width/2, height/2-200);
    
    startButton.drawButton();
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed )
  {
    //button reaction
  }
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
