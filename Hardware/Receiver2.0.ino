// initializations for receive
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
RF24 radio(7, 8); // CE, CSN
const byte address[6] = "00001";
int data;

// initializations for light
#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
 #include <avr/power.h> // Required for 16 MHz Adafruit Trinket
#endif
int ledState = 0;
#define LED_PIN 6 
#define LED_COUNT 60 // number of NeoPixels attached to the Arduino
Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_GRB + NEO_KHZ800); // declare NeoPixel strip object
// When setting up the NeoPixel library, we tell it how many pixels,
// and which pin to use to send signals. Note that for older NeoPixel
// strips you might need to change the third parameter -- see the
// strandtest example for more information on possible values.
Adafruit_NeoPixel pixels(LED_COUNT, LED_PIN, NEO_GRB + NEO_KHZ800);

// initializations for fan
int pwmVal;
// const int potPin = A0;
const int pwmPin = 5;
// check if the LED is lit up
int on = 0;

void setup() {
  Serial.begin(9600);

  // setup for receive
  radio.begin();
  radio.openReadingPipe(0, address);
  radio.setPALevel(RF24_PA_MIN);
  radio.startListening();

  // setup for lights
  #if defined(__AVR_ATtiny85__) && (F_CPU == 16000000)
  clock_prescale_set(clock_div_1);
  #endif
  strip.begin();           // INITIALIZE NeoPixel strip object 
  strip.show();            // Turn OFF all pixels ASAP, might want to replace with strip.clear()

}
// encoding deviceVar 
//  1: lights, 2: fan
// encoding controlVar 
//  1: on, 2: off, 3: increase, 4: decrease
// when we want to stop repeating the same function ex: selecting same controlVar over and over, sending a stop number to unselect the device

void loop() {
  // Check whether there is data to be received
  if (radio.available()) {
  // if (true) {
    radio.read(&data, sizeof(data)); // Read the whole data and store it into the 'data' structure

    int deviceVar = data / 10;
    int controlVar = data % 10;

    // int deviceVar = data[0];
    // int deviceVar = 2;
    Serial.print("deviceVar: ");
    Serial.print(deviceVar);
    Serial.println();

    // int controlVar = data[1];
    // int controlVar = 4;
    Serial.print("controlVar: ");
    Serial.print(controlVar);
    Serial.println();

        // casing here
    if (deviceVar == 1) {
      lights(controlVar);
    } else if (deviceVar == 2) {
      fan(controlVar);
    }

  }
}

void lights(int controlVar) {
  
  lightUp();

  if (controlVar == 1) {
    brightnessUpAll();
  } else if (controlVar == 2) { 
    brightnessDownAll();
  } else if (controlVar == 3) {
    int currBrightness = pixels.getBrightness();
    brightnessUp(currBrightness);
  } else if (controlVar == 4) {
    int currBrightness = pixels.getBrightness();
    brightnessDown(currBrightness);
  }
}

void brightnessUpAll(void) {
  for(int i=0; i<LED_COUNT; i++) { // For each pixel...
    pixels.setBrightness(255);
    pixels.show();   // Send the updated pixel colors to the hardware.
  }
}

void brightnessDownAll(void) {
  for(int i=0; i<LED_COUNT; i++) { // For each pixel...
    pixels.setBrightness(0);
    pixels.show();   // Send the updated pixel colors to the hardware.
  }
}

void brightnessUp(int currBrightness) {
  if (currBrightness==0) {
    currBrightness = 10; 
  }
  for(int i=0; i<LED_COUNT; i++) { // For each pixel...
    if (currBrightness <= 235) {
      pixels.setBrightness(currBrightness*1.10);
      // Serial.print(currBrightness*1.10);
      pixels.show();   // Send the updated pixel colors to the hardware.
    } else {
      pixels.setBrightness(255);
      pixels.show();
    }
  }
}

void brightnessDown(int currBrightness) {
  for(int i=0; i<LED_COUNT; i++) { // For each pixel...
    if (currBrightness >= 0) {
      pixels.setBrightness(currBrightness*0.90);
      pixels.show();   // Send the updated pixel colors to the hardware.
    }
  }
}
void fan(int controlVar) {
  if (controlVar == 1) {
    pwmVal = 255; 
    updateFanPWM(pwmVal);
  } else if (controlVar == 2) {
    pwmVal = 0; 
    updateFanPWM(pwmVal);
  } else if (controlVar == 3) {
    if (pwmVal <= 255 - 10) {
      pwmVal += 10; 
      updateFanPWM(pwmVal);
    }
  } else if (controlVar == 4) {
    if (pwmVal >= 10) {
      pwmVal -= 10; 
      updateFanPWM(pwmVal);
    }
  }

}

void updateFanPWM(int pwmVal) {
  // pwmVal = map(analogRead(potPin),0,1023,90,255);
  analogWrite(pwmPin, pwmVal);
  Serial.println(pwmVal);
  // delay(100);
}

void lightUp(void) {
  pixels.clear(); // Set all pixel colors to 'off'
  for(int i=0; i<LED_COUNT; i++) { // For each pixel...
    // pixels.setBrightness(255);
    pixels.setPixelColor(i, pixels.Color(255, 255, 255));
    // pixels.show();   // Send the updated pixel colors to the hardware.
  }
}

void lightDown(void) {
  pixels.clear(); // Set all pixel colors to 'off'
  for(int i=0; i<LED_COUNT; i++) { // For each pixel...
    pixels.setPixelColor(i, pixels.Color(0, 0, 0));
    pixels.show();   // Send the updated pixel colors to the hardware.
  }
}
