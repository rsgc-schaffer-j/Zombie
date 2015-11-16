class Hero {
  float x1;
  float y1;
  float s1;
  float s2;
  float s3;
  float s4;  
  float r;
  int col;
  int c;
  Hero() {
    x1=250;
    y1=250;
    r=15;
    col=10;
    c=10;
  }

  void update() {
    fill(255);
    noStroke();
ellipse(x1+15,y1+15,col,c);
    image(hero1,x1, y1, 30, 30);
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
  void setR(float newr_) {
    r = newr_;
  }

  boolean isTouching(Zomies z) {

    // determine distance between the objects.
    float a = (y1+r) - z.getY();
    float b = (x1+r) - z.getX();
    float distance = sqrt(a*a + b*b);
    if ( distance < (   r    +     z.getR()) ) {
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
}