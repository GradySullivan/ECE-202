% Grady Sullivan
% 11/17/19
% ECE 202 Fall 2019, MATLAB Project 1
% Power series expansion of Acos(wt)

clf
clear
format shortG

tmin = 0; tmax = .2; % variables for time to make more robust
N = 401; % number of intervals
t = linspace (tmin, tmax, N); % array for 't' values
tms = t * 1000; % time array in ms (for graphing)

A = 12; % amplitude
w = 40; % angular frequency, in rad/sec
terms = 6;
n = 0:2:(terms-1)*2; % creates array of n values (min, increment, max); becomes [0, 2, 4, 6, 8, 10]

an = A * w .^(n) .* (-1) .^(n/2) ./ factorial(n); % creates array of first six coefficients

coef = transpose([n   % table of n values 
                 an])

% ----- 6 Functions to plot (w/o for loop) ----- %

f1 = an(1) * t.^n(1); % 1st even term 
f2 = f1 + an(2) * t.^n(2); % 2nd even term 
f3 = f2 + an(3) * t.^n(3); % 3rd even term
f4 = f3 + an(4) * t.^n(4); % 4th even term
f5 = f4 + an(5) * t.^n(5); % 5th even term
f6 = f5 + an(6) * t.^n(6); % 6th even term

% ----- 6 Functions to plot (w/ for loop) ----- %

f = zeros(1, N); % array of zeros 1xN intervals

width = 0; % variable for width
for i = 1:terms %
    if i ~= terms % if i is not equal to terms variable
        width = 2; % "normal" width size
    else
        width = 6; % thicker if final line
    end
    f = f + an(i) * t.^n(i); % i even term
    plot(tms, f, 'LineWidth', width)
    hold on
end

%plot(tms, f1, tms, f2, tms, f3, tms, f4, tms, f5, 'LineWidth', 2) % plots first 6 non-zero terms of power series
%hold on
%plot(tms, f6, 'LineWidth', 4) % last function made with thicker line
%grid on

% ----- making the plot look "nice" ----- %

ax = gca;
ax.FontSize = 16; % change font size

xlabel('time t (ms)', 'FontSize', 20) % creates x label
ylabel('f(t)', 'FontSize', 20) % creates y label

title({['ECE 202 - Project 1 (Phase 4): Power Series Expansion of ', sprintf('f(t)=%gcos%gt', A, w)];...
    ['First ', num2str(terms), ' Non-Zero Terms of Power Series Expansion']}, 'FontSize', 24) % creates title
axis([-inf inf -A*1.25 A*1.25]) % factor of 1.25 for y limit to keep it the same as phase 2

leg = "up to n = " + n; % string for legend

legend(leg, 'Location', 'eastoutside', 'FontSize', 16)

% ----- check ----- %

check = sum(abs(f - f6)) % should equal zero

% The output looks the same as phase 3's output.