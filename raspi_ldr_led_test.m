clear all
clear
clc

mypi = raspi();
  
while (1)


configurePin(mypi,26,'DigitalOutput'); 

    writeDigitalPin(mypi, 26,1);

end
