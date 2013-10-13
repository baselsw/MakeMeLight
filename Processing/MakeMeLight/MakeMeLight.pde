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

import java.awt.Robot; //java library that lets us take screenshots
import java.awt.AWTException;
import java.awt.event.InputEvent;
import java.awt.image.BufferedImage;
import java.awt.Rectangle;
import java.awt.Dimension;
import processing.serial.*; //library for serial communication
import ddf.minim.*;
import java.awt.Toolkit;

//-----Constans-----
int leds_nr = 32; //Number of LEDs
int ledsH = 8;  //Number of LEDs on one vertical line
int ledsW = 16; //Number of LEDs on one horizontal line
int brightness = 110; //Brightness, 0-255.. For USB-power dont use more than 110 (32 LEDs).
int vshift = 30; //vertical shift the pixel matrix (number of pixels to shift)
int hshift = 30;//horizontal shift the pixel matrix (number of pixels to shift)
int sound_aver_nr = 1; //Moving average for sound
float sound_sense = 0.5; //(Led change vs Sound change sensitivity..)
//------------------

Serial myPort; //creates object "port" of serial class
Robot robot; //creates object "robby" of robot class
Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
int screenW     = screenSize.width;
int screenH     = screenSize.height;
CRGB[] leds = new CRGB[leds_nr];

Minim minim;
AudioInput in;

Button btn0, btn1, btn2, btn3, btn4;
String s0 = "Sound Mode On";
String s1 = "Sound Mode Off";
String s2 = "Display Mode On";
String s3 = "Display Mode Off";
String s4 = "FPS:";
int[] c0  = {
  201, 201, 201
};
int[] c1  = {
  0, 255, 0
};
int[] c2  = {
  0, 255, 255
};
int mode = 0;
double[][] soundArray = new double[2][sound_aver_nr];
int snd_avr_nr=1;
float senseV = 4.61/pow(100,sound_sense);
void setup() {
  myPort = new Serial(this, Serial.list()[0], 115200); //set baud rate
  minim = new Minim(this);
  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn();
  try
  {
    robot = new Robot();
  }
  catch (AWTException e)
  {
    println("Robot didn't initialize!");
    exit();
  }

  for (int i=0;i<leds_nr;i++) {
    leds[i] = new CRGB();
  }
  size(300, 150);
  btn0=new Button(s0, 10, 10, 100, 20);
  btn1=new Button(s1, 140, 10, 100, 20);
  btn2=new Button(s2, 10, 10+25, 110, 20);
  btn3=new Button(s3, 140, 10+25, 110, 20);
  btn4=new Button(s4, 75, 10+50, 110, 20);
  btn4.setColor(c2);
  btn4.enabled(false);
  btn1.enabled(false);
  btn3.enabled(false);
}

void draw() {
  btn4.reDraw();
  if (btn0.Pressed()==true) {
    println(s0);
    btn0.setColor(c1);
    btn1.setColor(c0);
    btn0.enabled(false);
    btn1.enabled(true);
    btn2.enabled(false);
    btn3.enabled(false);
    mode=1;
  }
  if (btn1.Pressed()==true) {
    println(s1);
    btn0.setColor(c0);
    btn1.setColor(c0);
    btn0.enabled(true);
    btn1.enabled(false);
    btn2.enabled(true);
    btn3.enabled(false);
    mode=0;
  }

  if (btn2.Pressed()==true) {
    println(s2);
    btn2.setColor(c1);
    btn3.setColor(c0);
    btn2.enabled(false);
    btn0.enabled(false);
    btn1.enabled(false);
    btn3.enabled(true);
    mode=2;
  }
  if (btn3.Pressed()==true) {
    println(s3);
    btn2.setColor(c0);
    btn3.setColor(c0);
    btn2.enabled(true);
    btn3.enabled(false);
    btn0.enabled(true);
    btn1.enabled(false);
    mode=0;
  }
  
  if(mode==0)clearDisp();
  if(mode==1)sound();
  if(mode==2)light();
  
}
