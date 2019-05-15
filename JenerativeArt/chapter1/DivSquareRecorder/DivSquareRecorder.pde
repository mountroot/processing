
 import processing.pdf.*;
 
 int numA = 10;
 int numB = 6;
 float ratio = (float) numB / numA;
 float xPos = 0;
 float yPos = 0;
 int itr = 0;
 String namePDF = str(numA) + "_" + str(numB) + ".pdf";
 String namePNG = str(numA) + "_" + str(numB) + ".png";
 size(500, 500);
 colorMode(HSB, 1);
 float wd = width;
 beginRecord(PDF, namePDF);
 
 while(wd > 0.1) {
   itr++;
   if(itr % 2 == 1) {
     while(xPos + wd * ratio < width + 0.1) {
       fill(color(random(1), 1, 1));
       rect(xPos, yPos, wd * ratio, wd);
       xPos += wd * ratio;
     }
     wd = width - xPos;
   } else {
     while (yPos + wd / ratio < width + 0.1) {
       fill(color(random(1), 1, 1));
       rect(xPos, yPos, wd, wd / ratio);
       yPos += wd / ratio;
     }
     wd = width - yPos;
   }
 endRecord();
 save(namePDF);
 }
