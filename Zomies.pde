class Zomies {
  float x;
  float y;
  float a;
  float b;
  float r1;

  Zomies() {
    x=random(-50, 250);
    y=random(-50, 0);
    r1=10;
  }
  void update() {
    fill(255, 0, 0);
    ellipse(x, y, r1*2, r1*2);


    if (x>0 && x<25&&y>0&&y<25) {
      x=x+2;
      y=y+2;
     a=random(-2,2);
      b=random(-2,2);
       if(a<1&&a>-1){
         a=random(-2,2);
      }
       if(b<1&&b>-1){
         b=random(-2,2);
      }
    } else if (x>475&&x<500&&y>0&&y<25) {
      x=x-2;
      y=y-2;
    a=random(-2,2);
      b=random(-2,2);
       if(a<1&&a>-1){
         a=random(-2,2);
      }
       if(b<1&&b>-1){
         b=random(-2,2);
      }
    } else if (x>475&&x<500&&y>475&&y<500) {
      x=x-2;
      y=y-2;
     a=random(-2,2);
      b=random(-2,2);
       if(a<1&&a>-1){
         a=random(-2,2);
      }
       if(b<1&&b>-1){
         b=random(-2,2);
      }
    } else if (x>0 && x<25&&y>475&&y<500) {
      x=x+2;
      y=y-2;
     a=random(-2,2);
      b=random(-2,2);
      if(a<1&&a>-1){
         a=random(-2,2);
      }
       if(b<1&&b>-1){
         b=random(-2,2);
      }
    } else if (y>475&&y<500&&x>25&&x<475) {
      y=y-2;
      x=x+2;
     a=random(-2,2);
      b=random(-2,2);
       if(a<1&&a>-1){
         a=random(-2,2);
      }
       if(b<1&&b>-1){
         b=random(-2,2);
      }
    } else if (y>0&&y<25&&x>25&&x<475) {
      y=y+2;
      x=x+2;
     a=random(-2,2);
      b=random(-2,2);
       if(a<1&&a>-1){
         a=random(-2,2);
      }
       if(b<1&&b>-1){
         b=random(-2,2);
      }
    } else if (x>475&&x<500&&y>25&&y<475) {
      x=x-2;
      y=y+2;
     a=random(-2,2);
      b=random(-2,2);
       if(a<1&&a>-1){
         a=random(-2,2);
      }
       if(b<1&&b>-1){
         b=random(-2,2);
      }
    } else if (x>0&&x<25&&y>25&&y<475) {
      x=x+2;
      y=y+2;
    a=random(-2,2);
      b=random(-2,2);
       if(a<1&&a>-1){
         a=random(-2,2);
      }
       if(b<1&&b>-1){
         b=random(-2,2);
      }
    }else if(y>25&&y<475&&x>25&&x<475){
      x=x+b;
      y=y+a;
    } else {
      x=x+2;
      y=y+2;
    }
  }
  float getR() {
   return r1;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  void setX(float newx_) {
    x = newx_;}
}