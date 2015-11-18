Zomies[] z;
//***ZOMBIE MAX NUMBER***
int zcount = 200;
//***ZOMBIE MAX NUMBER***
//classes
Hero hero;
Health Health1;
//images
PImage hero1;
PImage Zombie;
PImage health;
PImage zombiehead;
PImage Zombie1;
PImage floor;

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
void setup() {

  size(500, 500);
  hero=new Hero();
  Health1=new Health();

  //create highscore file
  
  reader = createReader("highscore.txt");
  //variables
  col=0;
  openScreenImagex=0;
  openScreenWordx=30;
  openScreenWordx1=100;
  q=5;
  //**starting amount activez+1**
  activez=5;
  //**starting amount activez+1**
  time=0;
  score=0;
  imagex=1000;
  healthNumber=1;
  deathScreenx=1000;
  invincible=0;
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
  //images
  Zombie = loadImage("Zombie.jpg");
  Zombie1 = loadImage("Zombie1.jpg");
  hero1 = loadImage("batman.png");
  floor = loadImage("floor.jpg");
  zombiehead = loadImage("zombiehead.png");
  health = loadImage("health1.png");
  highscore = loadStrings("highscore.txt");

  //int k = 0;
  //while (k < activez) { 
  //String line1 = highscore[k];
  //high = Integer.parseInt(line1);
  // k++;
  //}
}

void draw() {
  //output.println(high);
  //output.flush(); // Writes the remaining data to the file
  //output.close(); // Finishes the file
  if (openScreenWordx==30) {
    output.println(high);
    noLoop();
  }

  //invicibility
  if (invincible>0) {
    invincibleTime = invincibleTime + 1;
    int t = invincibleTime/60;
    invincible = invincible - t;
    hero.setcol(35);
    hero.setC(35);
  }
  if (invincible==0) {
    hero.setcol(15);
    hero.setC(15);
  }

  //image(floor, 0, 0, 500, 500);
  background(200);
  Health1.update();

  //add zombies
  time=time+1;
  score=time/60;
  Health1.update();
  if (score>q) {
    q=q+4*0.8;
    Health1.setX(random(5, 495));
    Health1.setY(random(5, 495));

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
  //draw zombies
  int i = 0;
  while (i < zcount) {  
    z[i].update(); 
    i++;
  }
  z[activez].setA(true);
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
  text("Press space key to start", openScreenWordx1, 230);
  fill(0);
  text("Score:"+score, 50, 50);
  text("Health:"+ healthNumber, 50, 70);

  //health detection
  int p=0;
  while (p < zcount) {
    if (hero.isTouching(z[p])) {
      if (invincible==0) {
        healthNumber=healthNumber-1;
        invincible=4;
        invincibleTime=0;
        hero.setcol(40);
        hero.setC(40);
      }
    }
    p++;
  }

  //test shot
  //int j=0;
  //while (j < zcount) {
  //  if (hero.istouching(z[j])) {
  // noLoop();
  //  }
  //  j++;
  //}
  //health points
  if (hero.isTouching(Health1)) {
    hero.setC(20);
    healthNumber=healthNumber+1;
    Health1.setX(-20);
    Health1.setY(-20);
  }


  //death screen
  if (healthNumber<=0) {
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
    while (i<200) {
      z[i].setX(-30);
      z[i].setA(false);
      i++;
    }
    imagex=1000;
    activez=20;
    hero.setX(250);
    hero.setY(250);
    q=0;
    time=0;
    hero.setcol(15);
    hero.setC(15);
    healthNumber=1;
    deathScreenx=1000;
    invincible=0;
    invincibleTime=0;
    draw();
    loop();
  }
  if (key == CODED) {
    if (keyCode==UP) {
      hero.setS1(3);
      hero.setS2(0);
    }
    if (keyCode==DOWN) {
      hero.setS2(3);
      hero.setS1(0);
    }
    if (keyCode==LEFT) {
      hero.setS4(3);
      hero.setS3(0);
    }
    if (keyCode==RIGHT) {
      hero.setS3(3);
      hero.setS4(0);
    }
  }
}
void keyReleased() {
  if (key == CODED) {
    if (keyCode==UP) {
      hero.setS1(0);
    }
    if (keyCode==DOWN) {
      hero.setS2(0);
    }
    if (keyCode==LEFT) {
      hero.setS4(0);
    }
    if (keyCode==RIGHT) {
      hero.setS3(0);
    }
  }
}