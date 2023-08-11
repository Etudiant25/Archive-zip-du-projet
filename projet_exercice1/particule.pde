class Particule {
  float x, y, dx, dy;
  int vie;


  Particule(float x, float y) {
    this.x = x;
    this.y = y;
    this.vie=(int)random(10,20);
  }


  Particule() {
  }

  void dessin() {
    stroke(#ff8c00);
    fill(#ff8c00);
    ellipse(x, y, 5, 5);
  }

  void animation() {
    //dy -= gravitation;
    x += random(-10, 10);
    y += random(-10, 10);
    if (frequence %200==0) {
      x=-300;
      y=-300;
    }
    while(vie>0){
      vie = vie-1;
      if (vie<=0) {
        x=-300;
        y=-300;   
      }
    }
  }
}
