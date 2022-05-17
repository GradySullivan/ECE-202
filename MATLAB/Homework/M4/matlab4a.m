% Grady Sullivan
% 9/18/19
% ECE 202 Fall 2019, MATLAB Exercise M4
% part a: Truncated power series

% f(t) = 1 + t / 2 - t^2 / 3 ; from t = 0 to t = 6s

clf
clear

tmin = 0; tmax = 6; % variables for time to make more robust

t = linspace (tmin,tmax,401); % in s
f = 1 + t / 2 - t.^2 / 3; % function

plot(t, f, 'k','LineWidth', 3) % plots with thickness of 3
xlabel('time t (s)')
ylabel('f(t)')
title('ECE 202 M4 part a) - Truncated Power Series')