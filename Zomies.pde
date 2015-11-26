class Zomies {
  float x;
  float y;
  float a;
  float b;
  float r1;
  float speed;
  boolean active;
 
  Zomies(boolean active_) {
    x=random(-50, 250);
    y=random(-50, -40);
    r1=15;
    speed=0;
    active=active_;
  }
  void update() {
    noTint();
    image(zombiehead,x, y, 30, 30);

    if (active==true) {
      speed=2;
      if (x>0 && x<25&&y>0&&y<25) {
        x=x+speed;
        y=y+speed;
        a=random(-speed, speed);
        b=random(-speed, speed);
        if (a<1&&a>-1) {
          a=random(-speed, speed);
        }
        if (b<1&&b>-1) {
          b=random(-speed, speed);
        }
      } else if (x>475&&x<500&&y>0&&y<25) {
        x=x-speed;
        y=y-speed;
        a=random(-speed, speed);
        b=random(-speed, speed);
        if (a<1&&a>-1) {
          a=random(-speed, speed);
        }
        if (b<1&&b>-1) {
          b=random(-speed, speed);
        }
      } else if (x>475&&x<500&&y>475&&y<500) {
        x=x-3;
        y=y-speed;
        a=random(-speed, speed);
        b=random(-speed, speed);
        if (a<1&&a>-1) {
          a=random(-speed, speed);
        }
        if (b<1&&b>-1) {
          b=random(-speed, speed);
        }
      } else if (x>0 && x<25&&y>475&&y<500) {
        x=x+speed;
        y=y-speed;
        a=random(-speed, speed);
        b=random(-speed, speed);
        if (a<1&&a>-1) {
          a=random(-speed, speed);
        }
        if (b<1&&b>-1) {
          b=random(-speed, speed);
        }
      } else if (y>475&&y<500&&x>25&&x<475) {
        y=y-speed;
        x=x+random(-speed, speed);
        a=random(-speed, speed);
        b=random(-speed, speed);
        if (a<1&&a>-1) {
          a=random(-speed, speed);
        }
        if (b<1&&b>-1) {
          b=random(-speed, speed);
        }
      } else if (y>0 && y<25 && x>25 && x<475) {
        y=y+speed;
        x=x+random(-speed, speed);
        a=random(-speed, speed);
        b=random(-speed, speed);
        if (a<1&&a>-1) {
          a=random(-speed, speed);
        }
        if (b<1&&b>-1) {
          b=random(-speed, speed);
        }
      } else if (x>475&&x<500&&y>25&&y<475) {
        x=x-speed;
        y=y+random(-speed, speed);
        a=random(-speed, speed);
        b=random(-speed, speed);
        if (a<1&&a>-1) {
          a=random(-speed, speed);
        }
        if (b<1&&b>-1) {
          b=random(-speed, speed);
        }
      } else if (x>0&&x<25&&y>25&&y<475) {
        x=x+speed;
        y=y+random(-speed, speed);
        a=random(-speed, speed);
        b=random(-speed, speed);
        if (a<1&&a>-1) {
          a=random(-speed, speed);
        }
        if (b<1&&b>-1) {
          b=random(-speed, speed);
        }
      } else if (y>25&&y<475&&x>25&&x<475) {
        x=x+b;
        y=y+a;
      } else if (x==-300){
      }else {
        x=x+speed;
        y=y+speed;
      }
    } else if (active==false) {
      speed=0;
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
  boolean isTouching(Shot s) {

    // determine distance between the objects.
    float a = (y+r1) - s.getY();
    float b = (x+r1) - s.getX();
    float distance = sqrt(a*a + b*b);
    if ( distance < (   r1    +     s.getR()) ) {
      return true;
    }
    return false;
  }
}

  