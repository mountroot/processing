
String word = "A";
int gen = 0;

void setup() {
  transition();
}

void draw() {}

void transition() {
  int numA = 0;
  int numB = 0;
  println(gen, ":" + word);
  String[] splitW = splitTokens(word);
  for(int i=0; i < splitW.length; i++) {
    if(splitW[i].equals("A")) {
      splitW[i] = "A B";
      numA++;
    } else {
      splitW[i] = "A";
      numB++;
    }
  }
  println(numA, numB);
  word = join(splitW, " ");
  gen++;
}

void mouseClicked() {
  transition();
}
