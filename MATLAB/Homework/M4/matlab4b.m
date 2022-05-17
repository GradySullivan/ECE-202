% Grady Sullivan
% 9/18/19
% ECE 202 Fall 2019, MATLAB Exercise M4
% part b: Shifted sinusoid

% g(t) = 4 * cos(3 * (t - 2))

clf
clear

tmin = -5; tmax = 5; % variables for time to make more robust

t = linspace (tmin, tmax, 401); % in s
g = 4 * cos(3 * (t - 2)); % function

plot(t, g, 'r','LineWidth', 3) % plots with thickness of 3
xlabel('time t (s)')
ylabel('g(t)')
title('ECE 202 M4 part b) - Shifted Sinusoid')

axis([-inf inf -6 6]) % bounds of graph