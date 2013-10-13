/*
  MakeMeLight - Ambient lighting firmware
  
  Created by Basel Al-Rudainy, 13 oktober 2013.
  
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.
  
  Change log:
  
  V1.00 - MakeMeLight firmware created!
*/

#define LEDS_NR  32
#include <SPI.h>
#include "defines.h"

void setup() {
  Serial.begin(115200);
  while(!Serial);
  initLEDS();
}

void loop() {
  while(Serial.available()<=0);
  if(Serial.available()){
    char data = Serial.read();
    if(data == 'y'){
      while(Serial.available()<24);        
      for(int i=0;i<8;i++){
        buff_leds[i].r = Serial.read();
        buff_leds[i].g = Serial.read();
        buff_leds[i].b = Serial.read();  
      }
      byte k=0;
      for(int j=0;j<LEDS_NR;j=j+4){
        leds[j].r=buff_leds[k].r;
        leds[j].g=buff_leds[k].g;
        leds[j].b=buff_leds[k].b;
        leds[j+1].r=buff_leds[k].r;
        ;
        leds[j+1].g=buff_leds[k].g;
        leds[j+1].b=buff_leds[k].b;
        leds[j+2].r=buff_leds[k].r;
        ;
        leds[j+2].g=buff_leds[k].g;
        leds[j+2].b=buff_leds[k].b;
        leds[j+3].r=buff_leds[k].r;
        ;
        leds[j+3].g=buff_leds[k].g;
        leds[j+3].b=buff_leds[k].b;
        k++;
      }//for
      Sendled();
      delayMicroseconds(200);
    }//if data=='R'
    if(data == 'z'){        
      for(int j=0;j<LEDS_NR;j++){
        while(Serial.available()<3);
        leds[j].r=(unsigned char)Serial.read();
        leds[j].g=(unsigned char)Serial.read();
        leds[j].b=(unsigned char)Serial.read();
      }//for
      Sendled();
      delayMicroseconds(200);
    }//if data=='z'
  }//if Serial.available
}//void loop
