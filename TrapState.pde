class TrapState implements GameState
{
  //Notes:
  //Options are Attempt to jump over/Avoid, Attempt to run away, Attempt to use item
  //Outcomes are Successed or Failed to traverse the trap (Failed meaning you got damaged)
  ArrayList<Button> buttons = new ArrayList<Button>();
  boolean pickedOption = false;
  String action = "avoid";
  boolean noItem = false;
  int lHeight, lWidth;
  PImage trapPic;
  String item;
  
  TrapState(GameData data, char code)
  {
    lWidth = data.lilWidth; lHeight = data.lilHeight; //Grabbing the height and width is easier
    pickTrap(data, code); //Picks the trap based off the code of the tile
    
    //All the buttons for both screens. Trap screen and after action screen.
    buttons.add(new Button("Attempt to " + action, 289, lHeight - 154, (lWidth - 100)/3, 190));
    buttons.add(new Button("Attempt to run away", 768, lHeight - 154, (lWidth - 100)/3, 190));
    buttons.add(new Button("Attempt to use item", 1248, lHeight - 154, (lWidth - 100)/3, 190));
    buttons.add(new Button("Continue", data.lilWidth / 2, lHeight - 100, 300, 100));
    
    //Needed to disable the item use button if there are no items to use
    if(data.theCharacter.rope < 1) {noItem = true; buttons.get(2).tintButton();}
  }
  
  void update(GameData data) {}
  
  void display( GameData data ) 
  {
    background(#1c1f1c);
    
    data.setResolution( data.lilWidth, data.lilHeight );
    push();
    data.applyScale();
    
    //Picks which screen based off if there was a picked option or not
    if(!pickedOption)
    {
      for(int i = 0; i < buttons.size() - 1; i++) { buttons.get(i).drawButton(); }
    
      fill(#545C52);
      stroke(#545C52);
      rectMode(CENTER);
      image(trapPic, lWidth/2, lHeight/2 - 100);
    }
    else
    {
      buttons.get(buttons.size() - 1).drawButton();
    }
    
    pop();
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed ) 
  {
    for(int i = 0; i < buttons.size(); i++)
    {
      if(i == 2 && noItem) //Ensures the use item button can't be used when you have zero items
      {
        i += 1;
      }
      if(i == 3 && !pickedOption) //Ensures the continue button doesn't get click too early
      {
        return;
      }
      
      Button b = buttons.get(i);
      if(b.isButtonUsed(pressed, manager.data.mX(), manager.data.mY()))
      {
        if(i == 0)
        {
          //if(random()*10 < 9) {}
          manager.data.map.tiles[(int) manager.data.theCharacter.position.x][(int) manager.data.theCharacter.position.y].clearTile();
          pickedOption = true; 
        }
        else if(i == 1)
        {
          //if(random()*10 < 8)
          manager.data.map.tiles[(int) manager.data.theCharacter.position.x][(int) manager.data.theCharacter.position.y].clearTile();
          pickedOption = true;
        }
        else if(i == 2)
        {
          manager.data.map.tiles[(int) manager.data.theCharacter.position.x][(int) manager.data.theCharacter.position.y].clearTile();
          pickedOption = true;
        }
        else if(i == 3)
          changeState(manager, manager.previousState);
      }
    }
  }
  
  void changeState( StateManager manager, GameState newState ) { manager.setState(newState); }
  
  void pickTrap(GameData data, char code)
  {
    if(code == '^') 
      {trapPic = data.trapPics.get("spike"); action = "jump over"; item = "rope";}
    else if(code == '~')      
      {trapPic = data.trapPics.get("snake"); action = "jump over"; item = "rat";}
    else if(code == '*') 
      {trapPic = data.trapPics.get("rock"); item = "mattock";}
    else                 
      {trapPic = data.trapPics.get("darts"); item = "antidote";}
    
    trapPic.resize(lWidth-100, lHeight-300);
  }
}
