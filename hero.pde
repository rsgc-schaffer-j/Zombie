class Hero {
  float x1;
  float y1;
  float x2;
  float y2;
  float s1;
  float s2;
  float s3;
  float s4; 

  //shots
  float l1;
  float l2;
  float l3;
  float l4; 

  //hero
  float r;
  int col;
  int c;
  Hero() {
    x1=250;
    y1=250;
    r=15;
    col=10;
    c=10;
    x2=600;
    y2=0;
  }

  void update() {
    fill(255);
    noStroke();
    ellipse(x1+15, y1+15, col, c);
    image(hero1, x1, y1, 30, 30);

    //shots
    stroke(0);
    line(x1+15, y1+15, x2, y2);

    //hero
    x1=x1-s4;
    x1=x1+s3;
    y1=y1-s1;
    y1=y1+s2;
    c=0;
    if (x1>470) {
      s3=0;
      x1=470;
    }
    if (x1<0) {
      s4=0;
      x1=0;
    }
    if (y1>470) {
      s2=0;
      y1=470;
    }
    if (y1<0) {
      s1=0;
      y1=0;
    }

    //shots
    if (x2>505) {
      y2=y2+5;
    }
    if (x2<-5) {
      y2=y2-5;
    }
    if (y2>505) {
      x2=x2-5;
    }
    if (y2<-5) {
      x2=x2+5;
    }
  }
  void setS1(float newS1_) {
    s1 = newS1_;
  }
  void setS2(float newS2_) {
    s2 = newS2_;
  }
  void setS3(float newS3_) {
    s3 = newS3_;
  }
  void setS4(float newS4_) {
    s4 = newS4_;
  }
  void setC(int newC_) {
    c = newC_;
  }
  void setcol(int newcol_) {
    col= newcol_;
  }
  void setX(float newx_) {
    x1 = newx_;
  }
  void setY(float newy_) {
    y1 = newy_;
  }

  boolean isTouching(Zomies z1) {

    // determine distance between the objects.
    float a = (y1+r) - z1.getY();
    float b = (x1+r) - z1.getX();
    float distance = sqrt(a*a + b*b);
    if ( distance < (   r    +     z1.getR()) ) {
      return true;
    }
    return false;
  }
  boolean isTouching(Health h) {

    // determine distance between the objects.
    float a = (y1+r) - h.getY();
    float b = (x1+r) - h.getX();
    float distance = sqrt(a*a + b*b);
    if ( distance < (   r    +     h.getR()) ) {
      return true;
    }
    return false;
  }
   boolean isTouching(Bullet b1) {

    // determine distance between the objects.
    float a = (y1+r) - b1.getY();
    float b = (x1+r) - b1.getX();
    float distance = sqrt(a*a + b*b);
    if ( distance < (   r    +     b1.getR()) ) {
      return true;
    }
    return false;
  }
  boolean istouching(Zomies z) {

    // determine distance between the objects.
    float m = (y2-(y1+15))/(x2-(x1+15));
    float b = y2-m * x2;
    float c = m * (z.getX()-7.5)+b;
    if ( z.getY()-7.5 < c+10 && z.getY()-7.5 > c-10) {
     return true;
    }
    return false;
  }
}