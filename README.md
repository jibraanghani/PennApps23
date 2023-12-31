# PennApps23 (ambi. computing)

We had four main components that were integrated in this project: hardware, firmware, backend, and frontend. The hardware represents the physical functionalities of the car (ex. lights, fan, speaker). In our demonstration, we simulated the lights and the fan of a car. 

Video Demo: https://www.youtube.com/watch?v=_UXkjc75MEE

Presentation: https://docs.google.com/presentation/d/1yJXEyUW9XOk2eHzTgXI2spUZmKuxz7Gd4XMvX70FGTA/edit#slide=id.p

Devpost: https://devpost.com/software/ambi-qsiawr

HARDWARE 
 
We used hardware to control the peripherals of the car such as the fan and the LED strip lights (Neopixel). For the fan, we used a transistor-driver circuit and pulse width modulation from the Arduino UNO to vary the duty cycle of the input wave and hence change the speed of the fan. Two resistors were attached to the gate of the power transistor to ensure: one to drive the GPIO and the other to ensure that it was not floating when there’s no voltage present at it. A diode was also attached between drain and source in case the fan generated back EMF. A regulator (78L05) was used to supply voltage and current to the LED since it needed lower voltage supply but a higher current. This was easier to program as it didn’t require PWM. The Neopixel library was used to control the brightness of the LEDs, its color, etc. A radio module, nRF24L01+, was used to communicate between the first Arduino UNO connected to the peripherals and the second Arduino UNO connected to the laptop running the computer vision python script and the backend. The communication over the radio was done using a library and a single integer was sent that encoded both the device that was chosen as well as its control. More specifically, this was the encoding used - 1: light, 2: fan then 1: on, 2: off, 3: increase, 4: decrease.

FIRMWARE

We used firmware to change the physical state of the hardware by analyzing the motions of a hand using computer vision, and then changing the physical features of the car to match the corresponding hand motions. The firmware was built in Python scripts, using the libraries of mediapipe, opencv, and numpy. A camera (from the user’s phone) that is mounted next to the steering wheel, tracks the motion of the user’s hand. If it detects some fingers that are being held up by the user (from 1 to 4 fingers) for over 2 seconds, it will record the number of fingers, which corresponds to a certain device (e.g. lights). Then, the camera will continue to record the user as they hold up different numbers of fingers. One finger corresponds to turning on the device, two fingers corresponds to turning off the device, three fingers corresponds to increasing the device (e.g. increasing brightness), and four fingers corresponds to decreasing the device (e.g. decreasing brightness). Then, if the user holds up no fingers for an extended amount of time, the system will alert the user and revert back to waiting for the user to input another device. 

BACKEND

Third, we used a backend Python script to integrate the data received and transmitted to the firmware and computer vision with the data received and transmitted to the frontend Frontend Swift App. The backend Python script would take in data from the Frontend Swift App that indicates what each number of fingers corresponds to which specific task. It will communicate that with the firmware, calling functions from the firmware library to start each of the different functions. For example, the backend Python script will call a function in the firmware library to wait until a device is selected, and then after this device is selected, to perform various functionalities on. The speech is also configured in this script to indicate to the user what is currently being done. 

FRONTEND

In creating the UI/UX design, we used SwiftUI. Through the creation of various landing pages for the user to enter, starting from the cover page for ambi, we prompted a flow between the design and the detection of how many fingers via the camera. The second screen of the app detailed how many fingers correlated with which hardware device (the light correlated with 1 finger, the fan correlated with 2 fingers, 3 radio volume, 4 radio station), and the third screen detailed the specific adjustments (1 for on, 2 for off, 3 for increase, 4 for decrease). This tied together the hardware component with the frontend, able to visually see the guide for which fingers corresponded to which function. Additionally, our app included a built in camera function, that can be used further to detect the number of fingers. SwiftUI was used in the creation of the pages visually, as well as in implementing functionality of buttons and moving between pages.

