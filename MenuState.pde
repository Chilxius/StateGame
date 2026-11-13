class MenuState implements GameState
{
  ArrayList<LilRat> lilRats = new ArrayList<LilRat>();
  
  Button resumeButton, closetButton, quitButton;
  
  boolean smear = false;
  
  MenuState( GameData data )
  {
    resumeButton = new Button( "Resume", data.ritchieWidth/2, data.ritchieHeight/4*1, 200, 100 );
    closetButton = new Button( "Edit Character", data.ritchieWidth/2, data.ritchieHeight/4*2, 300, 100 );
    quitButton   = new Button( "Quit", data.ritchieWidth/2, data.ritchieHeight/4*3, 200, 100 );
    
    for( int i = 0; i < 4; i++ )
      lilRats.add( new LilRat( HALF_PI * i, i, data ) );
  }
  
  void update( GameData data )
  {
    for( LilRat r: lilRats )
      r.update(data);
  }
  
  void display( GameData data )
  {
    if(!smear)
      background(0);
    
    for( LilRat r: lilRats )
      r.display(data);
    
    resumeButton.drawButton();
    closetButton.drawButton();
    quitButton.drawButton();
  }
  
  void keyReact( StateManager manager, boolean pressed ) 
  {
    if( pressed )
    {
      if( key == 'c' )
      {
        lilRats.clear();
        smear = false;
      }
      else if( key == 'r' )
      {
        for( int i = 0; i < 4; i++ )
          if( lilRats.size() < 16 )
            lilRats.add( new LilRat( HALF_PI * i, 4, manager.data ) );
      }
      else
        smear = !smear;
    }
  }
  
  void mouseReact( StateManager manager, boolean pressed )
  {
    if( resumeButton.isButtonUsed(pressed) )
      changeState( manager, new ExploreState() );
    else if(closetButton.isButtonUsed(pressed) )
      changeState( manager, new CharacterEditorState() );
    else if(quitButton.isButtonUsed(pressed) )
      exit();
    else if( pressed && lilRats.size() < 16 )
      lilRats.add( new LilRat( random(TWO_PI), 5, manager.data ) );
  }
  
  void changeState( StateManager manager, GameState newState )
  {
    manager.setState(newState);
  }
 
  class LilRat
  {
    float dist, rotation;
    float speed;
    boolean growing = true, slowing = false;
    color ratTint;
    
    LilRat( float r, int c, GameData data )
    {
      dist = 1;
      rotation = r;
      speed = 1.2;
      switch(c)
      {
        case 0:
          ratTint = color(255,100,100);
          break;
        case 1:
          ratTint = color(255,255,100);
          break;
        case 2:
          ratTint = color(100,255,100);
          break;
        case 3:
          ratTint = color(100,100,255);
          break;
        case 4:
          int red = int(random(2));
          int grn = int(random(2));
          int blu = int(random(2));
          ratTint = color( red==1?255:100, grn==1?255:100, blu==1?255:100 );
          break;
        default:
          ratTint = color( random(100,255),  random(100,255),  random(100,255) );
          speed = random(0.5,2);
          dist = data.ritchieWidth/2+150;
          rotation = random(TWO_PI);
      }
    }
    
    public void update( GameData data )
    {
      rotation += TWO_PI/dist * speed;
      
      if( growing ) dist++;
      else          dist--;
      if( dist > data.ritchieWidth/2 ) growing = false;
      if( dist < 100 ) growing = true;
      
      if( slowing ) speed -= 0.002;
      else          speed += 0.002;
      if( speed > 2 )  slowing = true;
      if( speed < 0.05 ) slowing = false;
    }
    
    public void display( GameData data )
    {
      imageMode(CENTER);
      push();
        tint(ratTint);
        translate(data.ritchieWidth/2,data.ritchieHeight/2);
        rotate(rotation);
        translate(0,dist);
        rotate(-rotation);
        image(data.menuPic, 0, 0);
      pop();
    }
  }
}
