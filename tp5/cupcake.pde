class cupcake {
  float mtam, my, mx, mvel;
  boolean atrapado;
  PImage cupcake;
  cupcake() {
    mtam = 90;
    mx = random (0, width);
    my = -height;
    mvel = random (2, 4);
    atrapado = false;
    cupcake = loadImage("cupcake.png");
  }
  void dibujarcupcake() {
    image(cupcake, mx+10, my, mtam, mtam);
  }

  void movercupcake() {
    if (my>height+mtam || atrapado) { 
      mx = random (0, width);
      my= -height;
      mvel = random (4, 6);
      atrapado = false;
    }
    my+= mvel;
  }
  
  void atrapar(){
    atrapado=true;
  }
}
