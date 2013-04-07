CarDashboard
============


Base Idea: http://www.youtube.com/watch?v=Cmz1V-RlBWA

- Connect iPad via Bluetooth to original Radio
- Connect iPad via (????? WLAN ?) to Arduino to receiv signals from Car:
- - Ultrasonic sensors for parking assist system
- - - show distance to objects in App
- - display signal from x monitoring cams around the car
- - Maybe implement a parking mode with both (ultrasonic and cams)
- - Brightness sensors for automatic nightmode (http://www.youtube.com/watch?v=SnmVNHELYdI)


- Settings (in splitviewcontroller):
- - Enable Autonightmode (or manual) ([[UIScreen mainScreen] setBrightness:1.0];)
- - Password protection on Homebutton
- - Close menu automaticly
- - - after timeinterval

- Setup assistant

- Sensormonitoring / testing


Arduino
Digital (14)
 0: Ultra sonic front left 1
 1: Ultra sonic front left 2
 2: Ultra sonic front middle
 3: Ultra sonic front right 1
 4: Ultra sonic front right 2
 5: Ultra sonic back left 1
 6: Ultra sonic back left 2
 7: Ultra sonic back middle
 8: Ultra sonic back right 1
 9: Ultra sonic back right 2
10: 
11: 
12: 
13:  

Analog (6)
0: 
1: 
2: 
3: 
4: 
5: 