class TitleScreenState implements GameState
{
  void update( GameData data ){}
  
  void display( GameData data )
  {
    background(898989);
    text("Play", width/3,height/2);
    noFill();
  }
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed ) {}
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
