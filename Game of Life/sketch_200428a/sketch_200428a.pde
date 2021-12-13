int sqSz = 20;
int thickness = 1;
int speed = 200; //ms
int delayF = 800;
int delayS = 800;
int millisSn;
int millisFn;
int millisSw = millis();
int millisFw = millis();


color gridColor = #FF0000;
color sqColorOn = #FF0000;
color sqColorOff = (100);

//button settings
int dx = 10;
int dy = 10;
int pOffset = 10;
int h = 30;

//start
color startOn = #50AA50;
color startOff = #AA5050;
int startW = 30;
PImage startImg;

//reset
color reset = #FFFFFF;
int resetW = 30;
PImage binImg;

//add
color add = #0000FF;
int addW = 30;
PImage addImg;

//faster
color cFaster = #0000FF;
int fasterW = 30;
PImage fasterImg;

//slower
color cSlower = #0000FF;
int slowerW = 30;
PImage slowerImg;

//speed 
color cSpeed = (100);
int speedW = 50;

color bTc = (200);

int Width = 1920;
int Height = 1080;
int mHeight = 50;

boolean firstdragged = true;



int nC; 
int nR;

List template[];
Square sqGrid[] [];

boolean [] [] future;

Pulsante pSpeed;
Pulsante pStart;
Pulsante pReset;
Pulsante pAdd;
Pulsante pFaster;
Pulsante pSlower;

boolean simulation = false;

void settings() {
  size(Width, Height + mHeight);
}

void setup() {
  background(41);
  Grid grid = new Grid(sqSz, thickness, Width, Height, mHeight, gridColor);
  grid.draw();

  int nC;
  int nR;
  nC = CalcnC(sqSz, thickness, Width);
  nR = CalcnR(sqSz, thickness, Height);
  sqGrid = new Square[nC] [nR];

  for (int i=0; i<nC; i++) {
    for (int j=0; j<nR; j++) {
      sqGrid [i] [j] = new Square(sqSz, (i*(thickness + sqSz))+1, (j*(thickness + sqSz))+1+mHeight, sqColorOn, sqColorOff, false);
    }
  }
  startImg = loadImage("play.png");
  binImg = loadImage("bin.png");
  addImg = loadImage("add.png");
  fasterImg= loadImage("next.png");
  slowerImg = loadImage("back.png");

  pStart = new Pulsante("", "", dx, dy, startW, h, startOff, startOn, bTc, false, startImg);
  pReset = new Pulsante("", "", Width - resetW - dx, dy, resetW, h, reset, reset, bTc, false, binImg);
  pAdd = new Pulsante("", "", addW + dx + pOffset + 200, dy, addW, h, add, add, bTc, false, addImg);
  pSlower = new Pulsante("", "", startW + dx + pOffset, dy, slowerW, h, cSlower, cSlower, bTc, false, slowerImg);
  pFaster = new Pulsante("", "", startW + dx + pOffset + slowerW + speedW, dy, fasterW, h, cFaster, cFaster, bTc, false, fasterImg);
  pSpeed = new Pulsante("", "", startW + dx + pOffset + slowerW, dy, speedW, h, cSpeed, cSpeed, bTc, false, null);

  millisFw = millis();
}

void draw() {



  nC = CalcnC(sqSz, thickness, Width);
  nR = CalcnR(sqSz, thickness, Height);
  for (int i=0; i<nC; i++) {
    for (int j=0; j<nR; j++) {
      sqGrid[i] [j].draw();
    }
  }
  pStart.Draw();
  pReset.Draw();
  pAdd.Draw();
  pSlower.Draw();
  pFaster.Draw();
  pSpeed.Draw();
  pSpeed.tof = (str(speed));

  if (pStart.state==true) {
    delay(speed);
    Simulation();
  }
  update();
  if ((mousePressed) && mouseButton == 37) {
    changeSpeed();
  }
  if (mouseButton == 0) {
    delayS = 800;
    delayF = 800;
  }
  println(str(mouseButton));
  println(str(mousePressed));
  println(str(delayF));
}
void changeSpeed() {  
  //change speed acceleration based on a delay and confronting the time of the last change
  if (mousePressed) {
    millisFn = millis();
    if ((millisFn - millisFw>=delayF) && (pFaster.MouseIsOver(mouseX, mouseY))) {
      speed += 5;
      millisFw = millis();
      if (delayF > 40) {
        delayF /= 1.2;
      }
    }
    millisSn = millis();
    if ((millisSn-millisSw>=delayS) && (pSlower.MouseIsOver(mouseX, mouseY))) {
      speed -= 5;
      millisSw = millis();
      if (delayS>40) {
        delayS /= 1.2;
      }
    }
  }
}

void mousePressed() {
  if (!pStart.state) {
    pAdd.MousePressed(mouseX, mouseY);
  }
  if (!pStart.state && !pAdd.state) {
    nC = CalcnC(sqSz, thickness, Width);
    nR = CalcnR(sqSz, thickness, Height);
    for (int i=0; i<nC; i++) {
      for (int j=0; j<nR; j++) {
        sqGrid [i] [j].MousePressed(mouseX, mouseY);
      }
    }
  }

  if (!pAdd.state) {
    pStart.MousePressed(mouseX, mouseY);
  }

  if (!pStart.state) {
    pReset.Reset(mouseX, mouseY);
  }
}

void mouseDragged() {
  if (!pStart.state && !pAdd.state) {
    nC = CalcnC(sqSz, thickness, Width);
    nR = CalcnR(sqSz, thickness, Height);
    for (int i=0; i<nC; i++) {
      for (int j=0; j<nR; j++) {
        sqGrid [i] [j].MouseDragged(mouseX, mouseY, firstdragged);
      }
    }
  }
}

void mouseReleased() {
  for (int i=0; i<nC; i++) {
    for (int j=0; j<nR; j++) {
      sqGrid [i] [j].drag = false;
    }
  }
  //end of drag selection, reset the first dragged state
  firstdragged = true;
}
