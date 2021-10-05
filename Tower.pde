plats[] platforms = new plats[16];
plats ground;
plats win;

import ddf.minim.*;

Minim minim;

AudioPlayer tune; //<>//

AudioPlayer tunewin;
AudioPlayer tuneplay;
AudioPlayer tunedead;
AudioPlayer tunecred;

Princess player = new Princess();

PImage princess_1;
PImage shoesred;
PImage chetroof;
int posX, posY;
boolean walkTo;

int credY1 = 20, credY2 = 40, credY3 = -40, credY4 = -20, credY5 = -100, credY6 = -80, credY7 = -160, credY8 = -140, credY9 = -220, credY10 = -200, credY15 = -280 , credY16 = -260, credY17 = -340, credY18 = -320, credY19 = -400, credY20 = -380;
int credY11 = -500, credY12 = -470, credY13 = -450, credY14 = -430;
int grY = 760, grX = 0,grW = 480,grH = 40;
int widthP;
int heightP;
int state = 0;
int charselect = 1;
PImage titscrn; //<>//
PImage titscrn2;
PImage backg1;
PImage backg2;
int backY1, backY2;

PImage dbg;

void setup()
{
  size(480, 800);
 
  setUpGame(); //<>//
  
  //
  minim = new Minim(this);
  tune = minim.loadFile("Hidden Agenda.mp3");
  tunewin = minim.loadFile("Clear Air.mp3");
  tuneplay = minim.loadFile("Lord of the Land.mp3");
  tunedead = minim.loadFile("Virtutes Vocis.mp3");
  tunecred = minim.loadFile("Gymnopedie No 3.mp3");
}

void draw()
{
  switch(state) //<>//
  {
    case 0:
    {
      image(titscrn, 0, 0, 480, 800);
      if (mousePressed)
      { 
        tune.loop(0);
        state = 1;
      }
    { 
    
  }
  break;
  }
    
    case 1:
    {
      image(backg1, 0, 0, 480, 800);
      textSize(32);
      text("Pick A Character!", 100, 50);
      rect(0,100, 175, 200);
      rect(160,100, 175, 200);
      rect(320,100, 175, 200);
      textSize(16);
      text("Princess Sven", 25, 325);
      text("Princess Pelvis", 180, 325);
      text("Llamacorn", 350, 325);
      fill(255, 50, 50);
      rect(200,400, 100, 50);
      rect(195,500, 115, 50);
      fill(255);
      textSize(32);
      text("Play!", 215, 435);
      text("Credits", 200, 535);
      break;
    }
    case 2:
    {
  background(0);
  drawBackGrounds();
  for (int i = 0; i< 8; i++)
  { 
    platforms[i].displayplat();
    platforms[i].updateplat();
    //if(player.prinY + player.prinH >= platforms[i].posY && player.prinY + player.prinH <= platforms[i].posY+10 && player.prinX + player.prinW > platforms[i].posX && player.prinX <platforms[i].posX + widthP)
    if( player.prinY + player.prinH >= platforms[i].posY && player.prinY + player.prinH <= platforms[i].posY+10 && player.prinX + player.prinW/2 > platforms[i].posX && player.prinX + player.prinW/2 < platforms[i].posX + widthP)
    {
      
      println("I'm on the plat");
      player.onplat = true;
      player.prinY = platforms[i].posY - player.prinH;
      player.jump = false;
      
      player.speedY = 20;
      player.speedX = 5;
      
    }
    if(  player.prinY + player.prinH >= ground.posY && player.prinY + player.prinH <= ground.posY+10 && player.prinX + player.prinW/2 > ground.posX && player.prinX + player.prinW/2 < ground.posX + ground.gwidth)
    {
      println("I'm on the ground");
      player.onplat = true;
      player.prinY = ground.posY - player.prinH;
    }
    
    if( player.prinY + player.prinH >= win.posY && player.prinY + player.prinH <= win.posY+10 && player.prinX + player.prinW/2 > win.posX && player.prinX + player.prinW/2 < win.posX + widthP)
    {
      println("I did it mom! whoo get teh camera!");
      player.onplat = true;
      player.prinY = platforms[i].posY - player.prinH;
      player.jump = false;
      state = 5;
    }
    else  //<>//
    {
      player.onplat = false;
    }
  } 
    player.updatePrin();
    player.displayPrin();
    
    ground.updateGround();
    ground.displayGround();
    
    win.updateplat();
    win.displayWin();
    
    if (player.prinY > height)
    {
      state = 4;
      tuneplay.pause();
      tunedead.loop(0);
    }
    
  break;
    }
       
 case 3: //Need to be finished
    {
    background(0);
    tune.pause();
    textSize(32);
    credY1++;
    credY2++;
    credY3++;
    credY4++;
    credY5++;
    credY6++;
    credY7++;
    credY8++;
    credY9++;
    credY10++;
    credY11++;
    credY12++;
    credY13++;
    credY14++;
    credY15++;
    credY16++;
    credY17++;
    credY18++;
    credY19++;
    credY20++;
    text("Thanks To:", 0, credY1);
    text("Designer:", 0, credY3);
    text("Programmer:", 0, credY5);
    text("Artist:", 0, credY7);
    text("Writer:", 0, credY9);
    text("Composer/Music:", 0, credY11);
    text("Princess Sven:", 0, credY15);
    text("Princess Pelvis:", 0, credY17);
    text("Llamacorn:", 0, credY19);
    textSize(16);
    text("Cian O'Siorain and Sadhbh Stapleton Doyle", 0, credY2);
    text("Wiktoria Szczepaniak", 0, credY4);
    text("Ethan Hammond", 0, credY6);
    text("Sean Gilbride", 0, credY8);
    text("Wiktoria Szczepaniak", 0, credY10);
    text("Hidden Agenda, Lord Of The Land, Clear Air, Gymnopedia and Virtutes Vocis Kevin MacLeod (incompetech.com)",0,credY12); 
    text("Licensed under Creative Commons: By Attribution 3.0",0,credY13); 
    text("http://creativecommons.org/licenses/by/3.0/", 0, credY14);
    text("Eoin Bracken-Kavanagh", 0,credY16);
    text("Elvis Nzekwe", 0, credY18);
    text("Miguel Ryan", 0, credY20);
    if(credY1 > height)
    {
       state = 1;
       tunecred.pause();
       tune.loop(0);
    }
   break;
  }
       
       case 4:
       {
         background(0);
         image(dbg, 0, 0, 480, 800);
         if (mousePressed)
         { 
           setUpGame();
           state = 1;
           tuneplay.pause();
           tunedead.pause();
           tune.loop(0);
         }
         break;
       }
       case 5:
       {
         animateEnd();
         break;
       }
  }
  
}

void 
mouseClicked()
{
  switch(state)
  {
    case 1:
    {
      if(mouseX>0 && mouseY>100 && mouseX<175 && mouseY<200)
      {
        charselect = 1;
      }
      if(mouseX>160 && mouseY>100 && mouseX<175+160 && mouseY<300)
      {
        charselect = 2;
      }
      if(mouseX>320 && mouseY>100 && mouseX<495 && mouseY<400)
      {
        charselect = 3;
      }
      if ( mouseX>200 && mouseY>400 && mouseX<300 && mouseY<450)
      {
         state = 2;
         tune.pause();
         tuneplay.loop(0);
      }
      
      if( mouseX>195 && mouseY>500 && mouseX<310 && mouseY<550)
      {
        state = 3;
        tunecred.loop(0);
      }
      break;
    }
  }
}

void setUpGame()
{
  win = new plats(0, -800, 2);
  player = new Princess();
   background(0);
  widthP = 100;
  heightP = 20;
  titscrn = loadImage("openscreen.png");
  titscrn2 = loadImage("openscreen.png");
  backg1 = loadImage("wall.png");
  backg2 = loadImage("wall.png");
  dbg = loadImage("death thing.png");
  princess_1 = loadImage("princess1_jumpst3.png");
  chetroof = loadImage("chet.png");
  shoesred = loadImage("shoesred.png");
  for (int i = 0; i< 8; i++)
  {
    platforms[i]= new plats(int(random(width-widthP)), -10-(i*100)+int(random(16)));
  }
  ground = new plats();
}

void setUpAnimate()
{
  posX = -50;
  posY = height - 200;
  walkTo = true;
}

void animateEnd()
{
  image(chetroof, 0, 0, width, height);
  println("Im here " + posX);
  fill(255);
  
  if(posX >= 300)
  {
    walkTo = true;
    println("better go");
  }
  if(!walkTo)
  {
    image(princess_1, posX, 550, 80, 160); 
    image(shoesred, 300, 650, 25, 50);
    posX ++;
  }
  else
  {
    pushMatrix();
    scale(-1,1);
    image(princess_1, -posX, 550, 80, 160);
    popMatrix();
    posX --;
    if (posX < 0)
    {
      state = 3;
    }
  }
  
}

void drawBackGrounds()
{
  
  if(backY1 == 0)
  {
    backY2 = -800;
  }
  if(backY2 == 0)
  {
    backY1 = -800;
  }
  backY1 = backY1 + 2;
  backY2 = backY2 + 2;
  
  image(backg1, 0, backY1, 480, 800);
  image(backg2, 0, backY2, 480, 800);
}