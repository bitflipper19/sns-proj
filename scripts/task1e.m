clc; clear; close all;

f = 20;                  
A = 1;                   
t = linspace(0, 0.15, 1e6);

x = Square(t, f, A);


figure(); 
stairs(t, x, 'r', 'LineWidth', 1.2, 'DisplayName', 'Square Wave');
hold on; grid on;

N = 50;  
y = zeros(size(t));

for i = 1:N
    k = 2*i - 1;
    y = y + (1/k) * sin(2*pi*k*f*t);
end
y = (4*A/pi) * y;

plot(t, y, 'c', 'LineWidth', 1.2, 'DisplayName', sprintf('N = %d', N));

xlabel('Time (s)');
ylabel('Amplitude');
title(sprintf('Square Wave vs Fourier Series (N = %d)', N));
legend show;

T = 1/f;
zoom_center = 0.025;          
zoom_width = 0.002;         
xlim([zoom_center - zoom_width, zoom_center + zoom_width]);
ylim([-1.5, 1.5]);

xline(zoom_center, '--k', 'Discontinuity', 'LabelOrientation', 'horizontal');

hold off;

function y = Square(t, f, A)
    if nargin < 3, A = 1; end
    if nargin < 2, f = 1; end
    T = 1/f;
    y = zeros(size(t));
    for i = 1:length(t)
        phase = mod(t(i), T);
        if phase < T/2
            y(i) = A;
        else
            y(i) = -A;
        end
    end
end
