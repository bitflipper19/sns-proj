%{
Harmonic spectrum is the plot between Amplitude of a certain
harmonic v/s frequency*k

frequency = k*FundamentalFrequency
Amplitude = 4*A/k*pi
%}

clc; clear; close all;

A=1;
f=20;

N = 5;
freqs = zeros(1, N);
amps = zeros(1, N);
for i = 1:N
    k = 2*i - 1;
    freqs(i) = k*f;
    amps(i) = (4*A) / (pi * k);
end

figure;
stem(freqs, amps, 'filled', 'LineWidth', 1.5);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Magnitude Spectrum of First 5 Harmonics');
grid on;
