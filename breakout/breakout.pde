int velocidadeX = 2;
int velocidadeY = 3;
int sentidoX = 1;
int sentidoY = 1;

int tamanhoBola = 10;
Point pos = new Point(width/2, height/2);


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
  ellipse(pos.x, pos.y, tamanhoBola, tamanhoBola);
  pos.x += velocidadeX*sentidoX;
  pos.y += velocidadeY*sentidoY;
  if(pos.y >= 700-(tamanhoBola/2)){sentidoY = sentidoY*(-1);}
  if(pos.x >= 1280-(tamanhoBola/2) || pos.x <= (tamanhoBola/2)){sentidoX = sentidoX*(-1);}
  bs.update(pos.x, pos.y);
}
