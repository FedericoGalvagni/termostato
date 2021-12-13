
int CalcnC(int sqSz, int thickness, int Width) {
  int nC = Width / (sqSz + thickness);
  return(nC);
}

int CalcnR(int sqSz, int thickness, int Height) {
  int nR = Height / (sqSz + thickness);
  return(nR);
}



int CC(int x) {
  int CC;             //numero colonna

  if (x<sqSz) {
    CC = 0;
  } else {
    CC = x/sqSz+thickness;
  }
  return CC;
}

int CR(int y) {
  int CR;             //numero colonna
  if (y<11) {
    CR = 0;
  } else {
    CR = y/sqSz+thickness;
  }
  return CR;
}
