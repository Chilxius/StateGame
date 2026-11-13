class Button
{
  //Instance Variables
  private String text;
  private boolean pressed;
  private float roundness;
  private float xPos, yPos, bWidth, bHeight; //b means button.
  private color olColor, flColor, baseFlColor, textColor; //ol means outline while fl means fill.
  
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
  
  //Draws the button
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
  
  //Check for if the button is under the mouse
  //boolean isButtonUnderMouse()
  //{
  //  //Check for if mouse inside the boundaries of a button object
  //  if((mouseX > xPos - (bWidth/2) && mouseX < xPos + (bWidth/2)) &&
  //     (mouseY > yPos - (bHeight/2) && mouseY < yPos + (bHeight/2)))
  //  {
  //    return true;
  //  }
  //  else
  //  {
  //    return false;
  //  }
  //}
  
  //New version that works with scaling
  boolean isButtonUnderMouse( float mx, float my )
  {
    return (mx > xPos - bWidth/2 &&
            mx < xPos + bWidth/2 &&
            my > yPos - bHeight/2 &&
            my < yPos + bHeight/2);
  }
  
  //Clicks button so it changes color
  private void buttonClicked()
  {
    flColor = lerpColor(baseFlColor, color(0), 0.4);
    pressed = true;
  }
  
  //Releases button so its not always pressed down
  private boolean buttonReleased(float mX, float mY)
  {
    flColor = baseFlColor; 
    
    if(pressed && isButtonUnderMouse(mX, mY))
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
  
  //Methods to report if the button is actually used or not
  boolean isButtonUsed(boolean pressed, float mX, float mY) 
  {
    if (isButtonUnderMouse(mX, mY)) 
    {
        if (pressed) 
        {
            buttonClicked();
        } 
        else 
        {
            if (buttonReleased(mX, mY)) //If mouse is over the button but NOT pressed
            {
                return true;
            }
        }
    } 
    else 
    {
        if (!pressed) //If the mouse is NOT over the button and the click was released
        {
            buttonReleased(mX, mY); // Un-press button
        }
    }
    
    return false; //Catch-all return
  }
  
  //Getter Methods
  color getFillColor() { return baseFlColor; }
  color getOutlineColor() { return olColor; }
  String getText() { return text; }
  
  //Changer Methods
  void changeColor(color fC, color oC) { olColor = oC; flColor = fC; baseFlColor = fC; }
  void changeRoundness(float newRoundness) { roundness = newRoundness; }
}
