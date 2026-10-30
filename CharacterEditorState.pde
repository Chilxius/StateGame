class CharacterEditorState implements GameState
{
  void update( GameData data ){}
  
  void display( GameData data )
  {
    background(10);
    noStroke();
    fill(240);
    circle(100, height - 100, 30);
    
    textSize(7);
    fill(10);
    text("Back", 100, height - 100);
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed ) 
  {
    if(pressed)
    {
      if( dist(mouseX, mouseY, 100, height - 100) < 30)
      {
        changeState(manager, new TitleScreenState());
      }
    }
  }
   
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
