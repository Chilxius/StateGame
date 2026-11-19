class Monster
{
  int difficulty;
  String name;
  int health;
  int power;
  
  String [] attacks = new String[3];
  String waste;
  
  Monster( String [] data )
  {
    difficulty = Integer.parseInt(data[0]);
    name = data[1];
    health = Integer.parseInt(data[2]);
    power = Integer.parseInt(data[3]);
    for(int i = 0; i < 3; i++)
      attacks[i] = data[4+i];
    waste = data[7];
  }
  
  public int attack()
  {
    return int(random(power*0.5,power*1.5));
  }
}
