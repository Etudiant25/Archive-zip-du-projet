class rectangle implements Comparable<rectangle>{
  
  float x1, y1;
  int width, height;
  char lettre;
  
  rectangle(float x1, float y1, int width, int height, char lettre){  
    this.x1=x1;
    this.y1=y1;
    this.width=width;
    this.height=height;
    this.lettre=lettre;
  }
  
 void dessin(){
   fill(#070342/*067729*//*5c5cf7*//*11a7f4*/);
   noStroke();
   rect(x1,y1,width,height);
   text(this.getLettre(),this.x1+13,this.y1+30);
 }
  
  int compareTo(rectangle rect){
    return(this.height - rect.height);
  }
  
  int getHeight(){
    return this.height;
  }
  
  float getX1(){
    return this.x1;
  }
  
  float getY1(){
    return this.y1;
  }
  
  int getWidth(){
    return this.width;
  }
  
  char getLettre(){
    return this.lettre;
  }
  
  String toString(){
     String s = this.getLettre()+"";
     return s;
  }
}
