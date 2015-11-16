class Zomies {
  float x;
  float y;
  float a;
  float b;
  float r1;
  int x1;
  boolean active;

  Zomies(boolean active_) {
    x=random(-50, 250);
    y=random(-50, -40);
    r1=15;
    x1=0;
    active=active_;
  }
  void update() {
    noTint();
    image(zombiehead,x, y, 30, 30);

    if (active==true) {
      x1=2;
      if (x>0 && x<25&&y>0&&y<25) {
        x=x+x1;
        y=y+x1;
        a=random(-x1, x1);
        b=random(-x1, x1);
        if (a<1&&a>-1) {
          a=random(-x1, x1);
        }
        if (b<1&&b>-1) {
          b=random(-x1, x1);
        }
      } else if (x>475&&x<500&&y>0&&y<25) {
        x=x-x1;
        y=y-x1;
        a=random(-x1, x1);
        b=random(-x1, x1);
        if (a<1&&a>-1) {
          a=random(-x1, x1);
        }
        if (b<1&&b>-1) {
          b=random(-x1, x1);
        }
      } else if (x>475&&x<500&&y>475&&y<500) {
        x=x-3;
        y=y-x1;
        a=random(-x1, x1);
        b=random(-x1, x1);
        if (a<1&&a>-1) {
          a=random(-x1, x1);
        }
        if (b<1&&b>-1) {
          b=random(-x1, x1);
        }
      } else if (x>0 && x<25&&y>475&&y<500) {
        x=x+x1;
        y=y-x1;
        a=random(-x1, x1);
        b=random(-x1, x1);
        if (a<1&&a>-1) {
          a=random(-x1, x1);
        }
        if (b<1&&b>-1) {
          b=random(-x1, x1);
        }
      } else if (y>475&&y<500&&x>25&&x<475) {
        y=y-x1;
        x=x+random(-x1, x1);
        a=random(-x1, x1);
        b=random(-x1, x1);
        if (a<1&&a>-1) {
          a=random(-x1, x1);
        }
        if (b<1&&b>-1) {
          b=random(-x1, x1);
        }
      } else if (y>0&&y<25&&x>25&&x<475) {
        y=y+x1;
        x=x+random(-x1, x1);
        a=random(-x1, x1);
        b=random(-x1, x1);
        if (a<1&&a>-1) {
          a=random(-x1, x1);
        }
        if (b<1&&b>-1) {
          b=random(-x1, x1);
        }
      } else if (x>475&&x<500&&y>25&&y<475) {
        x=x-x1;
        y=y+random(-x1, x1);
        a=random(-x1, x1);
        b=random(-x1, x1);
        if (a<1&&a>-1) {
          a=random(-x1, x1);
        }
        if (b<1&&b>-1) {
          b=random(-x1, x1);
        }
      } else if (x>0&&x<25&&y>25&&y<475) {
        x=x+x1;
        y=y+random(-x1, x1);
        a=random(-x1, x1);
        b=random(-x1, x1);
        if (a<1&&a>-1) {
          a=random(-x1, x1);
        }
        if (b<1&&b>-1) {
          b=random(-x1, x1);
        }
      } else if (y>25&&y<475&&x>25&&x<475) {
        x=x+b;
        y=y+a;
      } else {
        x=x+x1;
        y=y+x1;
      }
    } else if (active==false) {
      x1=0;
    }
  }
  float getR() {
    return r1;
  }
  float getX() {
    return x+r1;
  }
  float getY() {
    return y+r1;
  }
   void setR(float newr_) {
    r1 = newr_;
  }
  void setX(float newx_) {
    x = newx_;
  }
  void setA(boolean newa_) {
    active = newa_;
  }
}