% Grady Sullivan
% 11/17/19
% ECE 202 Fall 2019, MATLAB Project 1
% Power series expansion of Acos(wt)

clf
clear
format shortG

tmin = 0; tmax = .2; % variables for time to make more robust
t = linspace (tmin, tmax, 401); % array for 't' values
tms = t * 1000; % time array in ms (for graphing)
n = 0:2:10; % creates array of n values (min, increment, max); becomes [0, 2, 4, 6, 8, 10]

an = 12 * 40 .^(n) .* (-1) .^(n/2) ./ factorial(n); % creates array of first six coefficients

coef = transpose([n   % table of n values 
                 an])

f1 = an(1) * t.^n(1); % 1st even term 
f2 = f1 + an(2) * t.^n(2); % 2nd even term 
f3 = f2 + an(3) * t.^n(3); % 3rd even term
f4 = f3 + an(4) * t.^n(4); % 4th even term
f5 = f4 + an(5) * t.^n(5); % 5th even term
f6 = f5 + an(6) * t.^n(6); % 6th even term


plot(tms, f1, tms, f2, tms, f3, tms, f4, tms, f5, 'LineWidth', 2) % plots first 6 non-zero terms of power series
hold on
plot(tms, f6, 'LineWidth', 4) % last function made with thicker line
grid on

ax = gca;
ax.FontSize = 16; % change font size

xlabel('time t (ms)', 'FontSize', 20) % creates x label
ylabel('f(t)', 'FontSize', 20) % creates y label
title({'ECE 202 - Project 1 (Phase 2): Power Series Expansion of f(t)=12cos(40t)','First 6 Non-Zero Terms of Power Series Expansion'}, 'FontSize', 24) % creates title
axis([-inf inf -15 15]) % changes y limits to -15 to 15

leg = "up to n = " + n; % string for legend

legend(leg, 'Location', 'eastoutside', 'FontSize', 16)


