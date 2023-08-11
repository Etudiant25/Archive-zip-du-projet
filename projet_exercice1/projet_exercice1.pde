/*Ce programme est un mini Jeu Star shooter. Le but est de tirer sur les astéroides qui menace
la planète terre à l'aide d'un vaisseau que l'on peut déplacer avec les touches 'zqsd'.
Si un asteroide touche le vaisseau la partie est finie. 
Si un asteroide atteint le coté gauche de l'écran la partie est finie.
*/

float x1, y1, w1, h1;
float x2, y2, w2, h2;
float x3, y3, x4, y4, x5, y5, x6, y6;
float vitesseDeDeplacement;
boolean[] appui = new boolean[256];
Vaisseau vaisseau;
ArrayList <Missile> m;
ArrayList<Asteroide> as;
int frequence;
int tempsTotal;
int P, vie;
Particule[] particules;
boolean bool, bool2, bool3 = false;
int TDVAsteroide =0;

void setup() {
  size(1000, 1000);
  PFont f = loadFont("Calibri-14.vlw");
  textFont(f);
  background(0);
  vaisseau = new Vaisseau(150, 500, 40, 80, 190, 520, 20, 40, 150, 500, 120, 470, 150, 580, 120, 610);
  vitesseDeDeplacement=0.07; 
  m = new ArrayList();
  as = new ArrayList();
  frequence =0;
  P=200;
  particules = new Particule[P];
  for (int i=0; i<P; i++) {
    particules[i] = new Particule();
  }
}


void draw() {
  background(0);
  vaisseau.formeDuVaisseau();
  vaisseau.deplacementDuVaisseauHaut();
  vaisseau.deplacementDuVaisseauBas();
  vaisseau.deplacementDuVaisseauGauche();
  vaisseau.deplacementDuVaisseauDroite();
  for (Missile e : m) {
    e.missile();
    e.tirDeMissile();
  }  
  if (frequence %150==0) {
    as.add(new Asteroide(1000, random(100, 900), random(3,5)));
  }
  for (Asteroide e : as) {
    e.dessin();
    e.apparition();
  }
  for (int p=0; p<P; p++) {
    particules[p].dessin();
    particules[p].animation();
  }
  collisionVaisseau();
  collisionAsteroide();
  frequence = frequence+1;
}

//Collision du vaisseau avec un asteroide. Atteinte de l'asteroide sur la partie gauche de l'écran. 

void collisionVaisseau() {
  for (Asteroide e : as) {
    if (e.Ay1 >= vaisseau.y4 && e.Ay1 <= vaisseau.y6 && e.Ax1<vaisseau.x2 ) {
      background(0);
      text("GameOver", 450, 500);
      bool2=true;
      for (int p=0; p<P; p++) {
        particules[p].x = vaisseau.x2;
        particules[p].y = vaisseau.y2;
      }
    }
    if (e.Ax1 <= 0) {
      background(0);
      text("GameOver", 450, 500);
    }
  }
  if (bool2) {
    vaisseau.x2=-1000;
    vaisseau.y2=-1000;
    vaisseau.x1=-1000;
    vaisseau.y1=-1000;
    vaisseau.x3=-1000;
    vaisseau.x4=-1000;
    vaisseau.x5=-1000;
    vaisseau.x6=-1000;
    background(0);
    text("GameOver", 450, 500);
  }
}

//Collision d'un missile sur l'asteroide.

void collisionAsteroide() {
  for ( int j=0; j<as.size(); j++) {
    for (int i =0; i<m.size(); i++) {
      if (m.get(i).Mx1>as.get(j).Ax1-25 && m.get(i).Mx1<as.get(j).Ax1+25 && m.get(i).My1>as.get(j).Ay1-25 && m.get(i).My1<as.get(j).Ay1+25) {    
        bool=true;
        for (int p=0; p<P; p++) {
          particules[p].x = as.get(j).Ax1;
          particules[p].y = as.get(j).Ay1;
          bool3=true;
        }
      }
    } 
    if(bool3){
      as.get(j).stop();
      bool3=false;
    }
  }
  
}


void keyReleased() {
  if (key<256) {
    appui[key]=false;
  }
}

void keyPressed() {
  if (key<256) {
    appui[key]=true;
  }
}

void mousePressed() {

  m.add(new Missile(vaisseau.x2+vaisseau.w2/2, vaisseau.y2, 10));
}
