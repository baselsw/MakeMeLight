BufferedImage screenshot;
void light() {
  int a = millis();
  screenshot = robot.createScreenCapture(new Rectangle(new Dimension(screenW, screenH)));

  for (int j=0;j<ledsH;j++) {

    int p = screenshot.getRGB(screenW-hshift, screenH-vshift-j*(screenH/ledsH));
    double r=(p>>16)&255;
    double g=(p>>8)&255;
    double b=(p&255);
    p = screenshot.getRGB(screenW-hshift, screenH-vshift-j*(screenH/ledsH)+1);
    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));
    p = screenshot.getRGB(screenW-hshift, screenH-vshift-j*(screenH/ledsH)-1);

    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));

    p = screenshot.getRGB(screenW-hshift+1, screenH-vshift-j*(screenH/ledsH));
    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));

    p = screenshot.getRGB(screenW-hshift-1, screenH-vshift-j*(screenH/ledsH));
    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));

    r=r/5;
    g=g/5;
    b=b/5;

    leds[j].setRED((int)r*brightness/255);
    leds[j].setGREEN((int)g*brightness/255);
    leds[j].setBLUE((int)b*brightness/255);
  }

  for (int j=0;j<ledsW;j++) {
    int p = screenshot.getRGB(screenW-hshift-j*(screenW/ledsW), vshift);
    int r=(p>>16)&255;
    int g=(p>>8)&255;
    int b=(p&255);

    p = screenshot.getRGB(screenW-hshift-j*(screenW/ledsW)+1, vshift);
    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));

    p = screenshot.getRGB(screenW-hshift-j*(screenW/ledsW)-1, vshift);
    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));

    p = screenshot.getRGB(screenW-hshift-j*(screenW/ledsW), vshift+1);
    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));

    p = screenshot.getRGB(screenW-hshift-j*(screenW/ledsW), vshift-1);
    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));

    r=r/5;
    g=g/5;
    b=b/5;   

    leds[j+ledsH].setRED((int)r*brightness/255);
    leds[j+ledsH].setGREEN((int)g*brightness/255);
    leds[j+ledsH].setBLUE((int)b*brightness/255);
  }


  for (int j=0;j<ledsH;j++) {
    int p = screenshot.getRGB(hshift, vshift+j*(screenH/ledsH));
    int r=(p>>16)&255;
    int g=(p>>8)&255;
    int b=(p&255);

    p = screenshot.getRGB(hshift+1, vshift+j*(screenH/ledsH));
    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));

    p = screenshot.getRGB(hshift-1, vshift+j*(screenH/ledsH));
    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));

    p = screenshot.getRGB(hshift, vshift+j*(screenH/ledsH)+1);
    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));

    p = screenshot.getRGB(hshift, vshift+j*(screenH/ledsH)-1);
    r=r+((p>>16)&255);
    g=g+((p>>8)&255);
    b=b+((p&255));

    r=r/5;
    g=g/5;
    b=b/5;  

    leds[j+ledsH+ledsW].setRED((int)r*brightness/255);
    leds[j+ledsH+ledsW].setGREEN((int)g*brightness/255);
    leds[j+ledsH+ledsW].setBLUE((int)b*brightness/255);
  }

  sendData();
  a=1000/(millis()-a);
  String b = ""+a;
  btn4.setText(s4 + b);
}
