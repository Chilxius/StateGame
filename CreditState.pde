class CreditState implements GameState
{
  Button backButton;
  
  CreditState(GameData data)
  {
    background(0);
    backButton = new Button("Back", data.cartWidth/10, data.cartHeight/10, 150, 100);
  }
  
  void update(GameData data){}
  
  void display(GameData data)
  {
    fill(#EFEFEF);
    textSize(60);
    textAlign(CENTER);
    text("CREDITS", width/2, height/5);
    text("Bennett Ritchie", width/2, (height/5)*2);
    image(data.creditPics.get("ritchie"), (width/2)+300,(height/5)*2);
    text("Lillian Schouweiler", width/2, (height/5)*3);
    image(data.creditPics.get("lillian"), width/4, (height/5)*3);
    text("Carter Corbett", width/2, (height/5)*4);
    image(data.creditPics.get("carter"), (width/2)+300,(height/5)*4);
    backButton.drawButton();
    
    
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
