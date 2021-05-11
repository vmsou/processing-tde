import ddf.minim.*;

// Som
Minim minim;
AudioPlayer song, hit, dest;

// Objetos do jogo
ArrayList<Ball> balls;
BlockSystem bs;
Ball ball;
Player jogador;

// Configurações do jogo
boolean Running;

void HUD() {
  textSize(30);
  text("Pontos: " + jogador.pontos, 0, 30);
  text("Vida: " + jogador.health, 1150, 30);
}

void drawLoop() {
  background(#c4c4c4);
  fill(0, 255, 0);
  HUD();
  for (Ball b : balls) b.desenhar();
  jogador.desenhar();
  bs.desenhar();
}

void eventLoop() {
  if (jogador.health <= 0) Running = false;
  for (int i = 0; i < balls.size(); i++) {
      Ball b = balls.get(i);
      b.update();
      bs.update(b);
      jogador.colide(b);
      if (!b.alive) balls.remove(i);
  }
  jogador.update();
}


void setup(){
  size(1280, 720);
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  
  Running = true;
  minim = new Minim(this);
  hit = minim.loadFile("plop.wav");
  dest = minim.loadFile("beep.wav");
  //song = minim.loadFile("song.mp3");
  //song.setVolume(1);
  //song.loop();
  bs = new BlockSystem(8, 5);
  jogador = new Player(50, 670, 200, 20);
  ball = new Ball(20, 640);
  balls  = new ArrayList();
  balls.add(ball);
}

void draw(){
  drawLoop();
  if (Running) eventLoop();
  else {
    textSize(40);
    text("Pausado", width/2 - 100, height/2);
  }
}
