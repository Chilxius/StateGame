class TitleScreenState implements GameState
{
  Button newButton;
  
  TitleScreenState()
  {
    newButton = new Button("New Game", width/2, (height/2)-200, 150,100);
  }
  
  void update( GameData data ){}
  
  void display( GameData data )
  {
    background(0);
    newButton.drawButton();
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed )
  {
    if (newButton.isButtonUsed(pressed))
      changeState( manager, new ExploreState() );
  }
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
