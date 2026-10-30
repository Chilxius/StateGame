/*
              Settings <--*  *--> Lockpick
                 ^        |  |  *--> NPC/Riddle
                 |        |  |  |
                 V        V  V  V    ,--> Win
    Splash --> Title -->  Explore --<
                 ^        ^  ^  ^    `--> Game Over
                 |        |  |  |
                 V        |  |  *--> Fight
               DressUp <--*  *--> Trap
*/

class StateManager
{
  GameData data;
  GameState state;
  GameState previousState;
  
  StateManager()
  {
    data = new GameData();
    state = new IntroScreenState();
    //state = new CharacterEditorState();
    //state = new TitleScreenState();
  }
  
  void display()
  {
    state.display(data);
  }
  
  void update()
  {
    state.update(data);
  }
  
  void keyReact( boolean pressed )
  {
    state.keyReact( this, pressed );
  }
  
  void mouseReact( boolean pressed )
  {
    state.mouseReact( this, pressed );
  }
  
  void setState( GameState newState )
  {
    state = newState;
  }
}
