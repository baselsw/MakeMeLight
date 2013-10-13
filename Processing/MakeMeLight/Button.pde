public class Button {
  public int xi=0;
  public int yi=0;
  public int widthi=0;
  public int heighti=0;
  public String texti="";
  public int[] colori = {
    201, 201, 201
  };
  private boolean state=false;
  private int tm = millis();
  private boolean en = true;
  public Button(String _text, int _x, int _y, int _width, int _height) {
    xi=_x;
    yi=_y;
    widthi=_width;
    heighti=_height;
    texti=_text;
  }
  public int[] getColor() {
    return colori;
  }
  public String getText() {
    return texti;
  }
  public int getX() {
    return xi;
  }
  public int getY() {
    return yi;
  }
  public int getWidth() {
    return widthi;
  }
  public int getHeight() {
    return heighti;
  }
  public int setColor(int[] Val) {
    colori=Val;
    return 1;
  }
  public int setText(String Val) {
    texti=Val;
    return 1;
  }
  public int setX(int Val) {
    xi=Val;
    return 1;
  }
  public int setY(int Val) {
    yi=Val;
    return 1;
  }
  public int setWidth(int Val) {
    widthi=Val;
    return 1;
  }
  public int setHeight(int Val) {
    heighti=Val;
    return 1;
  }

  public boolean Pressed() {
    if (mousePressed & mouseX>=xi & mouseX<=(xi+widthi) & mouseY>=yi & mouseY<=(yi+heighti) & (millis()-tm)>300 & state==false & en==true) {
      state=true;
      tm=millis();
      reDraw();
      redraw();
      return true;
    }
    else {
      state=false;
      reDraw();
      return false;
    }
  }
  public void reDraw() {
    if (state==false) {
      fill(colori[0], colori[1], colori[2]);
      rect(xi, yi, widthi, heighti);
      fill(0, 0, 0);
      text(texti, (2*xi+(widthi-7*texti.length()))/2, yi, xi+widthi, yi+heighti);
    }
    else {
      fill(255-colori[0], 255-colori[1], 255-colori[2]);
      rect(xi, yi, widthi, heighti);
      fill(255, 255, 255);
      text(texti, (2*xi+(widthi-7*texti.length()))/2, yi, xi+widthi, yi+heighti);
    }
  }

  public void enabled(boolean val) {
    en=val;
  }
}//BUTTON
