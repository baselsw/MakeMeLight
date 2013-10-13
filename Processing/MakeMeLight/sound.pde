void sound(){
  int mm=millis();
  updatePixels();
  sendData();
  delay(1);
  mm=1000/(millis()-mm);
  String b = ""+mm;
  btn4.setText(s4 + b);
}
void updatePixels() {
  double tempR=0;
  double tempL=0;

  for (int k=0;k<snd_avr_nr;k++) {
    tempR=tempR+(50 + in.right.get(k)*50);
    tempL=tempL+(50 + in.left.get(k)*50);
  }
  tempR=tempR/snd_avr_nr;
  tempL=tempL/snd_avr_nr;
  
  for(int k=0;k<sound_aver_nr-1;k++){
   soundArray[0][k]=soundArray[0][k+1];
   soundArray[1][k]=soundArray[1][k+1];
  }
  soundArray[0][sound_aver_nr-1]=tempR;
  soundArray[1][sound_aver_nr-1]=tempL;
  
  tempR=0;
  tempL=0;
  
  for(int k=0;k<sound_aver_nr;k++){
    tempR=tempR+soundArray[0][k];
    tempL=tempL+soundArray[1][k];
  }
  tempR=tempR/sound_aver_nr;
  tempL=tempL/sound_aver_nr;  
  int volR=(int)abs((float)tempR);
  int volL=(int)abs((float)tempL);
  if(sound_sense>0){
  volR=(int)exp(senseV*pow(volR,sound_sense));
  volL=(int)exp(senseV*pow(volL,sound_sense));
  }
  volR = (int)map(volR, 25, 100, 0, leds_nr+1);
  volL = (int)map(volL, 25, 100, 0, leds_nr+1);
  effect1(volR, volL);
}


void effect1(int x, int y) {
  if (x<0)x=0;
  if (y<0)y=0;
  for (int i=0;i<(leds_nr/4);i++) {
    leds[15-i].setRED(0);
    leds[15-i].setGREEN(brightness);
    leds[15-i].setBLUE(0);

    leds[16+i].setRED(0);
    leds[16+i].setGREEN(0);
    leds[16+i].setBLUE(brightness);
  }
  for (int i=0;i<(leds_nr/8);i++) {
    leds[7-i].setRED(brightness);
    leds[7-i].setGREEN(brightness);
    leds[7-i].setBLUE(0);

    leds[24+i].setRED((int)(0.7*brightness));
    leds[24+i].setGREEN(0);
    leds[24+i].setBLUE(brightness);

    leds[3-i].setRED(brightness);
    leds[3-i].setGREEN(0);
    leds[3-i].setBLUE(0);

    leds[28+i].setRED(brightness);
    leds[28+i].setGREEN(brightness);
    leds[28+i].setBLUE(brightness);
  }
  for (int i=0;i<(leds_nr/2);i++) {
    if (i>=x) {
      leds[15-i].setRED(0);
      leds[15-i].setGREEN(0);
      leds[15-i].setBLUE(0);
    }
    if (i>=y) {
      leds[16+i].setRED(0);
      leds[16+i].setGREEN(0);
      leds[16+i].setBLUE(0);
    }
  }
}
