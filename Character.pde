class Character
{
  int HP = 100; //health
  int GP = 0;   //money
  int LP = 0;   //lockpicks
  int rope = 0; //spools of rope
  
  color hairColor = color(255,255,255);
  int hairStyle = 1;
  color skinColor = color(255,255,255);
  int faceStyle = 1;
  color clothColor = color(255,255,255);
  int clothStyle = 1;
  
  public void display(GameData data, int x, int y)
  {
    image(data.hairStyle(hairStyle),x,y,100,100);
    image(data.faceStyle(faceStyle),x,y,100,100);
    image(data.clothStyle(clothStyle),x,y,100,100);
  }
}
