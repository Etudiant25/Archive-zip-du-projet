class rectangleNote{
  
  float x1;
  float y1;
  float rectNoteWidth;
  float rectNoteHeight;
  int compteur;
  boolean pression;
  
  rectangleNote(float x1, float y1, float rectNoteWidth, float rectNoteHeight,int compteur){
    this.x1=x1;
    this.y1=y1;
    this.rectNoteWidth=rectNoteWidth;
    this.rectNoteHeight=rectNoteHeight;
    this.compteur=compteur;
  }
  
  void dessin(){
    if(compteur%2==0 || compteur %2==2 ){
      fill(255);
      rect(x1,y1,rectNoteWidth,rectNoteHeight);
    }
    else{
      fill(0);
      rect(x1,y1,rectNoteWidth, rectNoteHeight);
    }
    /*if(this.pression==true){
      fill(0,0,255);
      rect(x1,y1,width,height);
    }*/
  }
}
