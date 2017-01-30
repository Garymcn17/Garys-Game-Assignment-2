Gates gate;
Player player;
Enemy death;
float timeDelta = 1.0f / 60.0f;
boolean[] keys = new boolean[1000];
ArrayList<Enemy> enemys = new ArrayList<Enemy>();
int enemies = 1;
Float release = 600.0;
int GateCollision =5;
void setup()
{
  fullScreen();
  player = new Player(width / 2, height / 2, 0, 50);
}

void Background()
{
  background(0,0);
  fill(0);
  stroke(#0DBEFC);
  rect(10,10,width-20, height-20);
}

void enemys()
{
  for( i = 0; i < enemies; i++)
  {
    Enemy diamond = new Enemy(width - random(60,120), height -random(60,120));
    Enemy diamond1 = new Enemy(width - random(60,120), 0 +random(60,120));
    Enemy diamond2 = new Enemy(0 + random(60,120), 0 +random(60,120));
    Enemy diamond3 = new Enemy(0 + random(60,120), height - random(60,120));
    
    enemys.add(diamond);
    if(frameCount > release)
    {
       enemys.add(diamond1);
    }
    if(frameCount > release*2)
    {
    enemys.add(diamond2);
    }
    if(frameCount > release*3)
    {
    enemys.add(diamond3);
    }
  }
}

void GateArray()
{
    Gates gate = new Gates(random(width),random(height), 5);
    
    gates.add(gate);
}



int i;
void draw()
{
  Background();
  
  if( Life == 1)
  {
    player.update();
    player.render();
  }
  else 
  {
    fill(#D10F3F);
    rect(50,50,50,50);
    noFill();
  }

    if(frameCount % 180 ==0)
    {
      enemys();
      GateArray();
    } 
  
  int s = enemys.size();
  for(int i = s -1; i >= 0 ; i--)
  {
    Enemy die = enemys.get(i);
   die.render();
   die.update();
    
  }
  
  for(Gates gate : gates)
  {
    if(gateHit == 0)
    {
      gate.render();
      gate.update();
    }
  }
}

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}