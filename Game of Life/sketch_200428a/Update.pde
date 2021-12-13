void Simulation() {
  nC = CalcnC(sqSz, thickness, Width);
  nR = CalcnR(sqSz, thickness, Height);
  future = new boolean [nC] [nR];

  int alive;

  for (int i=0; i<nC; i++) {
    for (int j=0; j<nR; j++) {
      if ((i==0) || (j==0) || (i==nC-1) || (j==nR-1)) {
      } else {
        //Counting alive neighbours
        alive=0;
        for (int ii = -1; ii <= 1; ii++) {
          for (int jj = -1; jj <= 1; jj++) {
            if (sqGrid[i + ii] [j + jj].state) {
              alive++;
            }
          }
        }
        if (sqGrid[i] [j].state) {
          alive--;


          //Applying rules for alive cells
          //Rules 1: Isolation (neighbours < 2) = cells die
          if (alive <2) {
            future[i] [j] = false;
          }

          //Rules 2: Over population (neighbours > 3) = cells die
          if (alive >3) {
            future[i] [j] = false;
          }

          //Rules 3: Good living condition (2 <= neighbours <= 3) = cells live
          if ((alive == 2)||(alive == 3)) {
            future[i] [j]=sqGrid[i] [j].state;
          }
        } else {
          //Applying rules for alive cells
          //Rules 4: Riproduction (neighbours == 3) = cells alive
          if (alive == 3) {
            future[i] [j] = true;
          }
        }
      }
    }
  }
  for (int i=0; i<nC; i++) {
    for (int j=0; j<nR; j++) {
      sqGrid[i] [j].state= future[i] [j];
    }
  }
}


void update() {
  for (int i=0; i<nC; i++) {
    for (int j=0; j<nR; j++) {
      sqGrid [i] [j].mouseIsOver(mouseX, mouseY);
    }
  }
}
