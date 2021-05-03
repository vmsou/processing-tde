color c1 = color(200, 50, 50);
color c2 = color(255, 140, 0);
color c3 = color(255, 255, 0);
color c4 = color(34, 139, 34);
color c5 = color(65, 105, 255);

color[] colors = {c1, c2, c3, c4, c5};


class Point {
  int x, y;
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

class Block {
  Point pos;
  int w, h;
  int health;
  color c;
  boolean alive = true;
  
  Block(int x, int y, int w, int h, int c) {
    this.pos = new Point(x, y);
    this.w = w;
    this.h = h;
    this.c = c;
  }
  
  void desenhar() {
    if (alive) {
      fill(c);
      rect(pos.x, pos.y, w, h);
    } 
  }
  
  boolean colisao(int x2, int y2) {
    if (alive) {
      if ((x2 > pos.x && x2 < pos.x + w) && (y2 > pos.y && y2 < pos.y + h)) {
      return true;
      }
    }
    return false;
  }
}

class BlockSystem {
  ArrayList<Block> blocks;
  int l;
  int n;
  
  BlockSystem(int n, int l) {
    blocks = new ArrayList<Block>();
    
    for (int j = 0; j < l; j++) {
      for (int i = 0; i < n; i++) {
        Block block = new Block((150*i) + (5*i) + 20, (30*j) + (5 * j) + 20, 150, 30, colors[j]);
        block.health = 1;
        blocks.add(block);
      }
    }
    
  }
  
  void update(Ball bola) {
    for (Block b : blocks) {
      b.desenhar();
      textSize(20);
      if (b.colisao(bola.x, bola.y)) {
        bola.directionY *= -1;
        b.health -= 1;
        if (b.health <= 0) b.alive = false;
      };
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
