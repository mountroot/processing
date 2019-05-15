
Tri t;
float radE = 7 * PI / 5;

void setup() {
  size(500, 500);
  initialize(200);
  goldenDivision();
}

void initialize(float scalar) {
  PVector v0 = PVector.fromAngle(3 * PI / 2);
  v0.mult(scalar);
  PVector v1 = PVector.fromAngle(7 * PI / 10);
  v1.mult(scalar);
  PVector v2 = PVector.fromAngle(3 * PI / 10);
  v2.mult(scalar);
  t = new Tri(v0, v1, v2);
}

void goldenDivision() {
  translate(width / 2, height / 2);
  t.drawTriangle();
  t.updateThinS();
  radE = t.drawArc(radE);
}
  
class Tri {
  float PHI = (1 + sqrt(5)) / 2;
  PVector[] v_;
  Tri(PVector v0, PVector v1, PVector v2) {
    v_ = new PVector[]{v0, v1, v2};
  }
  
  void drawTriangle() {
    triangle(v_[0].x, v_[0].y, v_[1].x, v_[1].y, v_[2].x, v_[2].y);
  }
  
  void updateThinS() {
    PVector v3 = PVector.sub(v_[0], v_[2]);
    v3.mult(2 - PHI);
    v3.add(v_[2]);
    v_ = new PVector[]{v_[1], v_[2], v3};
  }

  float drawArc(float _radE) {
    float diam = 2 * PVector.dist(v_[0], v_[2]);
    float radS = _radE - 3 * PI / 5;
    noFill();
    arc(v_[2].x, v_[2].y, diam, diam, radS, _radE);
    return radS;
  }
}
