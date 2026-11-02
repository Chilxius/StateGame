class IntroScreenState implements GameState
{
  //TESTING
  PImage skin, face, hair, clothes, pants;
  
  Button myButton;
  
  IntroScreenState()
  {
    skin = loadImage( "skin.png" );
    face = loadImage( "face2.png" );
    hair = loadImage( "hair1.png" );
    clothes = loadImage( "cloth0.png" );
    pants = loadImage( "browns.png" );
    
    myButton = new Button("Please Push Me",500,500,300,200);
  }
  
  void update( GameData data ) {}
  
  void display( GameData data )
  {
    background(0);
    fill(255);
    textSize(75);
    textAlign(CENTER);
    text("BEST GAME EVAR",width/2,height/2);
    
    imageMode(CENTER);
    noTint();
    image( pants, width/2, height/3 );
    tint(#AD8F51);
    image( skin, width/2, height/3 );
    noTint();
    image( face, width/2, height/3 );
    tint( 250, 75, 200 );
    image( clothes, width/2, height/3 );
    tint( #F5E38A);
    image( hair, width/2, height/3 );
    
    //myButton.drawButton();
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed ) {}
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
