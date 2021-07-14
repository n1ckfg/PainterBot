class PainterRenderer {
  
  PainterScript ps;
  PGraphics pg;
  
  PainterRenderer(String url) {
    ps = new PainterScript(url);
    pg = createGraphics(ps.w, ps.h, P2D);
    render();
  }
  
  void render() {
    pg.beginDraw();    
    pg.background(ps.bgColor);
    
    for (PainterCmd cmd : ps.cmds) {
      switch (cmd.type) {
        case "stroke":
          pg.noFill();
          pg.strokeWeight(2);
          pg.beginShape();
          for (PainterPoint point : cmd.points) {
            PVector p = point.co;
            pg.vertex(p.x, p.y);
          }
          pg.endShape();
          break;
        case "fgcolor":
          pg.stroke(cmd.fgColor);
          pg.fill(cmd.fgColor);
          break;
      }
    }   
    
    pg.endDraw();
  }
  
  void draw(int x, int y) {
    image(pg, x, y);
  }
    
}
