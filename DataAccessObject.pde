class DataAccessObject
{
  //Accesses the monster file and loads them into the game based on
  // their difficulty level. File data should be in this order:
  //  Monster Difficulty Level          0
  //  Monster Name                      1
  //  Monster Health                    2
  //  Monster Attack Power              3
  //  Monster's 1st attack description  4
  //  Monster's 2nd attack description  5
  //  Monster's 3rd attack description  6
  //  Monster's waste turn description  7
  //  Next Monster Difficulty           0
  //  Next Monster Name                 1
  //  Next Monster Health               2
  //  etc...
  
  public HashMap<Integer,ArrayList<Monster>> getMonsterData()
  {
    HashMap<Integer,ArrayList<Monster>> monsterList = new HashMap<Integer,ArrayList<Monster>>();

    String [] fileData = loadStrings( "monsterData.txt" );
    String [] nextMonsterData = new String[8];
    
    for( int i = 0; i < fileData.length; i++ )
    {
      nextMonsterData[i%8] = fileData[i];
      if( i%8 == 7 )
      {
        if( !monsterList.containsKey( Integer.parseInt(nextMonsterData[0]) ) );
          monsterList.put( Integer.parseInt(nextMonsterData[0]), new ArrayList<Monster>() );
        monsterList.get( Integer.parseInt(nextMonsterData[0]) ).add( new Monster( nextMonsterData ) );
      }
    }

    return monsterList;
  }
}
