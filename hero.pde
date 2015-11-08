class Hero {
  float x1;
  float y1;
  float s1;
  float s2;
  float s3;
  float s4;  
  float r;
Hero(){
  x1=250;
  y1=250;
  r=15;
}

  void update() {
    fill(0);
    ellipse(x1, y1, r*2, r*2);
    x1=x1-s4;
    x1=x1+s3;
    y1=y1-s1;
    y1=y1+s2;
     if (x1>485) {
    s3=0;
    x1=485;
  }
  if (x1<15) {
    s4=0;
    x1=15;
  }
  if (y1>485) {
    s2=0;
    y1=485;
  }
  if (y1<15) {
    s1=0;
    y1=15;
  }
  }
   void setS1(float newS1_) {
    s1 = newS1_;}
    void setS2(float newS2_) {
    s2 = newS2_;}
    void setS3(float newS3_) {
    s3 = newS3_;}
    void setS4(float newS4_) {
    s4 = newS4_;}
    
    boolean isTouching(Zomies z) {

    // determine distance between the objects
    //        dino - cactus
    float a = y1 - z.getY();
    float b = x1 - z.getX();
    float distance = sqrt(a*a + b*b);

    // decide whether dino is touching this cactus
    //            dino radius   cactus radius
    if ( distance < (   r    +     z.getR()) ) {
      return true;  // exit the method and say "yes" (is touching!) or "true"
    }

    // when dino is not touching, say "no" (not touching) or "false"
    return false;
  }
}

  