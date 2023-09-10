#from flask import Flask, jsonify, request
from enum import Enum
from handtracker import HandTracker
from pygame import mixer
import time

#app = Flask(__name__)

class Hardware(Enum):
    LIGHT = 0
    FAN = 1
    RADIO_VOLUME = 2
    RADIO_STATION = 3

hardware_values_list = [Hardware.LIGHT.value, Hardware.FAN.value, 
                        Hardware.RADIO_VOLUME.value, Hardware.RADIO_STATION.value]

class Backend:
    def __init__(self):
        self.tracker = HandTracker()
        while True:
            setting = self.connect_to_device() # get number of fingers
            self.hardware_config(setting)
            # Starting the mixer
            mixer.init()
             
            # Loading the song
            mixer.music.load("restart.mp3")
             
            # Setting the volume
            mixer.music.set_volume(0.7)
             
            # Start playing the song
            mixer.music.play()
            time.sleep(3)

    def connect_to_device(self):
        finger = self.tracker.connectToDevice()
        print(finger)
        
        setting = hardware_values_list[finger - 1]
        if (finger == 1):
            # Starting the mixer
            mixer.init()
             
            # Loading the song
            mixer.music.load("car_light.mp3")
             
            # Setting the volume
            mixer.music.set_volume(0.7)
             
            # Start playing the song
            mixer.music.play()
        if (finger == 2):
            # Starting the mixer
            mixer.init()
             
            # Loading the song
            mixer.music.load("car_fan.mp3")
             
            # Setting the volume
            mixer.music.set_volume(0.7)
             
            # Start playing the song
            mixer.music.play()
        time.sleep(3)
        return finger

    def hardware_config(self, device):
        self.tracker.controlDevice(device)
        
backend = Backend()

# @app.route('/init_backend', methods=['POST'])
#def init_backend():
#    global backend
#    backend = Backend()  # This will reinitialize the backend
#    return jsonify({"message": "Backend initialized!"}), 200

#if __name__ == "__main__":
#    app.run(debug=True)
