class Missile {

  float Mx1, My1;
  float deplacement;

  Missile(float Mx1,float My1, float deplacement){
    this.Mx1 = Mx1;
    this.My1 = My1;
    this.deplacement = deplacement;
  }

  void missile() {
    fill(255,0,0);
    ellipse(Mx1,My1,10,10);
  }

 void tirDeMissile() {
    Mx1 += deplacement;
  }
}
