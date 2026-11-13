class GameData
{
  private PImage hairStyles[] = new PImage[8];
  private PImage clothStyles[] = new PImage[8];
  private PImage faceStyles[] = new PImage[8];
  private PImage browns, skin;
  
  PImage introPic, menuPic;
  PImage stagePic;
  
  HashMap<String,PImage> creditPics = new HashMap<String,PImage>();
  
  //HashMap helps to organize the images, and allows them to be
  // passed to Map() while the GameData and StateManager do not
  // yet exist.
  //All images added to mapImages should use lower-case, spaced
  // names for the keys: "stone wall", "door"
  HashMap<String,PImage> mapImages = new HashMap<String,PImage>();
  
  private Character theCharacter;
  int defaultCharSize = 64;
  
  private Map map;
  //Navigation data (could be assumed by character)
  //private int mapX, mapY;
  
  GameData()
  {
    loadImages();
    theCharacter = new Character();
    
    //mapX = 2;
    //mapY = 2;
    map = new Map(mapImages);
  }
  
  public Character character()
  {
    return theCharacter;
  }
  
  private void loadImages()
  {
    for( int i = 0; i < 8; i++ )
    {
      hairStyles[i] = loadImage( "hair"+i+".png" );
      faceStyles[i] = loadImage( "face"+i+".png" );
      clothStyles[i] = loadImage( "cloth"+i+".png" );
    }
    browns = loadImage( "browns.png" );
    skin = loadImage( "skin.png" );
    
    //Map images
    mapImages.put( "stone wall", loadImage( "wall.png" ) );
    mapImages.put( "door", loadImage( "doorLocked.png" ) );
    mapImages.put( "sealed door", loadImage( "doorSealed.png" ) );
    mapImages.put( "door frame", loadImage( "doorOpen.png" ) );
    mapImages.put( "stone button", loadImage( "buttonStone.png" ) );
    mapImages.put( "pushed stone button", loadImage( "buttonStonePressed.png" ) );
    mapImages.put( "wood button", loadImage( "buttonWood.png" ) );
    mapImages.put( "pushed wood button", loadImage( "buttonWoodPressed.png" ) );
    mapImages.put( "portcullis", loadImage( "portcullis.png" ) );
    
    introPic = loadImage( "fatRat.png" );
    menuPic = loadImage( "whiteRat.png" ); menuPic.resize(100,0);
    stagePic = loadImage( "stage.png" ); stagePic.resize(500,0);
    
    creditPics.put( "ritchie", loadImage("RedTrollz.png") );
    creditPics.get( "ritchie" ).resize(100,0);
    creditPics.put( "carter", loadImage("FancierReaper.png") );
    creditPics.get( "carter" ).resize(100,0);
    creditPics.put( "lillian", loadImage("DarkAngler.png") );
    creditPics.get( "lillian" ).resize(100,0);
  }
  
  public PVector charPos()
  {
    return character().position;
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
  
  //************************************//
  //*** RESOLUTION SCALING FUNCTIONS ***//
  //************************************//
  //***       ChatGPT Assisted       ***//
  //************************************//
 
  int ritchieWidth = 1707;
  int ritchieHeight = 1067;
  int lilWidth = 1536;
  int lilHeight = 960;
  //int cartWidth = 2880;
  //int cartHeight = 1800;
  int cartWidth = 1440;
  int cartHeight = 900;
  
  float scaleX;
  float scaleY;

  void setResolution(int originalWidth, int originalHeight)
  {
    scaleX = (float)width / originalWidth;
    scaleY = (float)height / originalHeight;
  }

  void applyScale()
  {
    scale(scaleX, scaleY);
  }

  public float mX()
  {
    return mouseX / scaleX;
  }

  public float mY()
  {
    return mouseY / scaleY;
  }
  
  //************************************//
  //************************************//
}
