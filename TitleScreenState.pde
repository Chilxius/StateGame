class TitleScreenState implements GameState
{
  Button newButton;
  Button wardrobeButton;
  Button creditsButton;
  Button quitButton;
  
  TitleScreenState()
  {
    newButton = new Button("New Game", width/2, (height/5), 350, 100);
    wardrobeButton = new Button("Wardrobe", width/2, (height/5)*2, 350, 100);
    creditsButton = new Button("Credits", width/2, (height/5)*3, 350,100);
    quitButton = new Button("Quit Game", width/2, (height/5)*4, 350, 100);
  }
  
  void update( GameData data ){}
  
  void display( GameData data )
  {
    background(0);
    newButton.drawButton();
    wardrobeButton.drawButton();
    creditsButton.drawButton();
    quitButton.drawButton();
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed )
  {
    if (newButton.isButtonUsed(pressed))
      changeState(manager, new ExploreState());
    if (wardrobeButton.isButtonUsed(pressed))
      changeState(manager, new CharacterEditorState());
    if (creditsButton.isButtonUsed(pressed))
      changeState(manager, new CreditState());
    if (quitButton.isButtonUsed(pressed))
      exit();
  }
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
