class Pulsante {
  int x, y, w, h;
  color bcon, bcoff, tc;
  String ton, tof;
  boolean state;   
  PFont mono ;
  PImage img;


  // costruttore
  Pulsante(String ton, String tof, int x, int y, int w, int h, color bcon, color bcoff, color tc, boolean state, PImage img) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.bcon = bcon;
    this.bcoff = bcoff;
    this.tc = tc;
    this.tof = tof;
    this.ton = ton;
    this.state = state;
    this.img = img;
  }

  // disegno
  void Draw() {
    mono = createFont("BebasNeue-Regular.ttf", 20);
    textSize(20);
    if (state) {
      fill(bcon);
      rect(x, y, w, h);
      fill(tc);
      textAlign(CENTER, CENTER);
      text(ton, x+w/2, y+h/2);
    } else {
      fill (bcoff);
      rect(x, y, w, h);
      fill(tc);
      textAlign(CENTER, CENTER);
      text(tof, x+w/2, y+h/2);
    }
    if (img!=null) {
      image(img, x + w/10, y+w/10, w - (w/10) * 2, h - (w/10) * 2);
    }
  }

  void DrawI() {
    fill(bcon);
    rect(x, y, w, h);
    image(img, x + w/10, y+w/10, w - (w/10) * 2, h - (w/10) * 2);
  }

  void MousePressed(int xp, int yp) {
    if (MouseIsOver(xp, yp)) {
      state = (!state);
    }
  }

  boolean MouseIsOver(int xp, int yp) {
    boolean over_x = ((xp >= x) && (xp <= (x+w)));
    boolean over_y = ((yp >= y) && (yp <= (y+h)));
    return (over_x && over_y);
  }

  void Reset (int xp, int yp) {
    if (MouseIsOver(xp, yp)) {
      state = (!state);
      for (int i=0; i<nC; i++) {
        for (int j=0; j<nR; j++) {
          sqGrid[i] [j].Reset();
        }
      }
      state = (!state);
    }
  }
}
