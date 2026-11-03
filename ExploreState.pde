class ExploreState implements GameState
{
  void update( GameData data ){}
  void display( GameData data )
  {
    data.map.display( data.mapX, data.mapY );
    fill(200,0,0);
    circle(width/2,height/2,50);
  }
  void keyReact( StateManager manager, boolean pressed ){}
  void mouseReact( StateManager manager, boolean pressed ){}
  
  void changeState( StateManager manager, GameState newState ){manager.setState( newState );}
}
