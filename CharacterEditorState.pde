class CharacterEditorState implements GameState
{
  ArrayList<Button> buttons = new ArrayList<Button>();
  //Character character;
  
  //color hairColor;
  //color skinColor;
  //color clothesColor;
  
  CharacterEditorState()
  {
    buttons.add(new Button("Back", 100, height - 75));
    buttons.add(new Button("Reset", 300, height - 75));
    buttons.add(new Button("Save", 500, height - 75));
  }
  
  void update( GameData data ){}
  
  void display( GameData data )
  {
    background(10);
    
    //Draws all buttons
    for(int i = 0; i < buttons.size(); i++)
    {
      buttons.get(i).drawButton();
    }
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed ) 
  {
    for(int i = 0; i < buttons.size(); i++)
    {
      Button b = buttons.get(i);
      
      if(b.isButtonUnderMouse())
      {
        if (pressed)
        {
          b.buttonClicked();
        }
        else
        {
          if(b.buttonReleased())
          {
            if(i == 0)
            {
              changeState(manager, new TitleScreenState());
            }
            else if(i == 1)
            {
              //character = new character();
            }
            else
            {
              //character = new character( (INSERT) hairStyle, (INSERT) clothesColor color hairColor, color skinColor, color clothesColor);
            }
          }
        }
      }
      else if (!pressed) 
      {
        // Safety Catch: If the mouse was dragged off the button and released, 
        // make sure the button state resets to unpressed.
        b.buttonReleased();
      }
    }
  }
   
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
