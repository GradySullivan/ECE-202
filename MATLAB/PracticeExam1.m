% Grady Sullivan
% 10/01/19
% ECE 202 Fall 2019, Practice Exam 1
% Maclaurin Series

clf
clear

tmin = 1; 
tmax = 7;

t = linspace(tmin, tmax, 401); % 401 values for "t"

x = 2; %coefficient of first term
y = 3; %coefficient of second term
z = 4; %coefficient of third term

ft = x - y ./ t + z ./ t.^2; % equation

av = 2; % asymptotic value

plot(t, ft, t, av + t * 0, '--', 'LineWidth', 2) % plots function and asymptotic value with specifications listed in prompt
xlabel('time t (s)')
ylabel('f(t)')
title({"ECE 202 - Practice Midterm 1: Maclaurin Series",...
    sprintf("f(t) = %g - %g/t + %g/t^2", x, y, z)}) % allows for robust changes to changes
legend('f(t) = 2 - 3/t + 4/t^2', 'asymptotic value', 'Location', 'northeast') % legend in top right corner
axis([-inf inf 1.25 3.25]) % adjusts y axis
grid on

