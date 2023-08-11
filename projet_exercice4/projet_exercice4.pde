import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.analysis.*;

/*Ce programme est une simulation d'un clavier type Piano. 
 Il fonctionne avec les touches Majuscule. 
 La représentation du clavier est sur deux octaves.
 Les touches majuscules commencent à W pour le premier Do, puis X,C,V,B,N,? pour la gamme.
 Les dièses commencent à S pour le Do#, puis D,F,G,H,J pour les dièses suivant.
 La deuxième octave commence à A pour le Do puis Z,E,R,T,Y,U,I pour la gamme.
 Les dièses commencent à 2 pour le Do# et se poursuivent avec 3,4,5,6,7,8 pour les dièses suivant.
 Pressez 'r' pour débuter l'enregistrement et 's' pour sauvegarder.
 */

Minim minim;
AudioOutput out;
float [] doubleOctave = {261.63, 293.66, 329.63, 349.23, 392, 440, 493.88, 523.25, 587.33, 659.26, 698.47, 783.99, 880, 987.77, 1046.5};
float []dieseDoubleOctave = {277.18, 311.13, 349.23, 369.99, 415.30, 466.16, 523.25, 554.37, 622.25, 698.46, 739.99, 830.61, 932.33, 1046.5};
rectangleNote [] note;
float x1;
float y1;
float x2;
float y2;
float noteWidth;
float noteHeight;
boolean bool, bool2;
int press;
AudioRecorder enregistrement;

void setup() {
  size(1200, 1200);
  minim = new Minim(this);
  out = minim.getLineOut();
  note = new rectangleNote[29];
  x1=320;
  y1=500;
  y2=400;
  x2=335;
  press=0;
  noteWidth=30;
  noteHeight=100;
  clavier();
  enregistrement = minim.createRecorder(out, "monSon.wav");
}


void draw() {
  background(#593317);
  for (int i=0; i<=28; i++) {
    if (i%2==0 || i%2==2 ) {
      note[i].dessin();
      x1 +=35;
    } else {
      note[i].dessin();
      x2 +=35;
    }
  }
  clic();
  pression();
  oscillation();
}

// Dessin de la forme d'onde jouée.

void oscillation() {
  for (int i = 0; i < out.bufferSize() - 1; i++) {
    fill(255);
    line( i+70, 100 + out.left.get(i)*100+50, i+71, 100 + out.left.get(i+1)*100+50 ); 
    line( i+70, 150 + out.right.get(i)*100+50, i+71, 150 + out.right.get(i+1)*100+50 );
  }
}

//Les touches pressées au clavier pour jouer les notes, 
//débuter l'enregistrement et sauvegarder l'enregistrement.

void keyPressed() {
  out.setGain(30);
  if (key=='W') {
    out.playNote(0, 1.6, doubleOctave[0]);
    bool=true;
    press=1/2;
    //out.shiftVolume(500.0,0.0,1);
  } else if (key=='S') {
    out.playNote(0, 1.6, dieseDoubleOctave[0]);
    bool2=true;
    press=1/2;
  } else if (key=='X') {
    out.playNote(0, 1.6, doubleOctave[1]);
    bool=true;
    press=3/2;
  } else if (key=='D') {
    out.playNote(0, 1.6, dieseDoubleOctave[1]);
    bool2=true;
    press=3/2  ;
  } else if (key=='C') {
    out.playNote(0, 1.6, doubleOctave[2]);
    bool=true;
    press=5/2;
  } else if (key=='F') {
    out.playNote(0, 1.6, dieseDoubleOctave[2]);
    bool2=true;
    press=5/2;
  } else if (key=='V') {
    out.playNote(0, 1.6, doubleOctave[3]);
    bool=true;
    press=7/2;
  } else if (key=='G') {
    out.playNote(0, 1.6, dieseDoubleOctave[3]);
    bool2=true;
    press=7/2;
  } else if (key=='B') {
    out.playNote(0, 1.6, doubleOctave[4]);
    bool=true;
    press=9/2;
  } else if (key=='H') {
    out.playNote(0, 1.6, dieseDoubleOctave[4]);
    bool2=true;
    press=9/2;
  } else if (key=='N') {
    out.playNote(0, 1.6, doubleOctave[5]);
    bool=true;
    press=11/2;
  } else if (key=='J') {
    out.playNote(0, 1.6, dieseDoubleOctave[5]);
    bool2=true;
    press=11/2;
  } else if ( key=='?') {
    out.playNote(0, 1.6, doubleOctave[6]);
    bool=true;
    press=13/2;
  } else if ( key=='K') {
    out.playNote(0, 1.6, dieseDoubleOctave[6]);
    bool2=true;
    press=13/2;
  } else if (key=='A') {
    out.playNote(0, 1.6, doubleOctave[7]);
    bool=true;
    press=15/2;
  } else if (key=='2') {
    out.playNote(0, 1.6, dieseDoubleOctave[7]);
    bool2=true;
    press=15/2;
  } else if (key=='Z') {
    out.playNote(0, 1.6, doubleOctave[8]);
    bool=true;
    press=17/2;
  } else if (key=='3') {
    out.playNote(0, 1.6, dieseDoubleOctave[8]);
    bool2=true;
    press=17/2;
  } else if (key=='E') {
    out.playNote(0, 1.6, doubleOctave[9]);
    bool=true;
    press=19/2;
  } else if (key=='4') {
    out.playNote(0, 1.6, dieseDoubleOctave[9]);
    bool2=true;
    press=19/2;
  } else if (key=='R') {
    out.playNote(0, 1.6, doubleOctave[10]);
    bool=true;
    press=21/2;
  } else if (key=='5') {
    out.playNote(0, 1.6, dieseDoubleOctave[10]);
    bool2=true;
    press=21/2;
  } else if (key=='T') {
    out.playNote(0, 1.6, doubleOctave[11]);
    bool=true;
    press=23/2;
  } else if (key=='6') {
    out.playNote(0, 1.6, dieseDoubleOctave[11]);
    bool2=true;
    press=23/2;
  } else if (key=='Y') {
    out.playNote(0, 1.6, doubleOctave[12]);
    bool=true;
    press=25/2;
  } else if (key=='7') {
    out.playNote(0, 1.6, dieseDoubleOctave[12]);
    bool2=true;
    press=25/2;
  } else if (key=='U') {
    out.playNote(0, 1.6, doubleOctave[13]);
    bool=true;
    press=27/2;
  } else if (key=='8') {
    out.playNote(0, 1.6, dieseDoubleOctave[13]);
    bool2=true;
    press=27/2;
  } else if (key=='I') {
    out.playNote(0, 1.6, doubleOctave[14]);
    bool=true;
    press=29/2;
  } else if (key=='s') {
    enregistrement.save().close();
  } else if (key=='r') {
    if (enregistrement.isRecording()) {
      enregistrement.endRecord();
    } else {
      enregistrement.beginRecord();
    }
  } else {
    keyPressed=false;
  }
}

//Si l'on désire jouer une note à la souris.

void clic() {
  if (mousePressed) {
    for (int i=0; i<=28; i++) {
      if (mouseX>=note[i].x1 && mouseX<=note[i].rectNoteWidth+note[i].x1 && mouseY>=note[i].y1 && mouseY<=note[i].rectNoteHeight+note[i].y1/* && i%2==0 || i%2==2*/) {
        press=i/2;
        if (i%2==0 || i%2==2) {
          bool=true;
          out.playNote(doubleOctave[press]);
        } else {
          press=i/2;
          bool2=true;
          //out.setVolume(1);
          out.playNote(dieseDoubleOctave[press]);
        }
      }
    }
  }
}

//Chargement du tableau Note pour le dessin du clavier.

void clavier() {
  for (int i=0; i<=28; i++) {
    if (i%2==0 || i%2==2 ) {
      note[i]= new rectangleNote(x1, y1, noteWidth, noteHeight, i);
      x1 +=35;
    } else {
      note[i]= new rectangleNote(x2, y2, noteWidth, noteHeight, i);
      x2 +=35;
    }
  }
}

//Dessin de la touche pressée.

void pression() {
  if (bool) {
    fill(75);
    rect(note[press*2].x1, note[press*2].y1, note[press*2].rectNoteWidth, note[press*2].rectNoteHeight);
  }  
  if (bool2) {
    fill(75);
    rect(note[press*2+1].x1, note[press*2+1].y1, note[press*2+1].rectNoteWidth, note[press*2+1].rectNoteHeight);
  }
}

void mouseReleased() {
  bool=false;
  bool2=false;
}

void keyReleased() {
  bool=false;
  bool2=false;
}
