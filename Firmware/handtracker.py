#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Sep  8 23:08:39 2023

@author: Taru
"""

################################# Imports #####################################
import mediapipe as mp
import cv2
import numpy as np
import serial
import time

################################# Code ######################################

cap = cv2.VideoCapture(0) # object for video capturing (default is 0 - built-in-webcam)
mpHands = mp.solutions.hands # hands object using hand tracking module
hands = mpHands.Hands() # initialize hand tracking model
mpDraw = mp.solutions.drawing_utils # imports utility for drawing landmarks and connections on images

class HandTracker:
    def __init__(self):
        # Set up serial connection
        time.sleep(2)  # Give some time for the connection to establish
    
    def connectToDevice(self):
        curr_finger = 0 # current number of fingers held up
        curr_count = 0 # check if same finger has been held up for an extended amount of time
        finger_detect = False
        
        while not finger_detect:
            success, image = cap.read() # captures frame from video feed and stores it in the variable "image"
            imageRGB = cv2.cvtColor(image, cv2.COLOR_BGR2RGB) # converts to RGBB format
            cv2.imshow("Output", imageRGB) # displays RGB image
            results = hands.process(imageRGB) # processes RGB image and returns info about detected hand landmarks
            
            # checking whether a hand is detected
            if results.multi_hand_landmarks: # checks if there are any detected hands in the frame
                for handLms in results.multi_hand_landmarks: # working with each hand
                    for id, lm in enumerate(handLms.landmark): # iterates over landmarks of a detected hand
                        h, w, c = image.shape # height, width and color
                        cx, cy = int(lm.x * w), int(lm.y * h) # pixel coordinates
                        if id == 8:
                            cv2.circle(image, (cx, cy), 25, (255, 0, 0), cv2.FILLED) # circle for index
                        if id == 12:
                            cv2.circle(image, (cx, cy), 25, (0, 255, 0), cv2.FILLED) # circle for middle
                        if id == 16:
                            cv2.circle(image, (cx, cy), 25, (0, 0, 255), cv2.FILLED) # circle for fourth
                        if id == 20 :
                            cv2.circle(image, (cx, cy), 25, (255, 0, 255), cv2.FILLED) # circle for pinki

                    mpDraw.draw_landmarks(image, handLms, mpHands.HAND_CONNECTIONS) # draws connections
                    
                    
                    count = self.count_helper(handLms)
                    
                    cv2.putText(image, "number" + str(count), (50,50), cv2.FONT_HERSHEY_SIMPLEX, 2, (0,0,0), 2, cv2.LINE_AA)
                    # get current number of fingers
                    if (curr_finger == 0 or curr_finger != count):
                        curr_finger = count
                        curr_count = 1;
                    else:
                        curr_count += 1;
                        
                    # check if user has held up same finger for two seconds
                    if (curr_count > 23):
                        finger_detect = True
                    
                    cv2.imshow("Output", image) # displays image
                    cv2.waitKey(1)
        
        print(curr_finger)
        return curr_finger # number of fingers that user has put up
        
    
    def controlDevice(self, device_name):
        curr_count = 0
        stop_sign = False
        
        while not stop_sign:
            success, image = cap.read() # captures frame from video feed and stores it in the variable "image"
            imageRGB = cv2.cvtColor(image, cv2.COLOR_BGR2RGB) # converts to RGBB format
            cv2.imshow("Output", imageRGB) # displays RGB image
            results = hands.process(imageRGB) # processes RGB image and returns info about detected hand landmarks
            
            # checking whether a hand is detected
            if results.multi_hand_landmarks: # checks if there are any detected hands in the frame
                for handLms in results.multi_hand_landmarks: # working with each hand
                    for id, lm in enumerate(handLms.landmark): # iterates over landmarks of a detected hand
                        h, w, c = image.shape # height, width and color
                        cx, cy = int(lm.x * w), int(lm.y * h) # pixel coordinates
                        if id == 8:
                            cv2.circle(image, (cx, cy), 25, (255, 0, 0), cv2.FILLED) # circle for index
                        if id == 12:
                            cv2.circle(image, (cx, cy), 25, (0, 255, 0), cv2.FILLED) # circle for middle
                        if id == 16:
                            cv2.circle(image, (cx, cy), 25, (0, 0, 255), cv2.FILLED) # circle for fourth
                        if id == 20 :
                            cv2.circle(image, (cx, cy), 25, (255, 0, 255), cv2.FILLED) # circle for pinki

                    mpDraw.draw_landmarks(image, handLms, mpHands.HAND_CONNECTIONS) # draws connections
                
                    count = self.count_helper(handLms)
                        
                    # check number of fingers
                    if (count == 0):
                        curr_count += 1
                    if (count == 2):
                        self.toggle_off(device_name)
                        curr_count = 0
                        print(2)
                    if (count == 3):
                        self.toggle_increase(device_name)
                        curr_count = 0
                        print(3)
                    if (count == 4):
                        self.toggle_decrease(device_name)
                        curr_count = 0
                        print(4)
                    elif (count == 1):
                        self.toggle_on(device_name)
                        curr_count = 0
                        print(1)
                        
                    # check if user has stopped giving input
                    if (curr_count > 23 and count == 0):
                        print("yay")
                        stop_sign = True
                    
                    cv2.imshow("Output", image) # displays image
                    cv2.waitKey(3)
                    
        return True
    
    def count_helper(self, handLms):
        count = 0
        # check if second finger is pointed upwards
        index_finger_tip = handLms.landmark[8]
        index_finger_base = handLms.landmark[5]
        if index_finger_tip.y + 0.1 < index_finger_base.y:
            count += 1
        
        # check if third finger is pointed upwards
        middle_finger_tip = handLms.landmark[12]
        middle_finger_base = handLms.landmark[9]
        if middle_finger_tip.y + 0.1 < middle_finger_base.y:
            count += 1
        
        # check if fourth finger is pointed upwards
        fourth_finger_tip = handLms.landmark[16]
        fourth_finger_base = handLms.landmark[13]
        if fourth_finger_tip.y + 0.1 < fourth_finger_base.y:
            count += 1
        
        # check if fifth finger is pointed upwards
        pinky_finger_tip = handLms.landmark[20]
        pinky_finger_base = handLms.landmark[17]
        if pinky_finger_tip.y + 0.1 < pinky_finger_base.y:
            count += 1
            
        return count
        
    
    def toggle_off(self, device_name):
        self.send_to_arduino(device_name, 2)
    
    def toggle_on(self, device_name):
        self.send_to_arduino(device_name, 1)
    
    # increase by five percent
    def toggle_increase(self, device_name):
        self.send_to_arduino(device_name, 3)
    
    # decrease by five percent
    def toggle_decrease(self, device_name):
        self.send_to_arduino(device_name, 4)
    
    def send_to_arduino(self, device_name, control_var):
        data_to_send = bytes([device_name * 10 + control_var])
        print(device_name * 10 + control_var)
        self.ser.write(data_to_send)
        
handtracker = HandTracker()
handtracker.connectToDevice()