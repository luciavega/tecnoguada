class Pantalla {
  float seg;
  int nump;
  int cant = 5;
  PImage [] screens = new PImage [cant];

  Pantalla() {
    for (int p=0; p<cant; p++) {
      screens[p] = loadImage("pantalla"+p+".jpg");
    }
    
  }
  void dibujar(int num){
    nump = num;
    image(screens[nump],0,0);
  }
  
}
