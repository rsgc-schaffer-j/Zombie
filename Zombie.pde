float x1;
float y1;
float s1;
float s2;
float s3;
float s4;
void setup(){
  size(500,500);
  x1=250;
  y1=250;
}
void draw(){
  background(255);
  if(x1>449){
    s3=0;
  }
  if(x1<10){
    s4=0;
  }
  if(y1>449){
    s2=0;
  }
  if(y1<10){
    s1=0;
  }
  fill(0);
  rect(x1,y1,50,50);
  x1=x1-s4;
  x1=x1+s3;
  y1=y1-s1;
  y1=y1+s2;
}
void keyPressed(){
  if (key == CODED) {
  if(keyCode==UP){
    s1=10;
    s2=0;
  }
   if(keyCode==DOWN){
    s2=10;
    s1=0;
  }
 if(keyCode==LEFT){
    s4=10;
    s3=0;
  }
   if(keyCode==RIGHT){
    s3=10;
    s4=0;
  }
}
}
void keyReleased() {
   if (key == CODED) {
  if(keyCode==UP){
    s1=0;
  }
   if(keyCode==DOWN){
    s2=0;
  }
 if(keyCode==LEFT){
    s4=0;
  }
   if(keyCode==RIGHT){
    s3=00;
  }
}
}