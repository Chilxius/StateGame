class Character
{
  int HP = 100; //health
  int GP = 0;   //money
  int LP = 0;   //lockpicks
  int rope = 0; //spools of rope
  PVector position = new PVector(2,2);
  
  Character()
  {
    setHairStyle(1);
    setFaceStyle(1);
    setClothStyle(1);
    setHairColor(#FFFFFF);
    setSkinColor(color(190,170,130));
    setClothColor(#F0F0F0);
  }
  
  private color hairColor = color(int(random(255)),int(random(255)),int(random(255)));
  private int hairStyle = int(random(5));
  private color skinColor = color(int(random(255)),int(random(255)),int(random(255)));
  private int faceStyle = int(random(5));
  private color clothColor = color(int(random(255)),int(random(255)),int(random(255)));
  private int clothStyle = int(random(5));
  
  public void display(GameData data, int x, int y, int size)
  {
    noTint();
    image(data.browns(),x,y,size,size);
    tint(clothColor);
    image(data.clothStyle(clothStyle),x,y,size,size);
    tint(skinColor);
    image(data.skin(),x,y,size,size);
    noTint();
    image(data.faceStyle(faceStyle),x,y,size,size);
    tint(hairColor);
    image(data.hairStyle(hairStyle),x,y,size,size);
  }
  public void display(GameData data, int x, int y)
  {
    display(data, x, y, data.defaultCharSize);
  }
  
  //Our changers
  public void setHairStyle(int hairType)         {hairStyle = hairType;}
  public void setHairColor(color hairDye)         {hairColor = hairDye;}
  public void setFaceStyle(int therapy)           {faceStyle = therapy;}
  public void setSkinColor(color skinDye)         {skinColor = skinDye;}
  public void setClothStyle(int clothChange) {clothStyle = clothChange;}
  public void setClothColor(color clothDye)     {clothColor = clothDye;}
  
  public void resetDefault()
  {
    setHairStyle(1);
    setFaceStyle(1);
    setClothStyle(1);
    setHairColor(#FFFFFF);
    setSkinColor(color(190,170,130));
    setClothColor(#F0F0F0);
  }
}
