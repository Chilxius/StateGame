class LockpickState implements GameState
{
  Button backButton;
  Bar bar;
  
  LockpickState( GameData data )
  {
    data.setResolution(data.cartWidth, data.cartHeight);
    push();
    data.applyScale();
    
    image(data.bigDoor, data.cartWidth/2, data.cartHeight/2);
    image(data.keyhole, data.cartWidth/2, data.cartHeight/2);
    
    bar = new Bar();
    
    backButton = new Button("Back", data.cartWidth/10, data.cartHeight/10, 150, 100);
    
    pop();
  }
  
  void update(GameData data)
  {
    bar.update();
  }
  void display(GameData data)
  {
    data.setResolution( data.cartWidth, data.cartHeight );
    push();
    data.applyScale();
    
    imageMode(CENTER);
    rectMode(CENTER);
    noStroke();
    fill(#FFFFFF);
    rect(data.cartWidth/2, data.cartHeight/2, 50, 550);
    bar.display(data);
    noFill();
    strokeWeight(4);
    stroke(#A5A9B4);
    rect(data.cartWidth/2, data.cartHeight/2, 50, 550);
    
    noStroke();
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
  
  
  
  
  
  
  class Bar
  {
    float yPos = 450;
    float barSize = 60;
    int difficulty = 1;
    float targetNode = random(175, 725);
    float spd = 0;
    float acc = 0.3;
    float friction = 0.95;
    float percentComplete = 0;
    int nextChange = millis() +200;
    float barrier = barSize/2;
    
    void display(GameData data)
    {
      rectMode(CENTER);
      fill(255 - percentComplete*25.6, percentComplete*25.6,0);
      noStroke();
      rect(data.cartWidth/2, yPos, 50, 60);
    }
    void update()
    {
      if (millis() > nextChange)
      {
        nextChange = millis() + 2000;
        targetNode = random(175+(barrier), 725-(barrier));
      }
      if (targetNode > yPos)
        spd += acc;
      else
        spd -= acc;
      
      spd *= friction;
      yPos += spd;
      if (yPos < 175+barrier || yPos > 725-barrier)
        spd = spd - 2*spd;
    }
  }
}
