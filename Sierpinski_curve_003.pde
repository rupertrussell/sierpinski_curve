// https://rosettacode.org/wiki/Sierpinski_curve#C.2B.2B
// translation of the GO code https://rosettacode.org/wiki/Sierpinski_curve#Go
// output on github at: 
int width = 770;
int height = 770;
int level = 4;
float cx = width / 2;
float cy = height;

float oldx = width/2;
float oldy = height;
 
float h = cx / pow(2, (level+1));
int count = 0;

void setup() {
  size(770, 770);
    noLoop();  // stop draw from looping repeatedly
}

void draw() {
  background(0, 0, 255);  // blue background
  stroke(255, 255, 0); // yellow curve
  squareCurve(level);
  print("count = " , count);
}
void squareCurve(int level) {
  sierN(level);
  lineNE();
  sierE(level);
  lineSE();
  sierS(level);
  lineSW();
  sierW(level);
  lineNW();
  lineNE(); // needed to close the square in the top left hand corner
}

void lineTo(float newX, float newY) {
  if (count == 0) {
    oldx = newX-width/2+h;
    oldy = height-newY+2*h;
  }
  line(oldx, oldy, newX-width/2+h, height-newY+2*h);
  save("line-" + count + ".png");  // save each step in drawing the curve
  cx = newX;
  cy = newY;

  oldx = newX-width/2+h;
  oldy = height-newY+2*h;
  count ++;
}

void lineN() { 
  lineTo(cx, cy-2*h);
}
void lineS() { 
  lineTo(cx, cy+2*h);
}
void lineE() { 
  lineTo(cx+2*h, cy);
}
void lineW() { 
  lineTo(cx-2*h, cy);
}
void lineNW() { 
  lineTo(cx-h, cy-h);
}
void lineNE() { 
  lineTo(cx+h, cy-h);
}
void lineSE() { 
  lineTo(cx+h, cy+h);
}
void lineSW() { 
  lineTo(cx-h, cy+h);
}

void sierN(int level) {
  if (level == 1) {
    lineNE();
    lineN();
    lineNW();
  } else {
    sierN(level - 1);
    lineNE();
    sierE(level - 1);
    lineN();
    sierW(level - 1);
    lineNW();
    sierN(level - 1);
  }
}

void sierE(int level) {
  if (level == 1) {
    lineSE();
    lineE();
    lineNE();
  } else {
    sierE(level - 1);
    lineSE();
    sierS(level - 1);
    lineE();
    sierN(level - 1);
    lineNE();
    sierE(level - 1);
  }
}

void sierS(int level) {
  if (level == 1) {
    lineSW();
    lineS();
    lineSE();
  } else {
    sierS(level - 1);
    lineSW();
    sierW(level - 1);
    lineS();
    sierE(level - 1);
    lineSE();
    sierS(level - 1);
  }
}

void sierW(int level) {
  if ( level == 1) {
    lineNW();
    lineW();
    lineSW();
  } else {
    sierW(level - 1);
    lineNW();
    sierN(level - 1);
    lineW();
    sierS(level - 1);
    lineSW();
    sierW(level - 1);
  }
}
