class TrapState implements GameState
{
  //Options are Attempt to jump over/Avoid, Attempt to run away, Attempt to use item
  ArrayList<Button> buttons = new ArrayList<Button>();
  boolean pickedOption = false;
  String action = "avoid";
  boolean noItem = false;
  PImage trapPic;
  int lHeight;
  int lWidth;
  //String item;
  
  TrapState(GameData data, char code)
  {
    lWidth = data.lilWidth; lHeight = data.lilHeight;
    pickTrap(data, code);
    
    buttons.add(new Button("Attempt to " + action, 289, lHeight - 154, (lWidth - 100)/3, 190));
    buttons.add(new Button("Attempt to run away", 768, lHeight - 154, (lWidth - 100)/3, 190));
    buttons.add(new Button("Attempt to use item", 1248, lHeight - 154, (lWidth - 100)/3, 190));
    buttons.add(new Button("Continue", data.lilWidth / 2, lHeight - 100, 300, 100));
    
    if(data.theCharacter.rope < 1) noItem = true; buttons.get(2).tintButton();
  }
  
  void update(GameData data) {}
  
  void display( GameData data ) 
  {
    background(#1c1f1c);
    
    data.setResolution( data.lilWidth, data.lilHeight );
    push();
    data.applyScale();
    
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
      //SKin hair clothes
      if(i == 2 && noItem)
      {
        i += 1;
      }
      if(i == 3 && !pickedOption)
      {
        return;
      }
      
      Button b = buttons.get(i);
      if(b.isButtonUsed(pressed, manager.data.mX(), manager.data.mY()))
      {
        if(i == 0)
          //if(random()*10 < 9)
          pickedOption = true;
        else if(i == 1)
          //if(random()*10 < 8)
          pickedOption = true;
        else if(i == 2)
          pickedOption = true;
        else if(i == 3)
          changeState(manager, manager.previousState);
      }
    }
  }
  
  void changeState( StateManager manager, GameState newState ) { manager.setState(newState); }
  
  void pickTrap(GameData data, char code)
  {
    if(code == '^') 
      {trapPic = data.trapPics.get("spike"); action = "jump over";}
    else if(code == '~')      
      {trapPic = data.trapPics.get("snake"); action = "jump over";}
    else if(code == '*') 
      {trapPic = data.trapPics.get("rock");}
    else                 
      {trapPic = data.trapPics.get("darts");}
    
    trapPic.resize(lWidth-100, lHeight-300);
  }
}
