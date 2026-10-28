class StateManager
{
  GameData data;
  GameState state;
  
  void display()
  {
    state.display();
  }
  
  void update()
  {
    state.update();
  }
  
  void keyReact( boolean pressed )
  {
    state.keyReact(pressed);
  }
  
  void mouseReact( boolean pressed )
  {
    state.mouseReact(pressed);
  }
}
