class Character
{
  int HP = 100; //health
  int GP = 0;   //money
  int LP = 0;   //lockpicks
  int rope = 0; //spools of rope
  
  color hairColor = color(255,255,50);
  int hairStyle = int(random(5));
  color skinColor = color(255,220,255);
  int faceStyle = int(random(5));
  color clothColor = color(76,255,26);
  int clothStyle = int(random(5));
  
  public void display(GameData data, int x, int y)
  {
    noTint();
    image(data.browns(),x,y,100,100);
    tint(clothColor);
    image(data.clothStyle(clothStyle),x,y,100,100);
    tint(skinColor);
    image(data.skin(),x,y,100,100);
    noTint();
    image(data.faceStyle(faceStyle),x,y,100,100);
    tint(hairColor);
    image(data.hairStyle(hairStyle),x,y,100,100);
  }
}
