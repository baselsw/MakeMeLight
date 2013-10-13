struct rgbLed{
  unsigned char r;
  unsigned char g;
  unsigned char b;
};

rgbLed leds[LEDS_NR];
rgbLed buff_leds[8];

#define BRIGHT 110
const int slaveSelectPin = 10;
