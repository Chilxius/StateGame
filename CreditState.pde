class CreditState implements GameState
{
  CreditState()
  {
    background(0);
    textAlign(CENTER);
    textSize(60);
  }
  
  void update(GameData data){}
  
  void display(GameData data)
  {
    fill(#EFEFEF);
    text("CREDITS",width/2, height/5);
    text("Bennett Ritchie", width/2, (height/5)*2);
    image(data.creditPics.get("ritchie"), (width/2)+300,(height/5)*2);
    text("Lillian Schouweiler", width/2, (height/5)*3);
    image(data.creditPics.get("lillian"), width/4, (height/5)*3);
    text("Carter Corbett", width/2, (height/5)*4);
    image(data.creditPics.get("carter"), (width/2)+300,(height/5)*4);
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
