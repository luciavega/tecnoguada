class powerup {
  float ctam, cy, cx, cvel;
  boolean atrapado;
  PImage powerup;
  powerup() {
    ctam = 150;
    cx = random (0, width);
    cy = -ctam;
    cvel = random (2, 4);
    atrapado = false;
    powerup = loadImage("powerup.png");
  }
  void dibujarpowerup() {
    image(powerup, cx, cy, ctam, ctam);
  }

  void moverpowerup() {
    if (cy>height+ctam || atrapado) { 
      cx = random (0, width);
      cy = -ctam;
      cvel = random (4, 6);
      atrapado = false;
      powerup = loadImage("powerup.png");
    }
    cy+= cvel;
  }
  
  void atrapar(){
    atrapado=true;
  }
}


class Carne {
  float ptam, py, px, pvel;
  boolean atrapado;
  PImage carne;
  Carne() {
    ptam = 50;
    px = random (0, width);
    //entra en la pantalla
    py = -ptam;
    pvel = random (2, 4);
    atrapado = false;
    carne = loadImage("carne.png");
  }
  void dibujarCarne() {
    image(carne, px, py, ptam, ptam);
  }

  void moverCarne() {
    if (py>height+ptam || atrapado) { 
      px = random (0, width);
      py = -ptam;
      pvel = random (4, 6);
      atrapado = false;
    }
    py+= pvel;
  }
  
  void atrapar(){
    atrapado=true;
  }
}

class hueso {
  float vtam, vy, vx, vvel;
  boolean atrapado;
  PImage hueso;
  hueso() {
    vtam = 70;
    vx = random (0, width);
    //entra en la pantalla
    vy = -vtam;
    vvel = random (2, 4);
    atrapado = false;
    hueso = loadImage("hueso.png");
  }
  void dibujarhueso() {
    image(hueso, vx, vy, vtam, vtam);
  }

  void moverhueso() {
    if (vy>height+vtam || atrapado) { 
      vx = random (0, width);
      vy = -vtam;
      vvel = random (4, 6);
      atrapado = false;
    }
    vy+= vvel;
  }
  
  void atrapar(){
    atrapado=true;
  }
}
