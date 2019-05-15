
int num = 10;
PVector[][] lattice;
PShape tile;
PVector[] base = new PVector[2];
float scalar;

void setup() {
  size(500, 500);
  colorMode(HSB, 1);
  scalar = height * 1.0 / num;
  makeSqLattice();
  makePythagoras();
  drawTilling();
}

void draw() {}

void mouseClicked() {
  drawTilling();
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

void makePythagoras() {
  PVector[] v = new PVector[9];
  for(int i=0; i < 4; i++) {
    v[i] = PVector.fromAngle(2 * PI * (i + 0.5) / 4);
    v[i].mult(scalar / sqrt(2));
  }
  float gap = (sqrt(5) - 1) / 2;
  float theta = atan(gap);
  PVector slope = PVector.sub(v[1], v[0]);
  slope.rotate(theta);
  v[4] = slope.copy();
  v[4].mult(sin(theta));
  v[4].add(v[0]);
  v[5] = slope.copy();
  v[5].mult(cos(theta));
  v[5].add(v[0]);
  v[6] = slope.copy();
  v[6].mult(1.0 / cos(theta));
  v[6].add(v[0]);
  v[7] = PVector.sub(v[5], v[1]);
  v[7].add(v[4]);
  v[8] = PVector.sub(v[6], v[1]);
  v[8].add(v[0]);
  tile = createShape(GROUP);
  makeDoubleSq(v);
  makeEdge(v);
}

void makeDoubleSq(PVector[] v) {
  int[][][] indDomain = {
    {{0, 1, 5}, {4, 6, 2, 3}, {3, 7, 8}},
    {{1, 5, 6}, {0, 4, 7, 8}}
  };
  PShape[] sq = new PShape[2];
  for(int i=0; i < 2; i++) {
    sq[i] = createShape(GROUP);
    for(int[] ind : indDomain[i]) {
      PShape elm = createShape();
      elm.setFill(col[i]);
      elm.beginShape();
      elm.noStroke();
      for(int j : ind) {
        elm.vertex(v[j].x, v[j].y);
      }
      elm.endShape(CLOSE);
      sq[i].addChild(elm);
    }
    tile.addChild(sq[i]);
  }
}

void makeEdge(PVector[] v) {
  PShape lin;
  int[][] indLine = {{0, 6}, {1, 5}, {3, 4}, {7, 8}};
  lin = createShape(GROUP);
  for(int[] ind : indLine) {
    PShape elm = createShape();
    elm.beginShape();
    for(int i : ind) {
      elm.vertex(v[i].x, v[i].y);
    }
    lin.addChild(elm);
  }
  tile.addChild(lin);
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
