clear all
clear
clc

mypi = raspi();
myCam = cameraboard(mypi,'Resolution','640x480');

configurePin(mypi,20,'DigitalOutput');  %LED
% configurePin(mypi,16,'DigitalOutput');  %Motor
% configurePin(mypi,21,'DigitalOutput');  %Elektro mýknatýs
% configurePin(mypi,12,'DigitalOutput');  %Lazer

% writeDigitalPin(mypi, 12,1);
% writeDigitalPin(mypi, 16,1);
writeDigitalPin(mypi, 20,1);
% writeDigitalPin(mypi, 21,1);


while(1)
    
mySnap = snapshot(myCam);
imshow(mySnap);

end