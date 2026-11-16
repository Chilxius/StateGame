class LockpickState implements GameState
{
  Button backButton;
  
  int difficulty = 1;
  float currentPos = 450;
  float targetNode = random(175, 725);
  float acc = 0;
  
  LockpickState( GameData data )
  {
    data.setResolution(data.cartWidth, data.cartHeight);
    push();
    data.applyScale();
    
    image(data.bigDoor, data.cartWidth/2, data.cartHeight/2);
    
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
    
    imageMode(CENTER);
    image(data.keyhole, data.cartWidth/2, data.cartHeight/2);
    rectMode(CENTER);
    noStroke();
    fill(#FFFFFF);
    rect(data.cartWidth/2, data.cartHeight/2, 50, 550);
    fill(#CC0000);
    rect(data.cartWidth/2, data.cartHeight/2, 50, 60);
    noFill();
    strokeWeight(4);
    stroke(#000000);
    rect(data.cartWidth/2, data.cartHeight/2, 50, 550);
    
    noStroke();
    backButton.drawButton();
    
    //fill(255-progress, progress,0);
    
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
