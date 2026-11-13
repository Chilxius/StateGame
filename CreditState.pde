class CreditState implements GameState
{
  Button backButton;
  
  CreditState(GameData data)
  {
    data.setResolution( data.cartWidth, data.cartHeight );
    push();
    data.applyScale();
    
    background(0);
    backButton = new Button("Back", data.cartWidth/10, data.cartHeight/10, 150, 100);
    
    pop();
  }
  
  void update(GameData data){}
  
  void display(GameData data)
  {
    data.setResolution( data.cartWidth, data.cartHeight );
    push();
    data.applyScale();
    
    fill(#EFEFEF);
    textSize(60);
    textAlign(CENTER);
    text("CREDITS", data.cartWidth/2, data.cartHeight/5);
    text("Bennett Ritchie", data.cartWidth/2, (data.cartHeight/5)*2);
    image(data.creditPics.get("ritchie"), (data.cartWidth/2)+300,(data.cartHeight/5)*2);
    text("Lillian Schouweiler", data.cartWidth/2, (data.cartHeight/5)*3);
    image(data.creditPics.get("lillian"), data.cartWidth/4, (data.cartHeight/5)*3);
    text("Carter Corbett", data.cartWidth/2, (data.cartHeight/5)*4);
    image(data.creditPics.get("carter"), (data.cartWidth/2)+300,(data.cartHeight/5)*4);
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
