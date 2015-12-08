import processing.sound.*;
Zomies[] z;
//***ZOMBIE ghj, NUMBER***
int zcount = 200;
//***ZOMBIE MAX NUMBER***
int shotcount = 200;
int actives;
//classes
Hero hero;
Health Health1;
Bullet Bullet;
Shot[] shot;
//sound
SoundFile shots;
//images
PImage hero1;
PImage mm;
PImage egg;
PImage seed;
PImage melon;
PImage Zombie;
PImage happy;
PImage MM;
PImage bat;
PImage health;
PImage bird;
PImage zombiehead;
PImage Zombie1;
PImage floor;
PImage ammo;
int colour;
int bullet;
int col;
int openScreenImagex;
int openScreenWordx;
int openScreenWordx1;
float q;  //new zombie time counter
int time;  //time
int activez; 
int score;
int high;
int imagex;
int healthNumber;
int deathScreenx;
int invincible;
int invincibleTime;
PrintWriter output;
BufferedReader reader;
String[] highscore;
int in;
float k;
int HC; //highscore per game
int imagex5;
int imagex2;
int imagex3;
int imagex4;
int HCtext;
float ZS;   //Zombie spawn
void setup() {

  size(500, 500);
  hero=new Hero();
  Health1=new Health();
  Bullet=new Bullet();


  //create highscore file

  reader = createReader("highscore.txt");
  //variables
  col=0;
  openScreenImagex=0;
  openScreenWordx=30;
  openScreenWordx1=100;
  q=5;
  k = 10;
  ZS=3;
  //**starting amount activez+1**waw
  activez=10;
  //**starting amount activez+1**
  time=0;
  score=0;
  imagex=1000;
  healthNumber=3;
  deathScreenx=1000;
  invincible=0;
  bullet=5;
  actives = 0;
  colour=0;
  HC = 251;
  imagex5=900;
  imagex2=900;
  imagex3=900;
  imagex4=900;
  HCtext=800;
  //zombie creater
  z = new Zomies[zcount];  
  int i = 0;
  while (i < zcount) { 
    z[i] = new Zomies(false);
    i++;
  }
  int t = 0;
  while (t < activez) { 
    z[t] = new Zomies(true);
    t++;
  }
  shot = new Shot[shotcount];  
  int w = 0;
  while (w < shotcount) { 
    shot[w]=new Shot(hero.getX(), hero.getY(), false);
    w++;
  }
  //images
  Zombie = loadImage("Zombie.jpg");
  mm = loadImage("m&m.png");
  egg = loadImage("angry.png");
  seed = loadImage("seed.png");
  Zombie1 = loadImage("Zombie1.jpg");
  melon = loadImage("melon.png");
  happy = loadImage("happy.png");
  bird = loadImage("bird.png");
  MM = loadImage("mnm.png");
  hero1 = loadImage("batman.png");
  bat = loadImage("bat.png");
  zombiehead = loadImage("zombiehead.png");
  health = loadImage("health1.png");
  ammo = loadImage("ammo.png");
  shots= new SoundFile(this, "FREE SOUND EFFECT - AK- 47 Gun Shot.mp3");
  //reads old highscore
  highscore = loadStrings("highscore.txt");

  //writes old high score
  String line1 = highscore[0];
  high = Integer.parseInt(line1);
}

void draw() {

  if (HC<100&&HC>50) {
    hero.setP(1);
    int q=0;
    while (q<shotcount) {
      shot[q].setc(3);
      q++;
    }
  }
  if (HC>100&&HC<150) {
    hero.setP(2);
    int y=0;
    while (y<shotcount) {
      shot[y].setc(4);
      y++;
    }
  }
  if (HC>200) {
    hero.setP(3);
    int as=0;
    while (as<shotcount) {
      shot[as].setc(1);
      as++;
    }
  }
  if (HC>150&&HC<200) {
    hero.setP(4);
    int b=0;
    while (b<shotcount) {
      shot[b].setc(2);
      b++;
    }
  }

  if (openScreenWordx==30) {
    noLoop();
  }
  //invicibility
  if (invincible>0) {
    invincibleTime = invincibleTime + 1;
    int t = invincibleTime/60;
    invincible = invincible - t;
    hero.setcol(35);
  }
  if (invincible==0) {
    hero.setcol(15);
  }


  background(200);
  Health1.update();
  Bullet.update();
  //add zombies
  time=time+1;
  score=time/60;
  Health1.update();

  if (score>q) {
    q=q+4*1.3;
    Health1.setX(random(10, 490));
    Health1.setY(random(10, 490));
  }

  if (score>ZS) {
    ZS=ZS+4*0.8;
    //safty net
    if (activez>zcount-2) {
      textSize(20);
      text("you did the impossible you beat the max score", 20, 200);
      activez=activez+0;
      high=999999;
      text("Highscore: Infinity!!!", 170, 220);
      noLoop();
    } else {
      activez=activez+1;
    }
  }

  if (score>k) {
    k=k+15*1.5;
    Bullet.setX(random(10, 490));
    Bullet.setY(random(10, 490));
  }
  //draw zombies
  int i = 0;
  while (i < zcount) {  
    z[i].update(); 
    i++;
  }
  //draw bullets
  int g = 0;
  while (g < shotcount) {  
    shot[g].update(); 
    g++;
  }
  z[activez].setA(true);
  shot[actives].setA(true);
  hero.update();  
  //open screen
  noStroke();
  tint(255, 0, 0);
  image(Zombie, openScreenImagex, 0, 500, 500);
  stroke(0);
  fill(255);
  textSize(70);
  text("Zombie Rush", openScreenWordx, 200);
  textSize(25);
  text("Press space to start", openScreenWordx1+50, 230);
  textSize(15);
  fill(0);
  text("Score:"+score, 50, 50);
  text("Health:"+ healthNumber, 50, 70);
  fill(colour, 0, 0);
  text("Ammo:"+ bullet, 50, 90);
  fill(255);
  textSize(15);
  text("Use WASD to move, mouse to aim and shoot.", openScreenWordx1-0, 250);

  //health detection
  int p=0;
  while (p < zcount) {
    if (hero.isTouching(z[p])) {
      if (invincible==0) {
        healthNumber=healthNumber-1;
        invincible=4;
        invincibleTime=0;
        hero.setcol(40);
      }
    }
    p++;
  }

  int m=0;
  while (m < shotcount) {
    if (z[m].isTouching(shot[actives])) {
      z[m].setX(-300);
      shot[actives].setX(600);
      shot[actives].setY(600);
    }
    m++;
  }

  //health points
  if (hero.isTouching(Health1)) {

    healthNumber=healthNumber+1;
    Health1.setX(-20);
    Health1.setY(-20);
  }

  //Ammo
  if (hero.isTouching(Bullet)) {
    bullet=bullet+5;
    Bullet.setX(-20);
    Bullet.setY(-20);
  }
  if (bullet==0) {
    colour=255;
  } else {
    colour=0;
  }
  //death screen
  if (healthNumber<=0) {
    HCtext=200;
    deathScreenx=70;
    imagex=0;
    image(Zombie1, imagex, 0, 500, 500);
    stroke(0);
    fill(255);
    textSize(70);
    text("Game over", deathScreenx-40, 200);
    textSize(15);
    text("Press r key to restart", deathScreenx+100, 230);
    text("Score:"+score, deathScreenx+130, 290);
    activez=0; 
    text("Your highscore today is "+HC, deathScreenx+80, 310);
    noTint();
    if (HC<score) {
      HC=score;
    }
    text("character: ", HCtext, 330);
    if (HC<50) {
      imagex5=200;
      image(happy, imagex5, 350, 60, 60);
    }
    if (HC>150&&HC<200) {
      imagex5=200;
      image(melon, imagex5, 350, 60, 60);
    }
    if (HC>100&&HC<150) {
      imagex3=200;
      image(MM, imagex3, 350, 60, 60);
    }
    if (HC>200) {
      imagex4=200;
      image(hero1, imagex4, 350, 60, 60);
    }
    if (HC>50&&HC<100) {
      imagex2=200;
      image(bird, imagex2, 350, 60, 60);
    }
    if (high<score) {
      int d=score-high;
      high=score;
      output = createWriter("highscore.txt");
      output.println(high);
      output.flush(); // Writes the remaining data to the file
      output.close(); // Finishes the file
      textSize(15);
      text("Wow! You beat your highscore by  "+d, deathScreenx, 250);
      text("   points", 331, 250);
      text("now your highscore is "+high, deathScreenx+80, 270);
    } else {
      text("High Score:"+high, deathScreenx+130, 250);
    }
    noLoop();
  }
}


void keyPressed() {
  if (key==' ') {
    loop();
    col=255;
    openScreenImagex=1000;
    openScreenWordx=1000;
    openScreenWordx1=1000;
  }
  if (key=='r') {

    int i = 0;
    while (i<190) {
      z[i].setX(-30);
      z[i].setA(false);
      i++;
    }
    z[1].setA(true);
    z[2].setA(true);
    z[3].setA(true);
    z[4].setA(true);
    z[5].setA(true);
    z[6].setA(true);
    z[7].setA(true);
    z[8].setA(true);
    z[9].setA(true);
    z[10].setA(true);
    HCtext = 800;
    imagex5=600;
    imagex2=600;
    imagex3=600;
    imagex4=600;
    imagex=1000;
    activez=20;
    hero.setX(250);
    hero.setY(250);
    q=0;
    ZS=0;
    k=0;
    time=0;
    hero.setcol(15);

    healthNumber=3;
    deathScreenx=1000;
    invincible=0;
    invincibleTime=0;
    draw();
    loop();
  }
  if (key == CODED) {
    if (keyCode==UP||  key=='w' || key =='W' ) {
      hero.setS1(3);
      hero.setS2(0);
      hero.setY2(0);
      hero.setX2(hero.getX());
    }
    if (keyCode==DOWN||  key=='s' || key =='S') {
      hero.setS2(3);
      hero.setS1(0);
      hero.setY2(500);
      hero.setX2(hero.getX());
    }
    if (keyCode==LEFT||  key=='a' || key =='A') {
      hero.setS4(3);
      hero.setS3(0);
      hero.setX2(0);
    }
    if (keyCode==RIGHT||  key=='d' || key =='D') {
      hero.setS3(3);
      hero.setS4(0);
      hero.setX2(500);
      hero.setY2(hero.getY());
    }
  }
  if (key=='w' || key =='W' ) {
    hero.setS1(3);
    hero.setS2(0);
    hero.setY2(0);
    hero.setX2(hero.getX());
  }
  if (key=='s' || key =='S') {
    hero.setS2(3);
    hero.setS1(0);
    hero.setY2(500);
    hero.setX2(hero.getX());
  }
  if (key=='a' || key =='A') {
    hero.setS4(3);
    hero.setS3(0);
    hero.setX2(0);
  }
  if (key=='d' || key =='D') {
    hero.setS3(3);
    hero.setS4(0);
    hero.setX2(500);
    hero.setY2(hero.getY());
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode==UP||  key=='w' || key =='W') {
      hero.setS1(0);
    }
    if (keyCode==DOWN||  key=='s' || key =='S') {
      hero.setS2(0);
    }
    if (keyCode==LEFT||  key=='a' || key =='A') {
      hero.setS4(0);
    }
    if (keyCode==RIGHT||  key=='d' || key =='D') {
      hero.setS3(0);
    }
  }
  if (key == ' ') {
  }
  if ( key=='w' || key =='W') {
    hero.setS1(0);
  }
  if (key=='s' || key =='S') {
    hero.setS2(0);
  }
  if (key=='a' || key =='A') {
    hero.setS4(0);
  }
  if (key=='d' || key =='D') {
    hero.setS3(0);
  }
}
void mouseClicked() {
  // shot

  if (bullet>0) {
    bullet=bullet-1;
    actives=actives+1;
    shot[actives].setrise(mouseY-(hero.getY()+15));
    shot[actives].setrun(mouseX-(hero.getX()+15));
  }
}