clc
clear all
close all
[y Fs]=audioread('myrecording.wav');
plot(y)
sound(y,Fs)
y_scaled=y*15;
figure, plot(y_scaled)
pause(5)
sound(y_scaled,Fs)
hist(y)

[x,Fs] = audioread('myRecording.wav');
t = (0:length(x)-1)/Fs;
x_noisy=x+0.02*rand(size(x));
d = designfilt('lowpassiir','FilterOrder',8,'HalfPowerFrequency',1000,'SampleRate',Fs);
    
x_filtered = filter(d,x_noisy);

subplot(3,1,1),plot(t,x),title('Original Audio');
subplot(3,1,2),plot(t,x_noisy),title('noisy Audio');
subplot(3,1,3),plot(t,x_filtered),title('filtered Audio');
