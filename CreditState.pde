class CreditState implements GameState
{
  Button backButton;
  
  CreditState()
  {
    background(0);
    backButton = new Button("Back", width/10, height/10, 150, 100);
  }
  
  void update(GameData data){}
  
  void display(GameData data)
  {
    fill(#EFEFEF);
    textSize(60);
    textAlign(CENTER);
    text("CREDITS",width/2, height/5);
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
    if (backButton.isButtonUsed(pressed))
      changeState(manager, manager.previousState);
  }
  void mouseReact(StateManager manager, boolean pressed)
  {
  }
  void changeState(StateManager manager, GameState newState)
  {
    manager.setState(newState);
  }
}
