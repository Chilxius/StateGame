class Button
{
  //Instance Variables
  private String text;
  private boolean pressed;
  private float xPos, yPos;
  private float bWidth, bHeight; //Width and Height. b means button.
  private color olColor, flColor; //ol means outline while fl means fill.
  private color baseFlColor; //Keeps the orginal base color safe.
  
  //Constructors (Note: oC is outline color while fC is fill color)
  public Button(float x, float y, float w, float h, color oC, color fC)
  {
    xPos = x; yPos = y;
    bWidth = w; bHeight = h;
    olColor = oC; flColor = fC; baseFlColor = fC;
    
    text = "";
    pressed = false;
  }
  
  public Button(String t, float x, float y, float w, float h)
  {
    text = t;
    xPos = x; yPos = y;
    bWidth = w; bHeight = h;
    
    pressed = false;
    olColor = color(0); flColor = color(255); baseFlColor = flColor;
  }
  
  public Button(String t, float x, float y)
  {
    text = t;
    xPos = x; yPos = y;
    
    pressed = false;
    bWidth = 100; bHeight = 50;
    olColor = color(0); flColor = color(255); baseFlColor = flColor;
  }
  
  //Methods
  void drawButton()
  {
    //A Check, before drawing button, for hovering to darken button if true
    if (isButtonUnderMouse()) 
    {
      //Creates a darker color of the baseFlColor when hovered over
      color hoverColor = lerpColor(baseFlColor, color(0), 0.2); //20% darker
      fill(hoverColor);
    } 
    else 
    {
      //If not hovering over it will change back to orginal color
      fill(baseFlColor);
    }
    
    stroke(olColor);
    rectMode(CENTER);
    rect(xPos, yPos, bWidth, bHeight);
    
    textSize(25);
    fill(10);
    textAlign(CENTER, CENTER);
    text(text, xPos, yPos);
  }
  
  boolean isButtonUnderMouse()
  {
    //Check for if mouse inside the boundaries of a button object
    if((mouseX > xPos - (bWidth/2) && mouseX < xPos + (bWidth/2)) &&
       (mouseY > yPos - (bHeight/2) && mouseY < yPos + (bHeight/2)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void unpressButton()
  {
    pressed = false;
  }
  
  void changeColor(color oC, color fC)
  {
    olColor = oC; flColor = fC; baseFlColor = fC;
  }
}
