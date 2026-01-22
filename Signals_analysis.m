clc; clear; close all;

% Generating basic signals

t = 0:0.001:1;

x1 = sin(2*pi*5*t);          % 5 Hz sine wave
x2 = square(2*pi*2*t);       % 2 Hz square wave

figure;
plot(t, x1);
title('Sine Wave (5 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

figure;
plot(t, x2);
title('Square Wave (2 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Linear convolution

x = [1 2 3];
h = [1 1 1];

y = conv(x, h);

figure;
stem(y);
title('Linear Convolution Result');
xlabel('n');
ylabel('Amplitude');
grid on;

% Circular convolution

N = max(length(x), length(h));
x_pad = [x zeros(1, N-length(x))];
h_pad = [h zeros(1, N-length(h))];

Y = ifft(fft(x_pad).*fft(h_pad));

figure;
stem(real(Y));
title('Circular Convolution Result');
xlabel('n');
ylabel('Amplitude');
grid on;

% FFT

Fs = 1000;                 % Sampling frequency (Hz)
t = 0:1/Fs:1;              % Time from 0 to 1 second
f = 5;                     % Signal frequency (Hz)

x = sin(2*pi*f*t);         % Sine wave

X = fft(x);                % FFT
N = length(X);
f_axis = (0:N-1)*(Fs/N);   % Frequency axis

figure;
plot(f_axis, abs(X));
title('Frequency Spectrum using FFT');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

% Sampling effect

t1 = 0:0.001:1;
t2 = 0:0.02:1;

x1 = sin(2*pi*5*t1);
x2 = sin(2*pi*5*t2);

figure;
plot(t1, x1); hold on;
stem(t2, x2);
title('Sampling Effect');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
