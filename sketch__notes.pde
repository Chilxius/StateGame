/*
rectMode(CENTER)
imageMode(CENTER)

push()
  //changes
pop() //changes revert

Button:
  Multiple constructors
  Needs to know:
    was I pressed?
    position
    size
    color (have a default)
    text

  Needs to be able to:
    draw self
    un-press self
    report if under mouse
    change visuals
    
Character:
  Construct on new game with defaults
  
  Needs to know:
    style and color of:
      hair
      skin
      clothes
    health
    money
    lockpicks
    rope
    
  Needs to be able to do:
    draw self
      big
      small
      
    public void display( GameData d, int x, int y )
      image( data.hairStyle(hairStyle), x, y, 100, 100 );
    change:
      hair
      skin
      clothes
*/
