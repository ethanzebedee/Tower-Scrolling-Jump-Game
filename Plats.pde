class plats
{
  int posX, posY,speed,gwidth,gheight;
  boolean winner;
  
  color colour;
  PImage plat;

  plats(int X, int Y)//general platform Constructor
  {
    posX = X;
    posY = Y;
    speed = 2;
    winner = false;
    plat = loadImage("platform1.png");
  }
  
  plats(int X, int Y, int Speed) //winning door
  {
    posX = X + (int)(random (1, 480));
    posY = Y;
    speed = Speed;
    winner = true;
    
    plat = loadImage("door1.png");
  }
  
    plats()//ground
  {
    posX = 0;
    posY = 760;
    speed = 0;
    gwidth = 480;
    gheight = 40;
    winner = false;
    
    plat = loadImage("platform2.png");
  }
  
 void updateplat()
  {
    posY = posY + speed;
    if (posY > height)
    {
      posY = -heightP;
      posX = int(random(width-widthP));
    }
  }
  
  void updateGround()
  {
    if(player.jump)
    {
      speed = 2;
      posY = posY+ speed;
    }
  }
  
  void displayplat()
  { 
    fill(255);
    //rect(posX, posY, widthP, heightP);
    image(plat, posX, posY, widthP, heightP);
  }
  
  void displayWin()
  {
    if(posY > 0)
    {
      image(plat, posX , posY-80, widthP, 100);
    }
  }
  
  void displayGround()
  {
    fill(255);
    //rect(posX, posY, gwidth, gheight);
    
    image(plat, posX, posY- 20, gwidth, gheight+ 20);
  }
}