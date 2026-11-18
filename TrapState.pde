class TrapState implements GameState
{
  //Options are Attempt to jump over/Avoid, Attempt to run away, Attempt to use item
  ArrayList<Button> buttons = new ArrayList<Button>();
  PImage trapPic;
  String action = "avoid";
  //String item;
  boolean pickedOption = false;
  
  TrapState(GameData data)
  {
    trapPic = pickTrap(data);
    trapPic.resize(data.lilWidth-100, data.lilHeight-300);
    if(trapPic == data.trapPics.get("spike"))
    {
      action = "jump over";
    }
    
    buttons.add(new Button("Attempt to " + action, 289, data.lilHeight - 154, (data.lilWidth - 100)/3, 190));
    buttons.add(new Button("Attempt to run away", 768, data.lilHeight - 154, (data.lilWidth - 100)/3, 190));
    buttons.add(new Button("Attempt to use item", 1248, data.lilHeight - 154, (data.lilWidth - 100)/3, 190));
    buttons.add(new Button("Continue", data.lilWidth / 2, data.lilHeight - 300, (data.lilWidth - 100)/3, 190));
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
      image(trapPic, data.lilWidth/2, data.lilHeight/2 - 100);
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
    boolean noItem = false;
    
    if(manager.data.theCharacter.rope < 1) noItem = true; buttons.get(2).tintButton();
    
    for(int i = 0; i < buttons.size(); i++)
    {
      //SKin hair clothes
      if(i == 2 && noItem)
      {
        i += 1;
      }
      
      Button b = buttons.get(i);
      if(b.isButtonUsed(pressed, manager.data.mX(), manager.data.mY()))
      {
        if(i == 0)
        {
          //if(random()*10 < 9)
          pickedOption = true;
        }
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
  
  PImage pickTrap(GameData data)
  {
    switch((int)(Math.random()*3))
    {
      case 0: return data.trapPics.get("spike");
      case 1: return data.trapPics.get("rock");
      default: return data.trapPics.get("darts");
    }
  }
}
