
int num = 10;
PVector[][] lattice;
PShape tile;
PVector[] base = new PVector[2];
float scalar;

void setup() {
  size(500, 500, P2D);
  colorMode(HSB, 1);
  scalar = height * 1.0 / num;
  makeSqVector();
  makeSqLattice();
  deformSquare();
  drawTilling();
}

void draw() {}

void mouseClicked() {
  drawTilling();
}

void makeSqVector() {
  base[0] = new PVector(0, 1);
  base[1] = new PVector(1, 0);
}

void makeSqLattice() {
  lattice = new PVector[num + 1][num + 1];
  for(int i=0; i < num + 1; i++) {
    for(int j=0; j < num + 1; j++) {
      PVector v = PVector.mult(base[0], i * scalar);
      v.add(PVector.mult(base[1], j * scalar));
      lattice[i][j] = new PVector(v.x, v.y);
    }
  }
}

void deformSquare() {
  PVector[] v = new PVector[4];
  for(int i=0; i < 4; i++) {
    v[i]= PVector.fromAngle(2 * PI * (i + 0.5) / 4);
    v[i].mult(scalar / sqrt(2));
  }
  tile = createShape();
  tile.beginShape();
  float[][] rand = new float[2][2];
  for(int i =0; i < 2; i++) {
    rand[i][0] = random(-1, 1);
    rand[i][1] = random(-1, 1);
  }
  tile.vertex(v[0].x, v[0].y);
  for(int i=0; i < 4; i++) {
    PVector[] w = parameterizeIH01(v, i, rand);
    tile.bezierVertex(w[0].x, w[0].y,
      w[1].x, w[1].y,
      v[(i + 1) % 4].x, v[(i + 1) % 4].y);
  }
  tile.endShape(CLOSE);
}

PVector[] parameterizeIH01(PVector[] v, int i, float[][] rand) {
  PVector[] w = new PVector[2];
  for(int j=0; j < 2; j++) {
    w[j] = PVector.sub(v[(i + 1) % 6], v[i]);
    w[j].mult(pow(-1, j));
    if(i < 3) {
      w[j].rotate(rand[i][j] * PI / 3);
    } else if(i != 4) {
      w[j].rotate(-rand[5 - i][j] * PI / 3);
    } else {
      w[j].rotate(rand[5 - i][(j + 1) % 2] * PI / 3);
    }
    w[j].add(v[(i + j) % 6]);
  }
  return w;
}

void drawTilling() {
  for(PVector[] vecArr : lattice) {
    for(PVector vec : vecArr) {
      tile.resetMatrix();
      tile.translate(vec.x, vec.y);
      tile.setFill(color(random(1), 1, 1));
      shape(tile);
    }
  }
}
