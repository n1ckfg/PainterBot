class PainterRenderer {
  
  PainterScript ps;
  PGraphics pg;
  int width;
  int height;
  
  PainterRenderer(String url) {
    ps = new PainterScript(url);
    pg = createGraphics(ps.width, ps.height, P2D);
    width = pg.width;
    height = pg.height;
  }
  
  void render() {
    pg.beginDraw();
    // TODO render ps object
    pg.endDraw();
  }
  
  void draw(int x, int y) {
    image(pg, x, y);
  }
    
}
