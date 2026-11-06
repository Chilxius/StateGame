class CharacterEditorState implements GameState
{
  color[] skinPalette = {color(255, 239, 222), color(247, 219, 192), color(247, 218, 175), color(243, 203, 166), color(234, 215, 190), color(226, 198, 161), color(223, 185, 146), color(212, 159, 120), color(186, 134, 101), color(160, 110, 83), color(135, 84, 64), color(114, 73, 53), color(96, 64, 41), color(61, 39, 25)};                         
  color[] hairPalette = {color(245, 235, 215), color(225, 195, 130), color(195, 145, 85), color(160, 110, 65), color(125, 75, 45), color(85, 45, 25), color(55, 30, 15), color(30, 20, 15), color(20, 20, 20), color(155, 55, 40), color(185, 75, 45), color(135, 140, 145), color(195, 195, 200), color(235, 235, 240)};
  color[] clothesPalette = {color(220, 60, 60), color(40, 115, 220), color(45, 165, 90), color(235, 175, 40), color(140, 70, 190), color(225, 105, 160), color(50, 185, 190), color(230, 110, 45), color(35, 60, 130), color(65, 105, 75), color(120, 45, 65), color(80, 85, 90), color(230, 230, 235), color(30, 30, 35)};
  ArrayList<Button> buttons = new ArrayList<Button>();
  
  CharacterEditorState()
  {
    buttons.add(new Button("Back", 200, height - 75));
    buttons.add(new Button("Reset", 400, height - 75));
    
    //Number of buttons for color is 14 while styles is 60
    CreateLeftButtons(skinPalette, 250);
    CreateLeftButtons(hairPalette, 450);
    CreateLeftButtons(clothesPalette, 650);
    
    CreateRightButtons(250);
    CreateRightButtons(450);
    CreateRightButtons(650);
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
    fill(255);
    textAlign(CENTER, CENTER); //Centers text
    
    textSize(50);
    text("Coloration", 303, 75);
    text("Character", width/2 + 110, 75);
    text("Stylization", 1365, 75);
    
    textSize(40);
    
    text("Skin", 303, 200);
    text("Hair", 303, 400);
    text("Clothes", 305, 600);
    text("Skin", 1355, 200);
    text("Hair", 1355, 400);
    text("Clothes", 1355, 600);
    
    data.character().display(data, width/2 + 110, height/2 - 5, 400);
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
    }
  }
   
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
 
  //Creates the Coloration Buttons
  private void CreateLeftButtons(color[] colorPalette, int yPos)
  {
    int k = 0;
    //Both j represents the x position
    for(int j = 79; j <= 529; j += 75)
    {
      buttons.add(new Button(j, yPos, 40, 40, colorPalette[k], color(150)));
      buttons.add(new Button(j, yPos + 75, 40, 40, colorPalette[k + 6], color(150)));
      k++;
    }
  }
  
  //Creates the Stylization Buttons
  private void CreateRightButtons(int yPos)
  {
    int k = 1;
    for(int j = 1240; j <= 1465; j += 75)
    {
      String str = str(k);
      buttons.add(new Button("" + k, color(255), j, yPos, 40, 40, color(50), color(150)));
      buttons.add(new Button("" + (k+2), color(255), j, yPos + 75, 40, 40, color(50), color(150)));
      k++;
    }
  }
}
