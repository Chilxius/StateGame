class CharacterEditorState implements GameState
{
  ArrayList<Button> buttons = new ArrayList<Button>();
  Character character;
  
  int hairStyle;
  int faceStyle;
  int clothStyle;
  color hairColor;
  color skinColor;
  color clothColor;
  
  CharacterEditorState()
  {
    buttons.add(new Button("Back", 100, height - 75));
    buttons.add(new Button("Reset", 300, height - 75));
    buttons.add(new Button("Save", 500, height - 75));
    
    //i = y
    for(int i = 200; i <= 700; i += 100)
    {
      //j = x
      for(int j = 79; j <= 529; j += 50)
      {
        buttons.add(new Button(j, i, 30, 30, color(50), color(150)));
      }
      for(int j = 1249; j <= 1449; j += 50)
      {
        buttons.add(new Button(j, i, 30, 30, color(50), color(150)));
      }
    }
  }
  
  void update( GameData data ){}
  
  void display( GameData data )
  {
    background(30);
    
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
      
      if(b.isButtonUsed(pressed) && i == 0) 
        changeState(manager, new TitleScreenState());
      //if(b.isButtonUsed(pressed) && i == 1) 
        //Character character = new Character();
      //if(b.isButtonUsed(pressed) && i == 2) 
        //Character character = new Character(hairStyle, faceStyle, clothStyle,
        //                                    hairColor, skinColor, clothColor);
    }
  }
   
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
