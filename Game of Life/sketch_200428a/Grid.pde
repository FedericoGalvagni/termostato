class Grid {
  int sqSz;
  int thickness;
  int Width;
  int Height;
  int mHeight;
  int nC; 
  int nR;
  int [] [] grid;

  color c;



  //costruttore
  Grid(int sqSz, int thickness, int Width, int Height, int mHeight, color c) {
    this.sqSz = sqSz;
    this.thickness = thickness;
    this.Width = Width;
    this.Height = Height;
    this.mHeight = mHeight;
    this.c = c;
  }


  void draw() {
    int x;
    int y = 0;
    nC = CalcnC(sqSz, thickness, Width);
    nR = CalcnR(sqSz, thickness, Height);
    fill(c);

    for (x=0; x<=nC; x++) {
      fill(c);
      line(x*(sqSz+thickness), mHeight, x*(sqSz+thickness), Height + mHeight);
      for (y=0; y<=nR; y++) {
        fill(c);
        line(0, y*(sqSz+thickness)+mHeight, Width, y*(sqSz+thickness)+mHeight);
      }
    }
  }
}
