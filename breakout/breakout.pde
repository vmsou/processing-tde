import ddf.minim.*;
import controlP5.*;

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
int GAME_STATUS = 0;  // 0 = Menu, 1 = Game

// Elementos do Menu
ControlP5 cp5;
int bg = color(0);


void drawLoop() {
  for (Ball b : balls) b.desenhar();
  HUD();
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

void drawMenu() {

}

void drawGame() {
  drawLoop();
  if (Running) eventLoop();
  else {
    textSize(40);
    text("Pausado", width/2 - 100, height/2);
  }
}

void setup(){
  size(1280, 720);
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  
  // Som
  minim = new Minim(this);
  hit = minim.loadFile("plop.wav");
  dest = minim.loadFile("beep.wav");
  // song = minim.loadFile("song.mp3");
  // song.setVolume(1);
  // song.loop();
  
  // Elementos
  bs = new BlockSystem(8, 5);
  jogador = new Player(50, 670, 200, 20);
  ball = new Ball(20, 640);
  balls = new ArrayList();
  balls.add(ball);
  
  // Menu
  cp5 = new ControlP5(this);
  inicializar_menu(cp5);
  
  Running = true;
}

void draw(){
  background(bg);
  switch (GAME_STATUS) {
    case 0:
      drawMenu();
      break;
    case 1:
      drawGame();
      break;
    default:
      println("Error?");
      break;
  }
}
