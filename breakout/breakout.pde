// Diogo Kiche
// Pedro Carstens
// Vinicius Marques

import ddf.minim.*;
import controlP5.*;
import processing.video.*;

// Video
Movie myMovie;

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
boolean Paused;
int GAME_STATUS = 0;  // 0 = Menu, 1 = Game
HashMap<String, Character> controles;

// Elementos do Menu
ControlP5 cp5;
PFont font;
Textlabel pausedLabel;
Textlabel pointsLabel;
Textlabel healthLabel;

Textlabel p0;
Textlabel p1;
Textlabel p2;

int bg = color(0);

void init() {
  bs = new BlockSystem(8, 5);
  jogador = new Player(50, 670, 200, 20);
  ball = new Ball(20, 640);
  balls = new ArrayList();
  balls.add(ball);
}

void reset() {
  Salvar();
  GAME_STATUS = 0;
  jogador.pontos = 0;
  jogador.health = 3;
  balls.clear();
  bs.clear();
  Voltar();
  init();
}


void drawLoop() {
  for (Ball b : balls) b.desenhar();
  HUD();
  jogador.desenhar();
  bs.desenhar();
}

void eventLoop() {
  if (jogador.health <= 0) reset();
  for (int i = 0; i < balls.size(); i++) {
      Ball b = balls.get(i);
      b.update();
      bs.update(b);
      jogador.colide(b);
      if (!b.alive) balls.remove(i);
  }
  jogador.update();
}


void drawGame() {
  drawLoop();
  if (Running) eventLoop();
}


void setup(){
  size(1280, 720);
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  
  // Video
  myMovie = new Movie(this, "sp.mp4");
  myMovie.loop();
  
  // Som
  minim = new Minim(this);
  hit = minim.loadFile("plop.wav");
  dest = minim.loadFile("beep.wav");
  song = minim.loadFile("song.mp3");
  song.loop();
  
  // Controles
  controles = new HashMap<String, Character>();
  controles.put("resetar_blocos", 'r');
  controles.put("resetar_bolas", 'c');
  controles.put("esquerda", 'a');
  controles.put("direita", 'd');
  controles.put("pausa", 'p');
  
  // Elementos
  init();
  
  // Menu
  cp5 = new ControlP5(this);
  font = createFont("arial", 20);
  inicializar_menu(cp5);
  
  Running = true;
}

void draw(){
  background(bg);
  image(myMovie, 0, 0);
  fill(360);
  textSize(20);
  text(jogador.nome, width/2 - 55, 30);
  if (GAME_STATUS == 1) drawGame();
}

public void fexit() {
  hit.mute();
  dest.mute();
  song.mute();
  myMovie.stop();
  minim.stop();
  myMovie = null;
  minim = null;
  noLoop();
  super.exit();
  System.exit(0);
}

void movieEvent(Movie m) {
  m.read();
}
