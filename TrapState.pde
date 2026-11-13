class TrapState implements GameState
{
  //Options are Attempt to jump over/Avoid, Attempt to run away, Attempt to use item
  ArrayList<Button> buttons = new ArrayList<Button>();
  
  TrapState(GameData data)
  {
    buttons.add(new Button("Attempt to Jump Over", data.lilWidth/3, data.lilHeight - 100, 100, 100));
  }
  
  void update(GameData data) {}
  
  void display( GameData data ) 
  {
    background(0);
    
    data.setResolution( data.lilWidth, data.lilHeight );
    push();
    data.applyScale();
    
    fill(255);
    rectMode(CENTER);
    rect( data.lilWidth/2, data.lilHeight/2 - 100, data.lilWidth-100,data.lilHeight-300);
    
    pop();
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  void mouseReact( StateManager manager, boolean pressed ) {}
  
  void changeState( StateManager manager, GameState newState ) {}
}

//public enum Trap
//{
//  SPIKES(), PIT(), BOULDER(), BEARTRAP();
//  String option1;
//  String option2;
//  String option3;
  
//  Trap(String opt1, String t2, String t3, String t4)
//  {
    
//  }
  
//  static public Trap randomTrap()
//  {
//    switch((int)(Math.random()*2))
//    {
//      case 0: return SPIKES;
//      case 1: return PIT;
//      default: return BOULDER;
//    }
//  }
//}
