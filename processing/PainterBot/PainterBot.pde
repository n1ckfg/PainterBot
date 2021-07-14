String url;
PainterRenderer pr;

void setup() {
  size(50, 50, P2D);
  pr = new PainterRenderer(url);
  surface.setSize(pr.width, pr.height);
}

void draw() {
  pr.draw(0, 0);
}
