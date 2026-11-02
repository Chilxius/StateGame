class TitleScreenState implements GameState
{
  void update( GameData data ){}
  
  void display( GameData data )
  {
    background(169,169,169);
    
  }
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed ) {}
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
