class LockpickState implements GameState
{
  Button backButton;
  
  LockpickState(GameData data)
  {
    data.setResolution( data.cartWidth, data.cartHeight );
    push();
    data.applyScale();
    
    backButton = new Button("Back", data.cartWidth/10, data.cartHeight/10, 150, 100);
    
    pop();
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
    backButton.drawButton();
    
    pop();
  }
  void keyReact(StateManager manager, boolean pressed)
  {
    
  }
  void mouseReact(StateManager manager, boolean pressed)
  {
    if (backButton.isButtonUsed(pressed, manager.data.mX(), manager.data.mY() ))
      changeState(manager, manager.previousState);
  }
  
  void changeState(StateManager manager, GameState newState)
  {
    manager.setState(newState);
  }
}
