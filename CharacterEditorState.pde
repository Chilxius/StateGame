class CharacterEditorState implements GameState
{
  ArrayList<Button> buttons = new ArrayList<Button>();
  //Character character;
  
  color hairColor;
  color skinColor;
  color clothesColor;
  
  void update( GameData data ){}
  
  void display( GameData data )
  {
    background(10);

    buttons.add(new Button("Back", 100, height - 75));
    buttons.add(new Button("Reset", 300, height - 75));
    buttons.add(new Button("Save", 500, height - 75));
    
    //Draws all buttons
    for(int i = 0; i < buttons.size(); i++)
    {
      buttons.get(i).drawButton();
    }
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed ) 
  {
    if(pressed)
    {
      for(int i = 0; i < buttons.size(); i++)
      {
        if(buttons.get(i).isButtonUnderMouse() && i == 0)
        {
          buttons.get(i).unpressButton();
          changeState(manager, new TitleScreenState());
        }
        else if(buttons.get(i).isButtonUnderMouse() && i == 2)
        {
          buttons.get(i).unpressButton();
          //character = new character();
        }
        else
        {
          buttons.get(i).unpressButton();
          //character = new character( (INSERT) hairStyle, (INSERT) clothesColor color hairColor, color skinColor, color clothesColor);
        }
      }
    }
    else
    {
      
    }
  }
   
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
