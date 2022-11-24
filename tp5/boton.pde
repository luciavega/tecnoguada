class Boton {
  int px, py, pancho, palto, actual, proxima;
  String textoB;

  Boton(int px_, int py_, int pancho_, int palto_) {
    px = px_;
    py = py_;
    pancho = pancho_;
    palto = palto_;
  }
  
  void dibujarBoton(int actual_, int proxima_, String texto_) {
    actual = actual_;
    proxima = proxima_;
    textoB = texto_;
    if (over(px, py, pancho, palto)) {
   }
   }
  
  boolean over(int px_, int py_, int pancho_, int palto_){
    px = px_;
    py = py_;
    pancho = pancho_;
    palto = palto_;
    if (mouseX>px-pancho/2 && mouseX<px+pancho/2 && mouseY>py-palto/2 && mouseY<py+palto/2) {
    return true;
  } else {
    return false;
  }
  }
  
  boolean botonPresionado(int px_, int py_, int pancho_, int palto_) {
    px = px_;
    py = py_;
    pancho = pancho_;
    palto = palto_;
    boolean presionado = mouseX>px-pancho/2 && mouseX<px+pancho/2 && mouseY>py-palto/2 && mouseY<py+palto/2 == true; 
    return presionado;
  }
}
