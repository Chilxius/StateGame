class LockpickState implements GameState
{
  LockpickState(GameData data)
  {
    
  }
  
  void update(GameData data )
  {
    
  }
  void display(GameData data)
  {
    data.setResolution( data.cartWidth, data.cartHeight );
    push();
    data.applyScale();
    
    rectMode(CENTER);
    background(0);
    rect(data.cartWidth/2, data.cartHeight/2, 100, 350);
    pop();
  }
  void keyReact(StateManager manager, boolean pressed)
  {
    
  }
  void mouseReact(StateManager manager, boolean pressed)
  {
    
  }
  
  void changeState(StateManager manager, GameState newState)
  {
    manager.setState(newState);
  }
}
