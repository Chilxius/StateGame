class Character
{
  int HP = 100; //health
  int GP = 0;   //money
  int LP = 0;   //lockpicks
  int rope = 0; //spools of rope
  
  private color hairColor = color(int(random(255)),int(random(255)),int(random(255)));
  private int hairStyle = int(random(5));
  private color skinColor = color(int(random(255)),int(random(255)),int(random(255)));
  private int faceStyle = int(random(5));
  private color clothColor = color(int(random(255)),int(random(255)),int(random(255)));
  private int clothStyle = int(random(5));
  
  public void display(GameData data, int x, int y)
  {
    noTint();
    image(data.browns(),x,y,150,150);
    tint(clothColor);
    image(data.clothStyle(clothStyle),x,y,150,150);
    tint(skinColor);
    image(data.skin(),x,y,150,150);
    noTint();
    image(data.faceStyle(faceStyle),x,y,150,150);
    tint(hairColor);
    image(data.hairStyle(hairStyle),x,y,150,150);
  }
  
  //Our changers
  public void setHairStyle(int hairType)         {hairStyle = hairType;}
  public void setHairColor(color hairDye)         {hairColor = hairDye;}
  public void setFaceStyle(int therapy)           {faceStyle = therapy;}
  public void setSkinColor(color skinDye)         {skinColor = skinDye;}
  public void setClothStyle(int clothChange) {clothStyle = clothChange;}
  public void setClothColor(color clothDye)     {clothColor = clothDye;}
}
