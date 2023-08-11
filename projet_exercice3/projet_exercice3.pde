/* Ce programme fontionne uniquement avec les caractères de la table ascii.
 Il marche avec tout type de texte. Il affiche une représentation graphique de chaque lettre
 se trouvant dans le texte.
 Pour jouer a savoir combien il y a de "e" par exemble, il faut tapper "e" et le programme l'indique.
 */

import java.util.Collections;

byte b[];
int [] Occurence = new int [256];
int code;
float x1=300;
float y1=600;
int width=30;
int height=0;
ArrayList<rectangle> grapheDeRectangle;
ArrayList<rectangle> grapheDeRectangleTriee;
char lettre;
int numero;
int nombre;

void setup() {
  background(0);
  size(1500, 1500);
  PFont f = loadFont("Tahoma-14.vlw");
  textFont(f);
  b = loadBytes("un texte.txt");
  caldulDeDensite();
  grapheDeRectangle = new ArrayList<rectangle>();
  grapheDeRectangleTriee = new ArrayList<rectangle>();
  ajoutDesRectangles();
  for (rectangle e : grapheDeRectangleTriee) {
    System.out.println(e.toString());
  }
}

void draw() {
  background(255);
  for (rectangle e : grapheDeRectangleTriee) {
    e.dessin();
  }
  fill(0);
  text("Pressez une lettre de l'alphabet pour jouer", 100, 100);
  compteLettre();
}

//Rajoute un element dans le tableau Occurence à chaque fois qu'une lettre est lue.

void caldulDeDensite() {
  for (int i=0; i<b.length; i++) {
    code = b[i];
    if (code>=97) {
      Occurence[code]++;
    }
    while (code>=65 && code<=90) {
      code =code+32;
      Occurence[code]++;
    }
  }
}

//Rajout des barres de graphe et tri de l'ArrayList.

void ajoutDesRectangles() {
  for (int i=97; i<123; i++) {
    grapheDeRectangle.add(new rectangle(x1, y1, width, height-5*Occurence[i], char(i)));
    x1+=40;
  }
  Collections.sort(grapheDeRectangle);
  grapheDeRectangle.get(0).x1=300;
  for (int i=0; i<26; i++) {
    grapheDeRectangleTriee.add(grapheDeRectangle.get(i));
    if (i<25) {
      grapheDeRectangle.get(i+1).x1 = grapheDeRectangle.get(i).x1+40;
    }
  }
}

//Dispense les informations de comptage de lettre.

void compteLettre() {
  lettre = key;
  fill(0);
  text("Vous avez tappé la lettre"+" "+ "\""+lettre+"\"", 100, 200);
  numero = lettre;
  nombre=Occurence[numero];
  fill(0);
  text("Cette lettre apparait"+" "+nombre+ " "+"fois", 100, 300);
}
