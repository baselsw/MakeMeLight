void sendData(){
  byte[] out = new byte[leds_nr*3+1];
  out[0]='z';
  for (int k=0;k<leds_nr;k++) {
    out[3*k+1]=(byte)leds[k].getRED();
    out[3*k+2]=(byte)leds[k].getGREEN();
    out[3*k+3]=(byte)leds[k].getBLUE();
  }
  myPort.write(out);
}

void clearDisp(){
    for (int i=0;i<leds_nr;i++) {
    leds[i] = new CRGB(0,0,0);
  }
  sendData();
}
