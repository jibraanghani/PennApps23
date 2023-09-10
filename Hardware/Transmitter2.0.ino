/*
* Arduino Wireless Communication Tutorial
*     Example 1 - Transmitter Code
*                
* by Dejan Nedelkovski, www.HowToMechatronics.com
* 
* Library: TMRh20/RF24, https://github.com/tmrh20/RF24/
*/

#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>

RF24 radio(7, 8); // CE, CSN

const byte address[6] = "00001";

int data;

void setup() {
  radio.begin();
  radio.openWritingPipe(address);
  radio.setPALevel(RF24_PA_MIN);
  radio.stopListening();

  // Start the serial communication with the baud rate of 9600 bps:
  Serial.begin(9600);
}

void loop() {
  // Check if data is available to read from the serial port:
  if (Serial.available() >= 1) {  // Wait until there is 1 byte available
    data = Serial.read();  // Read the deviceName and controlVar

    Serial.println("deviceVar: ");
    Serial.println(data);

    radio.write(&data, sizeof(data));
  }
}
