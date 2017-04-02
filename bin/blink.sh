#!/bin/bash

LED_PIN=1

while true
do
/usr/bin/gpioctl dirout-high $LED_PIN 
/usr/bin/sleep 0.01
/usr/bin/gpioctl dirout-low $LED_PIN
/usr/bin/sleep 0.01
done
