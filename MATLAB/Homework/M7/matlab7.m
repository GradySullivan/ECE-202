% Grady Sullivan
% 11/3/19
% ECE 202 Fall 2019, MATLAB Exercise M7
% calculating current, voltage, and power absorbed by a charging inductor

clear

% ----- given information -----

V0 = 10; % in volts
L = 50; % in mH
R = 2; % in ohms
tau = L / R; % time constant in ms

% ----- set up time -----

N = 401; % number of intervals
tmin = 0; tmax = 10 * tau; % variables for time to make more robust
t = linspace (tmin, tmax, N+1); % in ms
dt = (tmax - tmin) / N; % in ms

% ----- calculations ----- %

iF = V0/R; % current, in amps, after very long time

i = iF * (1 - exp(-1 * t / tau)); % current, in amps
v = V0 * exp(-1 * t / tau); % voltage, in volts, across inductor
p = v .* i; % power absorbed by inductor, in watts

w = 1/2 * L / 1000 * iF^2 % energy stored by inductor, in Joules

% ----- plotting -----

% i(t)
subplot(3, 1, 1) % 3 rows, 1 column, top subplot
plot(t, i, 'r') % plot current

title({'ECE 202 M7: Current, Voltage, and Power', 'Absorbed by a Charging Inductor'}, ...
    'FontSize', 14)
text(75, 3, '$$ i(t)=5 \cdot (1-e^{{-t}\over{25}})  $$',...
    'Interpreter', 'latex', 'FontSize', 14)

ylabel('current (A)', 'FontSize', 8)

% v(t)
subplot(3,1,2) % middle subplot
plot(t, v, 'b') % plot voltage across inductor

text(75, 7, '$$ v(t)=10 \cdot e^{-t\over{25}} $$',...
    'Interpreter', 'latex', 'FontSize', 14)

ylabel('voltage (V)', 'FontSize', 8)

% p(t)
subplot(3,1,3) % bottom subplot
plot(t, p, 'g') % plot power absorbed by inductor

text(75, 10, '$$ p(t)=v(t) \cdot i(t) $$',...
    'Interpreter', 'latex', 'FontSize', 14)

xlabel('time (ms)', 'FontSize', 12)
ylabel('power absorbed (W)', 'FontSize', 8)
axis([-inf, inf, -1, 15])

% ----- check -----

energyAbs = dt / 1000 * sum(p) % in joules

checkTotalEnergy = w - energyAbs % difference
pctDifference = (w - energyAbs)/((energyAbs + w)/2) * 100 % percent difference
