import processing.sound.*;
SoundFile ambiente, ganaste, perdiste;
Juego j;

void setup() {
  size(800, 600);
  j= new Juego();
  ganaste = new SoundFile (this, "ganaste.mp3");
  ambiente = new SoundFile (this, "ambiente1.mp3");
  perdiste = new SoundFile (this,"perdiste.mp3");
  ambiente.loop();
  
}
void draw() {
  j.dibujarJuego();
  if (keyPressed) {
  j.moverPersonaje(keyCode);
  }
}

void keyPressed(){
  j.avanzar(keyCode);
  
}

void mousePressed(){
j.click();
}
