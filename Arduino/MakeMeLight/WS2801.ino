void initLEDS(){
  pinMode (slaveSelectPin, OUTPUT);
  SPI.setClockDivider(SPI_CLOCK_DIV4);
  SPI.begin();  
}
void Sendled(){
  for(int i = 0;i<LEDS_NR;i++){
    SPI.transfer((char)leds[i].r);
    SPI.transfer((char)leds[i].g);
    SPI.transfer((char)leds[i].b);
  }
}

void resetLedMat(){
  for(char i=LEDS_NR-1;i>0;i--){
    leds[i].r=0;
    leds[i].g=0;
    leds[i].b=0;
  }
}
