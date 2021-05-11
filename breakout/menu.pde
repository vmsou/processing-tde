class Botao {
  String texto;
  int x, y, w, h, text_size;
  color fundo, cor_texto;
  
  Botao(String texto, int x, int y, int w, int h) {
    this.texto = texto;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  void draw() {
    rectMode(CENTER);
    fill(fundo);
    rect(x, y, w, h);
    fill(cor_texto);
    textSize(text_size);
    textAlign(CENTER, CENTER);
    text(texto, x, y);
  }
  
  boolean dentro() {
     if((mouseX > x && mouseX < x + w) && (mouseY > y && mouseY < y + h)) {
       return true;
     }
     return false;
  }
  
  void setColor(color texto, color cor_bloco) {
    fundo = cor_bloco;
    cor_texto = texto;
  }
}
