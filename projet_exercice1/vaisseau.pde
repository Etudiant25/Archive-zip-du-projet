class Vaisseau {

  float x1,y1,w1,h1,x2,y2,w2,h2,x3,y3,x4,y4,x5,y5,x6,y6;
  
  Vaisseau(float x1,float y1,float w1,float h1,float x2,float y2,float w2,float h2,float x3,float y3,float x4,float y4,float x5,float y5,float x6,float y6){
    this.x1=x1;
    this.y1=y1;
    this.w1=w1;
    this.h1=h1;
    this.x2=x2;
    this.y2=y2;
    this.w2=w2;
    this.h2=h2;
    this.x3=x3;
    this.y3=y3;
    this.x4=x4;
    this.y4=y4;
    this.x5=x5;
    this.y5=y5;
    this.x6=x6;
    this.y6=y6;
  }
    
  
  void formeDuVaisseau() {
    fill(0, 0, 180);
    stroke(0, 0, 180);
    rect(x1, y1, w1, h1);
    fill(255, 200, 0);
    stroke(255, 200, 0);
    rect(x2, y2, w2, h2);
    stroke(255);
    line(x3, y3, x4, y4);
    stroke(255);
    line(x5, y5, x6, y6);
  }

  void deplacementDuVaisseauHaut() {

    if ( appui['z']) { 
      y1 -= 80*vitesseDeDeplacement;    
      if (y1<=30) {
        y1=30;
      }
      y2 -= 80*vitesseDeDeplacement;
      if (y2<=50) {
        y2=50;
      }
      y3 -=80*vitesseDeDeplacement;
      y4 -=80*vitesseDeDeplacement;
      if (y3<=30 && y4<=0) {
        y3=30;
        y4=0;
      }
      y5 -= 80*vitesseDeDeplacement;
      y6 -= 80*vitesseDeDeplacement;
      if (y5<=110 && y6<=140) {
        y5=110;
        y6=140;
      }
    }
  }

  void deplacementDuVaisseauBas() {
    if ( appui['s']) {
      y1 += 80*vitesseDeDeplacement;
      if (y1>=890) {
        y1=890;
      }
      y2 += 80*vitesseDeDeplacement;
      if (y2>=910) {
        y2=910;
      }
      y3 +=80*vitesseDeDeplacement;
      y4 +=80*vitesseDeDeplacement;
      if (y3>=890 && y4>=860) {
        y3=890;
        y4=860;
      }
      y5 += 80*vitesseDeDeplacement;
      y6 += 80*vitesseDeDeplacement;
      if (y5>=970 && y6>=1000) {
        y5=970;
        y6=1000;
      }
    }
  }

  void deplacementDuVaisseauGauche() {
    if ( appui['q']) {
      x1 -= 80*vitesseDeDeplacement;    
      if (x1<=150) {
        x1=150;
      }
      x2 -= 80*vitesseDeDeplacement;
      if (x2<=190) {
        x2=190;
      }
      x3 -=80*vitesseDeDeplacement;
      x4 -=80*vitesseDeDeplacement;
      if (x3<=150 && x4<=120) {
        x3=150;
        x4=120;
      }
      x5 -= 80*vitesseDeDeplacement;
      x6 -= 80*vitesseDeDeplacement;
      if (x5<=150 && x6<=120) {
        x5=150;
        x6=120;
      }
    }
  }

  void deplacementDuVaisseauDroite() {
    if ( appui['d']) {
      x1 += 80*vitesseDeDeplacement;    
      if (x1>=830) {
        x1=830;
      }
      x2 += 80*vitesseDeDeplacement;
      if (x2>=870) {
        x2=870;
      }
      x3 +=80*vitesseDeDeplacement;
      x4 +=80*vitesseDeDeplacement;
      if (x3>=830 && x4>=800) {
        x3=830;
        x4=800;
      }
      x5 += 80*vitesseDeDeplacement;
      x6 += 80*vitesseDeDeplacement;
      if (x5>=830 && x6>=800) {
        x5=830;
        x6=800;
      }
    }
  }
}
