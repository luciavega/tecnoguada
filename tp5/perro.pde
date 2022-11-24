class Perrito {
  PImage perro;
  float hx, hy, hancho, halto;
  Perrito() { 
    hancho = 100;
    halto = 200;
    hx=width/2;
    hy=height-halto;
    perro = loadImage("perro.png");
  }
  void dibujarPerrito() {
    fill(255);
    noStroke();
    image(perro, hx, hy, hancho, halto);
  }
  void moverPerrito(int tecla) {
    if (tecla==RIGHT && hx<width-hancho) {
      hx+=3;
    }
    if (tecla==LEFT && hx>0) {
      hx-=3;
    }
}
}
