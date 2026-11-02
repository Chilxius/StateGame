class GameData
{
  private PImage hairStyles[] = new PImage[5];
  private PImage clothStyles[] = new PImage[5];
  private PImage faceStyles[] = new PImage[5];
  private PImage browns, skin;
  
  private Character theCharacter;
  
  private Map map;
  
  GameData()
  {
    loadImages();
    theCharacter = new Character();
    map = new Map();
  }
  
  public Character character()
  {
    return theCharacter;
  }
  
  private void loadImages()
  {
    for( int i = 0; i < 5; i++ )
    {
      hairStyles[i] = loadImage( "hair"+i+".png" );
      faceStyles[i] = loadImage( "face"+i+".png" );
      clothStyles[i] = loadImage( "cloth"+i+".png" );
    }
    browns = loadImage( "browns.png" );
    skin = loadImage( "skin.png" );
  }
  
  public PImage hairStyle( int i )
  {
    if( i < hairStyles.length )
      return hairStyles[i];
    else
      return hairStyles[0];
  }
  
  public PImage clothStyle( int i )
  {
    if( i < clothStyles.length )
      return clothStyles[i];
    else
      return clothStyles[0];
  }
  
  public PImage faceStyle( int i )
  {
    if( i < faceStyles.length )
      return faceStyles[i];
    else
      return faceStyles[0];
  }
  
  public PImage browns()
  {
    return browns;
  }
  
  public PImage skin()
  {
    return skin;
  }
}
