class Shot {
  float x;
  float y;
  float r;
  float run;
  float rise;
  float x2;
  float y2;
    int col;
  boolean active;
  Shot(float x2_, float y2_, boolean active_) {
    y2=y2_;
    x2=x2_;
    r=5;
    x=x2;
    y=y2;
    active=active_;
    rise=mouseY-(y2+15);
    run=mouseX-(x2+15);
    col = 0;
  }
  void update() {
    if (col==0) {
      fill(200, 0, 0);
      ellipse(x, y, r*2, r*2);
    }
    if (col==1) {
        imageMode(CENTER);
      image(bat, x, y, r*6, r*3);
       imageMode(CORNER);
    }
     if (col==2) {
        imageMode(CENTER);
      image(seed, x, y, 20, 20);
       imageMode(CORNER);
     }
      if (col==3) {
        imageMode(CENTER);
      image(egg, x, y, 30, 30);
       imageMode(CORNER);
     }
      if (col==4) {
        imageMode(CENTER);
      image(mm, x, y, 20, 20);
       imageMode(CORNER);
     }
    if (active==true) {
      x=x+run/10;
      y=y+rise/10;
    } else if (active==false) {
      x=hero.getX();
      y=hero.getY();
    }
    if (x>505 ||x<-5||y>505||y<-5) {
      x=600;
      y=600;
    }
  }
  void setA(boolean newa_) {
    active = newa_;
  }
  void setX(float newx_) {
    x = newx_;
  }
  void setY(float newy_) {
    y = newy_;
  }
  void setrun(float newrun_) {
    run = newrun_;
  }
  void setrise(float newrise_) {
    rise = newrise_;
  }
  float getX() {
    return x+r;
  }
  float getY() {
    return y+r;
  }
  float getR() {
    return r;
  }
   void setc(int newc_) {
    col = newc_;
  }
}