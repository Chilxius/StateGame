class IntroScreenState implements GameState
{
  //TESTING
  PImage skin, face, hair, clothes, pants;
  
  IntroScreenState()
  {
    skin = loadImage( "skin.png" );
    face = loadImage( "face0.png" );
    hair = loadImage( "hair3.png" );
    clothes = loadImage( "cloth1.png" );
    pants = loadImage( "browns.png" );
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
    tint(#EDDFB1);
    image( skin, width/2, height/3 );
    noTint();
    image( face, width/2, height/3 );
    tint( 50, 75, 200 );
    image( clothes, width/2, height/3 );
    tint( #F5E38A);
    image( hair, width/2, height/3 );
  }
  
  void keyReact( StateManager manager, boolean pressed ) {}
  
  void mouseReact( StateManager manager, boolean pressed ) {}
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
}
