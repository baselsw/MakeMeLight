public class CRGB {
  public int R=0;
  public int G=0;
  public int B=0;

  public CRGB(int _R, int _G, int _B) {
    R=_R;
    G=_G;
    B=_B;
  }
  public CRGB() {
  }
  public int getRED() {
    return R;
  }
  public int getGREEN() {
    return G;
  }
  public int getBLUE() {
    return B;
  }

  public int setRED(int Val) {
    R=Val;
    return 1;
  }
  public int setGREEN(int Val) {
    G=Val;
    return 1;
  }
  public int setBLUE(int Val) {
    B=Val;
    return 1;
  }
} 
