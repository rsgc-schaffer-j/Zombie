class Bullet {
  float x;
  float y;
  float r;

  Bullet() {
    x=random(5, 495);
    y=random(5, 495);
    r=10;
    col=0;
  }
  void update() {
      fill(200, 0, 0);
      image(ammo, x, y, r*2, r*2);
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
  void setX(float newx_) {
    x = newx_;
  }
  void setY(float newy_) {
    y = newy_;
  }
}