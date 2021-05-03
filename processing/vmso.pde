color c1 = color(200, 50, 50);
color c2 = color(255, 140, 0);
color c3 = color(255, 140, 0);
color c4 = color(34, 139, 34);
color c5 = color(65, 105, 255);

color[] colors = {c1, c2, c3, c4, c5};

class Block {
  int x, y, w, h;
  color c;
  
  public Block(int x, int y, int w, int h, int c) {
    this.x = x;
    this.w = w;
    this.y = y;
    this.h = h;
    this.c = c;
  }
  
  public void desenhar() {
    fill(c);
    rect(x, y, w, h);
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
        Block block = new Block((150*i) + (5*i) + 20, (30*j) + (5 * j), 150, 30, colors[j]);
        blocks.add(block);
      }
    }
    
  }
  
  void update() {
    for (Block b : blocks) {
      b.desenhar();
    }
  }
}


BlockSystem bs = new BlockSystem(8, 5);

void setup() {
  size(1280, 720);
}

void draw() {
  bs.update();
}
