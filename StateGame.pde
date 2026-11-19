//Big Game with State
StateManager manager;
DataAccessObject dao;

void setup()
{
  fullScreen();
  imageMode(CENTER);
  dao = new DataAccessObject();
  manager = new StateManager();
}

void draw()
{
  manager.display();
  manager.update();
}

void keyPressed()   {  manager.keyReact(true);   }
void keyReleased()  {  manager.keyReact(false);  }
void mousePressed() { manager.mouseReact(true);  }
void mouseReleased(){ manager.mouseReact(false); }
