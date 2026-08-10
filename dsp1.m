clc;
clear;
close all;

Fs = 10000;       % Sampling frequency
Fp = 1000;        % Passband frequency
Fst = 1500;       % Stopband frequency

% Calculate minimum Butterworth filter order
[N, Wn] = buttord(Fp/(Fs/2), Fst/(Fs/2), 1, 60);

% Design Butterworth low-pass filter
[b, a] = butter(N, Wn);

% Frequency response
figure;
freqz(b, a);
title('Frequency Response of Butterworth Filter');

% Impulse response
figure;
[h, n] = impz(b, a, 50);
stem(n, h);
title('Impulse Response');
xlabel('Samples');
ylabel('Amplitude');
grid on;

% Step response
figure;
stepz(b, a);
title('Step Response');
grid on;

% Pole-zero plot
figure;
zplane(b, a);
title('Pole-Zero Plot');
grid on;

% Display filter specifications
fprintf('Minimum Filter Order (N) = %d\n', N);
fprintf('Cutoff Frequency (Wn) = %.4f\n', Wn);