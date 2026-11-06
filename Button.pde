class Button
{
  //Instance Variables
  private String text;
  private boolean pressed;
  private float roundness;
  private float xPos, yPos;
  private float bWidth, bHeight; //Width and Height. b means button.
  private color olColor, flColor; //ol means outline while fl means fill.
  private color textColor; //Keeps the orginal base color safe.
  private color baseFlColor; //Keeps the orginal base color safe.
  
  //Constructors (Note: oC is outline color while fC is fill color)
  public Button(String t, float x, float y, float w, float h, color fC, color oC, color tC)
  {
    text = t;
    textColor = tC;
    xPos = x; yPos = y;
    bWidth = w; bHeight = h;
    olColor = oC; flColor = fC; baseFlColor = fC;
    
    roundness = 10;
    pressed = false;
  }
  
  public Button(float x, float y, float w, float h, color fC, color oC)
  {
    xPos = x; yPos = y;
    bWidth = w; bHeight = h;
    olColor = oC; flColor = fC; baseFlColor = fC;
    
    text = "";
    roundness = 10;
    pressed = false;
    textColor = color(10);
  }
  
  public Button(String t, float x, float y, float w, float h)
  {
    text = t;
    xPos = x; yPos = y;
    bWidth = w; bHeight = h;
    
    roundness = 10;
    pressed = false;
    textColor = color(10);
    olColor = color(0); flColor = color(255); baseFlColor = flColor;
  }
  
  public Button(String t, float x, float y)
  {
    text = t;
    xPos = x; yPos = y;
    
    roundness = 10;
    pressed = false;
    textColor = color(10);
    bWidth = 100; bHeight = 50;
    olColor = color(0); flColor = color(255); baseFlColor = flColor;
  }
  
  //Methods
  void drawButton()
  {
    stroke(olColor);
    rectMode(CENTER); //Rect draws from center now instead of left top corner
    fill(flColor);
    rect(xPos, yPos, bWidth, bHeight, roundness);
    
    textSize(25);
    fill(textColor);
    textAlign(CENTER, CENTER); //Centers text to middle of button
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
  
  private void buttonClicked()
  {
    flColor = lerpColor(baseFlColor, color(0), 0.4);
    pressed = true;
  }
  
  private boolean buttonReleased()
  {
    flColor = baseFlColor; 
    
    if(pressed && isButtonUnderMouse())
    {
      pressed = false;
      return true;
    }
    else
    {
      pressed = false;
      return false;
    }
  }
  
  boolean isButtonUsed(boolean pressed) 
  {
    if (isButtonUnderMouse()) 
    {
        if (pressed) 
        {
            buttonClicked();
        } 
        else 
        {
            if (buttonReleased()) //If mouse is over the button but NOT pressed
            {
                return true;
            }
        }
    } 
    else 
    {
        if (!pressed) //If the mouse is NOT over the button and the click was released
        {
            buttonReleased(); // Un-press button
        }
    }
    
    return false; //Catch-all return
  }
  
  void changeColor(color newFC, color newOC)
  {
    olColor = newOC; flColor = newFC; baseFlColor = newFC;
  }
  
  void changeRoundness(float newRoundness)
  {
    roundness = newRoundness;
  }
}
