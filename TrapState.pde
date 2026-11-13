class TrapState implements GameState
{
  void update(GameData data) 
  {
    
  }
  
  void display( GameData data ) 
  {
    background(0);
    fill(255);
    textAlign(CENTER, CENTER); //Centers text
    textSize(50);
    text("It's a trap!", width/2, height/2);
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  void mouseReact( StateManager manager, boolean pressed ) {}
  
  void changeState( StateManager manager, GameState newState ) {}
}
