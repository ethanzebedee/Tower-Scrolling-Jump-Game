class Princess
{
  PImage princes;
  int prinX, prinY, speedX, speedY, prinW, prinH;
  boolean jump = false;
  boolean onplat =false;
  int right =  0;
  Princess()
  {
    prinX = 240;// this magic number is the X co'ord
    prinY = 700;
    speedX = 5;
    speedY = 20;
    
    prinW = 20;
    prinH = 50;
    
    princes = loadImage("princess1_jumpst3.png");
  }
  void updatePrin()
  {
    if(!onplat)
    {
      prinY +=3;
    }
    else
    {
      prinY +=2;
    }
    if(mousePressed)
    {
      if (mouseX < width/3 && jump == false)
        {
          right = 0;
          jump = true;
        }
        else if (mouseX > width/3 + width/3 && jump == false)
        {
          right = 1;
          jump = true;
        }
         else if (mouseX > width/3 && mouseX < (width/3)*2 && jump == false)
        {
          jump = true;
          right = 2;
        }
    }
    
    if(jump)
    {
      switch(right)
      {
        case 1:
        {
          prinX = prinX + speedX;
          prinY = prinY-speedY;
          speedY = speedY - 1;
         
          break;
        }
        case 0:
        {
          prinX = prinX - speedX;
          prinY = prinY - speedY;
          speedY = speedY - 1;
          
          break;
        }
        case 2:
        {
          prinY = prinY - speedY;
          speedY = speedY - 1;
          
          break;
        }
      }
    }
  }
   void displayPrin()
  { 
    fill(255);
    image(princes,prinX, prinY- 30, prinW+25, prinH+50);
  }
}