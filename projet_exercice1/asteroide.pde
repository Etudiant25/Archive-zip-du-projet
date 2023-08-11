class Asteroide {

  float Ax1;
  float Ay1;
  float Deplacement;


  Asteroide(float Ax1, float Ay1, float Deplacement) {
    this.Ax1=Ax1;
    this.Ay1=Ay1;
    this.Deplacement=Deplacement;
  }


  void dessin() {
    stroke(#7e3300);
    fill(#7e3300);
    ellipse(Ax1+25, Ay1, 50, 50);
  }
  void apparition() {
    Ax1 -= Deplacement;
  }
  
  void stop(){
    Ax1 = 2000;
    Ay1 = 2000;
    Deplacement=0;
  }
}
