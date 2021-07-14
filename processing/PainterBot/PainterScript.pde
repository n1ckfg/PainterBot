class PainterScript {
  
  int w, h;
  color bgColor;
  String[] lines;
  ArrayList<PainterCmd> cmds;
  
  PainterScript(String url) {
    load(url);
  }
  
  void load(String url) {
    lines = loadStrings(url);
    
    cmds = new ArrayList<PainterCmd>();
    
    parse();
  }
  
  void parse() {
    PainterCmd cmd = new PainterCmd();
    
    for (int i=0; i<lines.length; i++) {
      String[] words = lines[i].split(" ");
      
      switch (words[0]) {
        case "stroke_start":
          cmd.cmdStroke();
          break;
        case "stroke_end":
          cmds.add(cmd);
          cmd = new PainterCmd();
          break;
        case "pnt":
          cmd.cmdPoint(words);
          break;
        case "color":
          cmd.cmdFgColor(words);
          cmds.add(cmd);
          cmd = new PainterCmd();
          break;
        case "new_3": // new file header
          w = int(words[3]);
          h = int(words[5]); 
          bgColor = color(int(words[16]), int(words[18]), int(words[20]));
          break;
      }     
    }
  }
  
}


class PainterCmd {
  
  String type = "";
  ArrayList<PainterPoint> points;
  color fgColor;
  
  PainterCmd() { }
   
  void cmdStroke() {
    type = "stroke";
    points = new ArrayList<PainterPoint>();
  }

  void cmdFgColor(String[] words) {
    type = "fgcolor";
    int r = int(words[2]);
    int g = int(words[4]);
    int b = int(words[6]);
    fgColor = color(r, g, b);
  }

  void cmdPoint(String[] words) {
    int x = int(words[2]);
    int y = int(words[4]);
    int time = int(words[6]);
    points.add(new PainterPoint(x, y, time));
  }
  
}

class PainterPoint {
  
  int x;
  int y;
  int time;
  float prs;
  float tlt;
  float brg;
  float whl;
  float rot;
  
  PVector co;
  
  PainterPoint(int _x, int _y, int _time) {
    x = _x;
    y = _y;
    time = _time;
    prs = 1.0;
    tlt = 0.0;
    brg = 0.0;
    whl = 1.0;
    rot = 0.0;    
  
    co = new PVector(x, y);
  }
  
}
