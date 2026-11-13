//Big Game with State
StateManager manager;

void setup()
{
  fullScreen();
  imageMode(CENTER);
  manager = new StateManager();
  
  println(width + " " + height);
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
