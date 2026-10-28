class CharacterEditorState implements GameState
{
  void update( GameData data ){}
  
  void display( GameData data )
  {
    background(0);
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed ) {}
   
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
