int velocidadeX = 2;
int velocidadeY = 3;
int sentidoX = 1;
int sentidoY = 1;

int x = 1280/2; 
int y = 720/2;
int tamanhoBola = 10;

Block b1 = new Block(100, 100, 170, 30, color(100, 100, 100));
void setup(){
  size(1280, 720);
  noStroke();
}
void draw(){
  background(#c4c4c4);
  fill(0, 255, 0);
  rect(0, 700, 1280, 20);
  fill(0);
  ellipse(x, y, tamanhoBola, tamanhoBola);
  x += velocidadeX*sentidoX;
  y += velocidadeY*sentidoY;
  if(y >= 700-(tamanhoBola/2)){sentidoY = sentidoY*(-1);}
  if(x >= 1280-(tamanhoBola/2) || x <= (tamanhoBola/2)){sentidoX = sentidoX*(-1);}
  bs.update(x, y);
}
