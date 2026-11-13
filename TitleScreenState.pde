class TitleScreenState implements GameState
{
  Button newButton;
  Button wardrobeButton;
  Button creditsButton;
  Button quitButton;
  
  TitleScreenState(GameData data)
  {
    data.setResolution( data.lilWidth, data.lilHeight );
    push();
    data.applyScale();
    
    newButton = new Button("New Game", data.cartWidth/2, (data.cartHeight/5), 350, 100);
    wardrobeButton = new Button("Wardrobe", data.cartWidth/2, (data.cartHeight/5)*2, 350, 100);
    creditsButton = new Button("Credits", data.cartWidth/2, (data.cartHeight/5)*3, 350,100);
    quitButton = new Button("Quit Game", data.cartWidth/2, (data.cartHeight/5)*4, 350, 100);
    
    pop();
  }
  
  void update( GameData data ){}
  
  void display( GameData data )
  {
    data.setResolution( data.lilWidth, data.lilHeight );
    push();
    data.applyScale();
    
    background(0);
    newButton.drawButton();
    wardrobeButton.drawButton();
    creditsButton.drawButton();
    quitButton.drawButton();
    
    pop();
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed )
  {
    if (newButton.isButtonUsed(pressed))
      changeState(manager, new ExploreState());
    if (wardrobeButton.isButtonUsed(pressed))
      changeState(manager, new CharacterEditorState(manager.data));
    if (creditsButton.isButtonUsed(pressed))
      changeState(manager, new CreditState(manager.data));
    if (quitButton.isButtonUsed(pressed))
      exit();
  }
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
