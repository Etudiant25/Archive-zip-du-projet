import controlP5.*;
import gab.opencv.*;

/* Ce programme modifie la luminosité d'une image, ainsi que sa transparence.
 Un filtre 'nuit' est appliqué à l'ouverture.
 */

ControlP5 cp5, cp5bis;
OpenCV opencv;
PImage ikko, ikkoModif;
color c;
color couleurDeFond, couleurDeFond2;
boolean bool, bool2, bool3, bool4, bool5, bool6;
float c1, c2, c3;
float f1, f2, f3, b1, b2, b3, l1, l3;
float xx=200;
float yy=450;
float yy2=520;
float hh=30;
float ll=200;
ArrayList<Contour> contours;
float a;


void setup() {
  size(600, 600);
  background(0);
  PFont f = loadFont("Caladea-Regular-14.vlw");
  textFont(f);
  ikko = loadImage("ikko.jpg");
  ikkoModif = ikko.get();
  for (int i =0; i<ikko.width; i++) {
    for (int j=0; j<ikko.height; j++) {
      color c = ikko.get(i, j);
      f1 = red(c);
      //f2=green(c);
      f3 = blue(c); 
      b1 = brightness((int)f1);
      //b2 = brightness((int)f2);
      b3 = brightness((int)f3);
      c=color(b1, 0/*b2*/, b3, a);
      ikkoModif.set(i, j, c);
    }
  }
  cp5 = new ControlP5(this);
  cp5bis = new ControlP5(this);
  PFont font = createFont("arial", 15);
  cp5.addSlider("Modifier la luminosite") 
    .setPosition(xx, yy)
    .setSize(200, 30)
    .setFont(font)
    ; 
  cp5bis.addSlider("Modifier la transparence") 
    .setPosition(xx, yy2)
    .setSize(200, 30)
    .setFont(font)
    ; 
  fill(#fdee00);
  
}

void draw() {
  background(0);
  controller();
  controller2();
  imageShown();
  fill(#fdee00);
  text("Modifier la luminosité", 200, 440);
  text("Modifier la transparence", 200, 510);
}

//Presence de la souris sur la barre.

boolean isMouseOver1() {
  bool=(mouseX >=xx) && (mouseX<=xx+ll);
  bool2=((mouseY >=yy) && (mouseY<=yy+hh));
  if (bool && bool2) {
    bool3=true;
  } else {
    bool3=false;
  }
  return bool3;
}

//Presence de la souris sur la seconde barre.

boolean isMouseOver2() {
  bool=(mouseX >=xx) && (mouseX<=xx+ll);
  bool2=((mouseY >=yy2) && (mouseY<=yy2+hh));
  if (bool && bool2) {
    bool5=true;
  } else {
    bool5=false;
  }
  return bool5;
}

//Modification de l'image de deux manières, soit pour la luminosité,
//soit pour la transparence. Aciver f2 et b2 pour l'image normale.

void imageShown() {
  for (int i =0; i<ikko.width; i++) {
    for (int j=0; j<ikko.height; j++) {
      color c = ikko.get(i, j);
      f1 = red(c);
      //f2=green(c);
      f3 = blue(c); 
      b1 = brightness((int)f1);
      //b2 = brightness((int)f2);
      b3 = brightness((int)f3);
      if (bool4) {
        b1=modificationDeLuminositeB1(f1);
        //b2=modificationDeLuminositeB2(f2);
        b3=modificationDeLuminositeB3(f3);
        c=color(b1, 0/*b2*/, b3);
        ikkoModif.set(i, j, c);
      }
    }
  }
  image(ikkoModif, 100, 0);
  if (bool6) {
    for (int i =0; i<ikko.width; i++) {
      for (int j=0; j<ikko.height; j++) {
       // color c = ikko.get(i, j);
        a=modifTransparence();
        tint(b1, 0/*b2*/, b3, a);
      }
    }
  }
  image(ikkoModif, 100, 0);
}

//Methodes de définition de caractéristique de Controller pour les barres progressives.

void controller() {
  cp5.getController("Modifier la luminosite").getValueLabel().setVisible(false);
  cp5.setColorForeground(couleurDeFond);
  cp5.setColorBackground(color(100)); 
  cp5.setColorActive(couleurDeFond);
  cp5.setColorValueLabel(couleurDeFond);
  cp5.setColorCaptionLabel(0);
}

void controller2() {
  cp5bis.getController("Modifier la transparence").getValueLabel().setVisible(false);
  cp5bis.setColorForeground(couleurDeFond2);
  cp5bis.setColorBackground(color(100)); 
  cp5bis.setColorActive(couleurDeFond2);
  cp5bis.setColorValueLabel(couleurDeFond2);
  cp5bis.setColorCaptionLabel(0);
}

//Modification de luminosité des couleurs rouge et bleu.

float modificationDeLuminositeB1(float couleurRed) {
  float ll1 = map(mouseX, xx, xx+ll, brightness((int)couleurRed)-150, brightness((int)couleurRed)+150);
  float l1= ll1;
  return l1;
}

float modificationDeLuminositeB3(float couleurBlue) {
  float ll3= map(mouseX, xx, xx+ll, brightness((int)couleurBlue)-150, brightness((int)couleurBlue)+150);
  float l3 = ll3;
  return l3;
}

//Couleur verte en plus au cas ou le filtre n'est pas appliqué.
 
 float modificationDeLuminositeB2(float couleurVerte) {
 float ll3= map(mouseX, xx, xx+ll, brightness((int)couleurVerte)-150, brightness((int)couleurVerte)+150);
 float l3 = ll3;
 return l3;
 }

//Deternmination du  niveau de transparence en fonction de la position de la souris
//dans le controller.

float modifTransparence() {
  float a1=map(mouseX, xx, xx+ll, 0, 255);
  return a1;
}

void mouseDragged() {
  if (bool4) {
    c1 = (int)map(mouseX, xx, xx+ll, 0, 255);
    couleurDeFond = color(0, 0, c1);
  } else {
    bool4=false;
  }
  if (bool6) {
    c2 = (int)map(mouseX, xx, xx+ll, 0, 255);
    couleurDeFond2 = color(c2, 0, 0);
  } else {
    bool6=false;
  }
}

void mousePressed() {
  if (isMouseOver1()) {
    bool4 = true;
    c1 = (int)map(mouseX, xx, xx+ll, 0, 255);
    couleurDeFond = color(0, 0, c1);
  } else {
    bool4=false;
  }
  if (isMouseOver2()) {
    bool6 = true;
    c2 = (int)map(mouseX, xx, xx+ll, 0, 255);
    couleurDeFond2 = color(c2, 0, 0);
  } else {
    bool6=false;
  }
}

void mouseReleased() {
  bool4=false;
  bool6=false;
}



































/*void rectangle() {
 fill(couleurDeFond);
 noStroke();
 rect(300, 450, 200, 30);
 }*/


/*/*cp5 = new ControlP5(this);
 // couleurDeFond= map(mouseX,0,width,0,255);
 PFont font = createFont("arial",15);
 
 cp5.addSlider("Modifier la luminosite") 
 .setPosition(300, 450)
 .setSize(200, 30)
 .setFont(font)
 //.setRange(0,25)
 //.addTextlabel("label");
 //.Controller.hide(java.lang.String "0")
 
 //. setColorActive(255)
 //.setColorBackground(255)
 // .setColorValueLabel(color(255,0,0)) //légende couleur
 //.setColorForeground(color(0,0,255))
 //.setNumberOfTickMarks(5)   
 //;
 //text("Modifier la luminosité",50,50);
/*info = cp5.addTextlabel("Modifier la luminosité")
 .setText("Modifier la luminosité");*/
/* myTextlabelA = cp5.addTextlabel("label")
 .setText("A single ControlP5 textlabel, in yellow.")
 .setPosition(100,50)
 .setColorValue(0xffffff00)
 .setFont(createFont("Georgia",20))
 ;*/

/*// fill(255);
    /* cp5. setColorActive(couleurDeFond);
 cp5.setColorBackground(couleurDeFond);
 // .setColorValueLabel(color(255,0,0)) //légende couleur
 cp5.setColorForeground(couleurDeFond);*/

// cp5.setColorBackground(couleurDeFond); 
//cp5.setColorActive(couleurDeFond);
//cp5.setColorValueLabel(color(255,0,0));*/
