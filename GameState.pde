interface GameState
{
  void update( GameData data );
  void display( GameData data );
  void keyReact( StateManager manager, boolean pressed );
  void mouseReact( StateManager manager, boolean pressed );
  
  void changeState( StateManager manager, GameState newState );
}

/* How to set up display for correct scaling

  void display( GameData data )
  {
    data.setResolution( data.lilWidth, data.lilHeight );
    push();
    data.applyScale();
    
    ...
    
    pop();
  }
*/
