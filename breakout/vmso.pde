class Block {
  int x, y, w, h;
  int maxHealth;
  int health;
  int pontos = 1;
  color c;
  boolean alive = true;
  
  Block(int x, int y, int w, int h, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }
  
  void desenhar() {
    if (alive) {
      int bright = health * 255 / maxHealth;
      fill(c, bright);
      rect(x, y, w, h);
    } 
  }
  
  boolean colisao(int bx, int by, int bs) {
    int r = bs/2;
    if (alive) {
      if ((by > y-r && by < y + h + r) && (bx > x-r && bx < x + w + r)) {
      return true;
      }
    }
    return false;
  }
}

class BlockSystem {
  ArrayList<Block> blocks;
  int l;
  
  BlockSystem(int n, int l) {
    blocks = new ArrayList<Block>();
   
    for (int j = 0; j < l; j++) {
      for (int i = 0; i < n; i++) {
        Block block = new Block((150*i) + (5*i) + 20, (30*j) + (5*j) + 80, 150, 30, colors[j]);
        block.maxHealth = healths[j];
        block.health = block.maxHealth;
        blocks.add(block);
      }
    }
  }
  
  void desenhar() {
    for (Block b : blocks) b.desenhar();
  }
  
  void update(Ball bola) {
    for (Block b : blocks) {
      if (b.colisao(bola.x, bola.y, bola.size)) {
        jogador.pontos += b.pontos;
        bola.directionY *= -1;
        b.health -= 1;
        if (b.health <= 0) b.alive = false;
      };
    }
  }
  
  void reset() {
    for (Block b : blocks) {
      b.alive = true;
      b.health = b.maxHealth;
    }
  }
}

BlockSystem bs = new BlockSystem(8, 5);
//void setup() {
//  noStroke();
//  size(1280, 720);
//}

//void draw() {
//  bs.update();
// }
