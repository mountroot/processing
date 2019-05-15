
PShape img;
size(300, 300);
img = loadShape("icon_107750.svg");
translate(width / 2, height /2);
for(int j=0; j < 2; j++) {
  for(int k=0; k < 6; k++) {
    img.resetMatrix();
    img.rotate(k * 2 * PI / 6);
    shape(img);
  }
}
