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
    if (selected) {
      fill(#99CCFF);
    } else if (selected && state) {
      
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
        fx = x;
        fy = y;
        println("1"+x +y);
      }

      if ((fx == x) && (fy == y)) { //check if the square x, y are the same of the first selected
      } else {
        println(x+""+y);
        drag = true;
        state = (!state);
      }
    }
  }


  void mouseIsOver(int xp, int yp) {
    if ((MouseIsOver(xp, yp)) && (state != true) && (!pAdd.state)) {
      fill(#ab4646);
      rect(x, y, size, size);
    } else if (pAdd.state) {
      fill(#FFFFFF);
      rect(x, y, size, size);
    }
  }
  void Reset() {
    state=false;
  }
}
