// Bibliothek um Text in Shape umzuwandeln 
import geomerative.*;


import processing.pdf.*;

String inhalt = "Smoky Typo";
int fontSize = 300;
int distance = 2;

RFont font;
RGroup grp;
RPoint[] pnts;



void setup() {
  fullScreen();
  smooth();
  frameRate(300);

  // Hier wird die Library initialisiert und die Schrift erzeugt - Die Schrift muss im Sketchordner sein!

  RG.init(this);
  font = new RFont("FreeSans.ttf", fontSize, RFont.CENTER);

  // Hier wird die "Auflösung" des umgewandelten Textes definiert (Anzahl der Punkte und deren Abstände)

  RCommand.setSegmentStep(10);
  RCommand.setSegmentator(RCommand.UNIFORMSTEP);
  RCommand.setSegmentLength(40);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  grp = font.toGroup(inhalt);
  pnts = grp.getPoints(); 

  background(0);
}

void draw() {
  noFill();
  pushMatrix();

  // Der Text wird ins Zentrum des Screens gelegt
  translate(width/2, height/2+fontSize/2);
  // Punkte (Agents) werden erzeugt
  for (int i = 0; i < pnts.length; i++ ) {
    pnts[i].x += random(-distance, distance);
    pnts[i].y += random(-distance, distance);
  }

  //Punkte (Agents) werden verbunden
  strokeWeight(0.1);
  stroke(200, 20);
  beginShape();
  for (int i=0; i<pnts.length; i++) {
    curveVertex(pnts[i].x, pnts[i].y);
  }

  endShape();


  popMatrix();
  
  rec();
}
