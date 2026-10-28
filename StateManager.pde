class StateManager
{
  GameData data;
  GameState state;
  
  StateManager()
  {
    data = new GameData();
    state = new IntroScreenState();
  }
  
  void display()
  {
    state.display(data);
  }
  
  void update()
  {
    state.update(data);
  }
  
  void keyReact( boolean pressed )
  {
    state.keyReact( this, pressed );
  }
  
  void mouseReact( boolean pressed )
  {
    state.mouseReact( this, pressed );
  }
  
  void setState( GameState newState )
  {
    state = newState;
  }
}
