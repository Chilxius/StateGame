class CharacterEditorState implements GameState
{                           
  ArrayList<Button> buttons = new ArrayList<Button>();
  
  color[] colorPalette = { // 1. SKIN
                           #FFE7D1, #F5CFAF, #E5B288, #C98E63, #A36842, #7A4829, #4A2918,
                           #9BB58E, #5C8252, #78A8C8, #9D82C4, #CC6666, #E0C870, #7E848C,
                           // 2. HAIR
                           #F5E6C8, #DEC08A, #BA8E52, #8C5830, #5E351B, #381F11, #1C1717,
                           #EBEFF5, #8D949E, #D98A6C, #C26D65, #7FA89E, #89A3C2, #A88BB5,
                           // 3. CLOTHES
                           #D97874, #E39B6D, #E8C776, #85B58E, #7BA5C9, #A28EC4, #D98FA8,
                           #4F6D8A, #5B8A72, #B56576, #C49A6C, #6EB5B0, #A3BD75, #D97E6A};
  
  CharacterEditorState()
  {
    buttons.add(new Button("Back", 200, height - 75));
    buttons.add(new Button("Reset", 400, height - 75));
    
    CreateButtons(); //Buttons 2-59 are color while 59- are style
  }
  
  void update( GameData data ) {}
  
  void display( GameData data )
  {
    background(0);
    image(data.stagePic, width/2 + 110, height/2 + 20, 500, 580);
    //Draws all buttons
    for(int i = 0; i < buttons.size(); i++) { buttons.get(i).drawButton(); }
    
    fill(255);
    textAlign(CENTER, CENTER); //Centers text
    
    textSize(50);
    text("Color", 303, 75); text("Character", width/2 + 110, 75); text("Style", 1355, 75);
    
    textSize(40);
    text("Skin", 303, 200); text("Hair", 303, 400); text("Clothes", 305, 600);
    text("Face", 1352, 200); text("Hair", 1352, 400); text("Clothes", 1352, 600);
    
    data.character().display(data, width/2 + 110, height/2 - 20, 400);
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed ) 
  {
    for(int i = 0; i < buttons.size(); i++)
    {
      //SKin hair clothes
      Button b = buttons.get(i);
      if(b.isButtonUsed(pressed))
      {
        if(i == 0) 
          changeState(manager, manager.previousState);
        else if(i == 1)
          manager.data.theCharacter.resetDefault();
        else if(i >= 2 && i <= 15)
          manager.data.theCharacter.setSkinColor(b.getFillColor());
        else if(i >= 16 && i <= 23)
          manager.data.theCharacter.setFaceStyle(Integer.parseInt(b.getText()));
        else if(i >= 24 && i <= 37)
          manager.data.theCharacter.setHairColor(b.getFillColor());
        else if(i >= 38 && i <= 45)
          manager.data.theCharacter.setHairStyle(Integer.parseInt(b.getText()));
        else if(i >= 46 && i <= 59)
          manager.data.theCharacter.setClothColor(b.getFillColor());
        else if(i >= 60 && i <= 67)
          manager.data.theCharacter.setClothStyle(Integer.parseInt(b.getText()));
      }
    }
  }
   
  void changeState( StateManager manager, GameState newState ) { manager.setState(newState); }
 
  //Creates the all Buttons
  private void CreateButtons()
  {
    int cIndex = 0; //cIndex means color Index
    for(int i = 250; i <= 650; i += 200)
    {
      //Both j represents the x position
      for(int j = 79; j <= 529; j += 75)
      {
        buttons.add(new Button(j, i, 40, 40, colorPalette[cIndex], color(150)));
        buttons.add(new Button(j, i + 75, 40, 40, colorPalette[cIndex + 7], color(150)));
        cIndex++;
      }
      cIndex += 7;
      
      int n = 1; //N is the which number of style
      for(int j = 1240; j <= 1465; j += 75)
      {
        buttons.add(new Button("" + n, j, i, 40, 40, color(50), color(150), color(255)));
        buttons.add(new Button("" + (n+4), j, i+75, 40, 40, color(50), color(150), color(255)));
        n++;
      }
    }
  }
}
