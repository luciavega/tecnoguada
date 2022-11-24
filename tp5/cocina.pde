// clase principal

class Juego {
  Perrito h;
  cupcake m;
  powerup c;
  hueso v;
  Carne p;
  Pantalla pant ;
  Boton empezar;
  cupcake [] ms= new cupcake[7];
  powerup [] cs = new powerup [5];
  Carne [] ps = new Carne [5];
  hueso [] vs = new hueso [5];
  int vidas;
  int ganastesp, ganastesv;
  int fs;
  PImage fondo;
  int pantalla;
  String estado;
  boolean gano; 
  
  Juego() {
    estado = "Inicio";
    vidas=3;
    
    h = new Perrito();
    m = new cupcake();
    c = new powerup();
    v = new hueso();
    p = new Carne();
    pant = new Pantalla();
    pantalla=0;
    empezar= new Boton(400, 550, 250, 80);
    
    for (int i=0; i<ms.length; i++) {
      ms[i] = new cupcake();
    }
    for (int i=0; i<cs.length; i++) {
      cs[i] = new powerup();
    }
    for (int i=0; i<ps.length; i++) {
      ps[i] = new Carne();
    }
    for (int i=0; i<vs.length; i++) {
      vs[i] = new hueso();
    }
  }
  void click() {
    if (empezar.botonPresionado(400, 550, 250, 80) && pantalla == empezar.actual) {
      pantalla = empezar.proxima;
      estado= "Jugando";
    }
  }
  void dibujarJuego() {
    pant.dibujar(pantalla);

    if (estado.equals("Inicio")) {
      pantalla=0;
    } else if (estado.equals("cred")) {
      println(estado);
      pantalla=1;
     
     empezar.dibujarBoton(1, 2, "EMPEZAR");
    }
    if (estado.equals("Jugando")) {
      h.dibujarPerrito();
      encuentromyh();
      encuentrocyh();
      encuentrovyh();
      encuentropyh();

      for (int i=0; i<ms.length; i++) {
        ms[i].dibujarcupcake();
        ms[i].movercupcake();
      }

      for (int i=0; i<cs.length; i++) {
        cs[i].dibujarpowerup();
        cs[i].moverpowerup();
      }

      for (int i=0; i<ps.length; i++) {
        ps[i].dibujarCarne();
        ps[i].moverCarne();
      }

      for (int i=0; i<vs.length; i++) {
        vs[i].dibujarhueso();
        vs[i].moverhueso();
      }

      textSize(20);
      fill(255);
      textAlign(CENTER);
      text("Vidas", 50, 50);
      text(vidas, 50, 70);

      text("carnes", 650, 50);
      text(ganastesp, 650, 70);

      text("huesos", 550, 50);
      text(ganastesv, 550, 70);
    }
    if (estado.equals("Perdiste")) {
      pantalla=3;
      perdiste.play();
      
    }
    if (estado.equals("Ganaste")) {
      pantalla=4;
      ganaste.play();
      
    }
 
    if (ganastesv>= 10 && ganastesp>= 10) {
      estado="Ganaste";
    }
 
    if (vidas==0) {
      estado="Perdiste";
    }
  }

  void avanzar(int tecla) {
    if (tecla==ENTER && !estado.equals("cred")) {
      println(estado);
      if (estado.equals("Inicio")) {
        estado= "cred";
      }
      if (estado.equals("Perdiste")) {
        estado= "cred";
        for (int i=0; i<ms.length; i++) {
          ms[i] = new cupcake();
        }
        for (int i=0; i<cs.length; i++) {
          cs[i] = new powerup();
        }
        for (int i=0; i<ps.length; i++) {
          ps[i] = new Carne();
        }
        for (int i=0; i<vs.length; i++) {
          vs[i] = new hueso();
        }
        vidas= 3;
        ganastesv= 0;
        ganastesp= 0;
      }


      if (estado.equals("Ganaste")) {
        estado= "cred";
        for (int i=0; i<ms.length; i++) {
          ms[i] = new cupcake();
        }
        for (int i=0; i<cs.length; i++) {
          cs[i] = new powerup();
        }
        for (int i=0; i<ps.length; i++) {
          ps[i] = new Carne();
        }
        for (int i=0; i<vs.length; i++) {
          vs[i] = new hueso();
        }
        vidas= 3;
        ganastesv= 0;
        ganastesp= 0;
      }
    }
  }


  void moverPersonaje(int tecla) {
    h.moverPerrito(tecla);
  }

  void encuentromyh() {
    for (int i = 0; i<ms.length; i++) {
      float esp = dist(h.hx, h.hy, ms[i].mx, ms[i].my);
      if (esp < ms[i].mtam/2+h.hancho/4 || esp<ms[i].mtam/2+h.halto/4) {
        ms[i].atrapar();
        vidas--;
        perdiste.amp(0.3);
        
      }
    }
  }

  void encuentrocyh() {
    for (int i = 0; i<cs.length; i++) {
      float esp = dist(h.hx, h.hy, cs[i].cx, cs[i].cy);
      if (esp < cs[i].ctam/2+h.hancho/4 || esp<cs[i].ctam/2+h.halto/4) {
        cs[i].atrapar();
        vidas++;
        ganaste.amp(0.2);
      
      }
    }
  }

  void encuentropyh() {
    for (int i = 0; i<ps.length; i++) {
      float esp = dist(h.hx, h.hy, ps[i].px, ps[i].py);
      if (esp < ps[i].ptam/2+h.hancho/4 || esp<ps[i].ptam/2+h.halto/4) {
        ps[i].atrapar();
        ganastesp++;
        ganaste.amp(0.2);
      }
    }
  }

  void encuentrovyh() {
    //establecer la distancia entre el personaje y la cupcake
    for (int i = 0; i<vs.length; i++) {
      float esp = dist(h.hx, h.hy, vs[i].vx, vs[i].vy);
      if (esp < vs[i].vtam/2+h.hancho/4 || esp<vs[i].vtam/2+h.halto/4) {
        vs[i].atrapar();
        ganastesv++;
        ganaste.amp(0.2);
      }
    }
  }
  
  void mouseClicked(){
    if(estado.equals("cred")){
      estado.equals("Jugando");
    }
  }
}
