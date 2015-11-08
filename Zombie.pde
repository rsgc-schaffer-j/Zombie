Zomies z1;
Zomies z2;
Zomies z3;
Zomies z4;
Zomies z5;
Zomies z6;
Zomies z7;
Zomies z8;
Zomies z9;
Zomies z0;
Zomies z10;
Hero hero;
float c;
float v;
float col;
int rectx;
float letx;
float letx1;
void setup() {
  noLoop();
  size(500, 500);
  c=random(-50, 250);
  v=random(-50, 0);
  hero=new Hero();
  z1=new Zomies();
  z2=new Zomies();
  z3=new Zomies();
  z4=new Zomies();
  z5=new Zomies();
  z6=new Zomies();
  z7=new Zomies();
  z8=new Zomies();
  z9=new Zomies();
  z0=new Zomies();
  z10=new Zomies();
  col=0;
  rectx=0;
  letx=30;
  letx1=100;
}
void draw() {
  background(255);
  z1.update();
  z2.update();
  z3.update();
  z4.update();
  z5.update();
  z6.update();
  z7.update();
  z8.update();
  z9.update();
  z0.update();
  z10.update();
  hero.update();  
  fill(255);
  rect(rectx, 0, 500, 500);
  fill(col);
  textSize(70);
  text("Zombie Rush", letx, 200);
  textSize(25);
  text("Press space key to start", letx1, 230);
  if (hero.isTouching(z0)) {
    fill(0);
    textSize(70);
    text("Game over", 30, 200);
    textSize(25);
    text("Press r key to restart", 100, 230);
    noLoop();
  }
  if (hero.isTouching(z1)) {
    fill(0);
    textSize(70);
    text("Game over", 30, 200);
    textSize(25);
    text("Press r key to restart", 100, 230);
    noLoop();
  }
  if (hero.isTouching(z2)) {
    fill(0);
    textSize(70);
    text("Game over", 30, 200);
    textSize(25);
    text("Press r key to restart", 100, 230);
    noLoop();
  }
  if (hero.isTouching(z3)) {
    fill(0);
    textSize(70);
    text("Game over", 30, 200);
    textSize(25);
    text("Press r key to restart", 100, 230);
    noLoop();
  }
  if (hero.isTouching(z4)) {
    fill(0);
    textSize(70);
    text("Game over", 30, 200);
    textSize(25);
    text("Press r key to restart", 100, 230);
    noLoop();
  }
  if (hero.isTouching(z5)) {
    fill(0);
    textSize(70);
    text("Game over", 30, 200);
    textSize(25);
    text("Press r key to restart", 100, 230);
    noLoop();
  }
  if (hero.isTouching(z6)) {
    fill(0);
    textSize(70);
    text("Game over", 30, 200);
    textSize(25);
    text("Press r key to restart", 100, 230);
    noLoop();
  }
  if (hero.isTouching(z7)) {
    fill(0);
    textSize(70);
    text("Game over", 30, 200);
    textSize(25);
    text("Press r key to restart", 100, 230);
    noLoop();
  }
  if (hero.isTouching(z8)) {
    fill(0);
    textSize(70);
    text("Game over", 30, 200);
    textSize(25);
    text("Press r key to restart", 100, 230);
    noLoop();
  }
  if (hero.isTouching(z9)) {
    fill(0);
    textSize(70);
    text("Game over", 30, 200);
    textSize(25);
    text("Press r key to restart", 100, 230);
    noLoop();
  }
  if (hero.isTouching(z10)) {
    fill(0);
    textSize(70);
    text("Game over", 30, 200);
    textSize(25);
    text("Press r key to restart", 100, 230);
    noLoop();
  }
}
void keyPressed() {
  if (key==' ') {
    loop();
    col=255;
    rectx=1000;
    letx=1000;
    letx1=1000;
  }
  if (key=='r') {
    draw();
    loop();
    z0.setX(-5);
    z10.setX(-5);
    z2.setX(-5);
    z3.setX(-5);
    z4.setX(-5);
    z5.setX(-5);
    z6.setX(-5);
    z7.setX(-5);
    z8.setX(-5);
    z9.setX(-5);
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