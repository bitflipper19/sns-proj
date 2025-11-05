close all clc;

function y=Square(t, f, A)

    if nargin<3
        A=1;
    end
    if nargin<2
        f=1;
    end

    T = 1 / f;              
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

f=20;
t=linspace(-0.20, 0.20, 1e6);
A=1;

x=Square(t, f, A);
stairs(t, x);
xlabel('Time(s)');
ylabel('x(t)');
title('Square Wave - f=20Hz, Amp.=+-1');
grid on;