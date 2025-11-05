% Fourier Series of a square wave is as follows:-
%{
x(t)=(4/pi)*(sum i, i = [1, ... , N])(1/2i-1)sin(2pi(2i-1)ft)
%}

clc; clear; close all;

f=20;
t=linspace(0, 0.15, 1e6);
A=1;


N = [1, 3, 5, 15, 50];

for n = N
% n=N(4);
    y = zeros(size(t));
    for i = 1:n
        k = 2*i - 1;
        y = y + (1/k) * sin(2*pi*k*f*t);
    end
    y = (4*A/pi) * y;
    plot(t, y, 'DisplayName', sprintf('N = %d', n));
    hold on;
end

legend('N=1', 'N=3', 'N=5', 'N=15', 'N=50');
xlabel('Time (s)');
ylabel('Amplitude');
title('Fourier Series Approximation of Square Wave');
hold off;
grid on;