int pX;  //point of selection left top
int pY;

int fX;  //point of selection right corner
int fY;

int pMx, pMy, pmx, pmy;

class Square implements java.io.Serializable {
  int size, x, y, fx, fy;
  color con, cof;
  boolean state, drag, firstdrag, selected;



  Square(int size, int x, int y, color con, color cof, boolean state) {
    this.size = size;
    this.x = x;
    this.y = y;
    this.con = con;
    this.cof = cof;
    this.state = state;
  }

  void draw() {
    if (state) {
      fill(con);
    } else
    { 
      fill (cof);
    }
    if (selected && !state) {
      fill(#92b7d6);
    } else if (selected && state) {
      fill(#c85c6b);
    }

    rect(x, y, size, size);
  }

  boolean MouseIsOver(int xp, int yp) {
    boolean over_x = ((xp >= x) && (xp <= (x+size)));
    boolean over_y = ((yp >= y) && (yp <= (y+size)));
    return (over_x && over_y);
  }

  void MousePressed(int xp, int yp) {
    if (MouseIsOver(xp, yp)) {
      state = (!state);
    }
  }
  void MouseDragged(int xp, int yp, boolean firstdrag) {

    if ((MouseIsOver(xp, yp) && (!drag))) {

      if (firstdrag) {
        //detect the first square selected with the mouse drag function
        firstdragged=false;
        state = (!state);
      }
      drag = true;
      state = (!state);
    }
  }

  void Selection(int xp, int yp, boolean firstdrag) {
    if ( firstdrag && (MouseIsOver(xp, yp))) {
      //detect the first square selected with the mouse drag function
      firstdragged=false;
      pX = x;
      pY = y;
      println(x);
      println(y);
    }

    if (xp>pX) {
      pMx = xp;
      pmx = pX;
    } else {
      pMx = pX;
      pmx = xp;
    }

    if (yp>pY) {
      pmy = yp;
      pmy = pY;
    } else {
      pmy = pY;
      pmy = yp;
    }

    if ((x > pmx) && (x < pMx) && (y > pmy) && (y < pMy)) { 
      /* delay(4000);
       println(x);
       delay(4000);
       println(y);
       delay(4000);
       println(fx);
       delay(4000);
       println(fy);*/
      drag = true;
      selected = true;
    } else {
      selected = false;
    }
  }

  void mouseIsOver(int xp, int yp) {
    if ((MouseIsOver(xp, yp)) && (state != true) && (!pAdd.state)) {
      fill(#ab4646);
      rect(x, y, size, size);
    }
  }
  void Reset() {
    state=false;
  }
}
