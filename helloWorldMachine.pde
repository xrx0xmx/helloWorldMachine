import controlP5.*;

PFont f;                           
String[] fonts;
int i = 0;
String phrase = "Hello, World!";
String fontname = "";

ControlP5 cp_5;
Knob myKnobAA;
int font = 100;


void setup() {
  size(800,600);
  frameRate(1);
  //font = loadFont("FjallaOne-Regular.otf", 32);
  fonts = PFont.list();
  textAlign(CENTER); 
  fill(0);

  cp_5 = new ControlP5(this);
  myKnobAA = cp_5.addKnob("font")
               .setRange(0,255)
               .setValue(220)
               .setPosition(10,480)
               .setRadius(50)
               .setNumberOfTickMarks(10)
               .setTickMarkLength(4)
               .snapToTickMarks(true)
               .setColorForeground(color(255))
               .setColorBackground(color(0, 160, 100))
               .setColorActive(color(255,255,0))
               .setDragDirection(Knob.HORIZONTAL);
}

void save_to_file(String desc) {
  String filename = "";
  
  filename = "holamundo_png_" +  desc + ".png";  
  println("Output file: "+ filename);
  save(filename);
}

void rndFont() {
  int i = int(random(fonts.length));
  fontname = fonts[font];
  //println(fontname + " " + i);
  f = createFont(fontname,32,true);   
  textFont(f,140);
}

void rndColor() {
 color finish = color(random(255),random(255),random(255));
 fill(finish);
 stroke(255);
}

void rndBackground() {
 color finish = color(random(255),random(255),random(255));
 background(finish);    
}

void writeToolArea() {
  fill(0,100);
  noStroke();
  rect(0,460,800,140);

}

void set_deco() {
  rndFont();
  rndColor();  
  rndBackground();
  writeToolArea();
}

void write_text(String text) {
  int pos = 140;
  for (char letter : text.toCharArray())
  {
    //rndFont();
    text(letter,pos,300);
    pos = pos + 50;
  }

}

void draw() {
  set_deco();
  write_text(phrase);
  save_to_file(fontname);
}