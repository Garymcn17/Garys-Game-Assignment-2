Player player;
Enemy death;
float timeDelta = 1.0f / 60.0f;
boolean[] keys = new boolean[1000];
ArrayList<Enemy> enemys = new ArrayList<Enemy>();
int enemies = 1;
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
    enemys.add(diamond);
  }
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
  }

if(frameCount % 120 ==0)
{
  enemys();
} 
  for( Enemy enemy : enemys)
  {
   enemy.render();
   enemy.update();
   if(enemy.shape == player.shape)
    {
      Life = 0;
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