% Grady Sullivan
% 11/11/19
% ECE 202 Fall 2019, MATLAB Project 2, Phase 2
% hitting a home run, with air resistance

% In this phase, drag force is added with a variable user-input "C".

clear
clf

% ----- define given information -----
x0 = 0;
y0 = 0;
theta = 32; % in degrees
tLand = 5.7; % in s
range = 446; % in ft
v0 = 112; % in mph

g = 10; % in m/s^2
m = .145; % in kg

% ----- characteristic calculations ------

mph2mps = 1609.344 / 3600; % convert mph to ft/s
deg2rad = pi /180; % convert degrees to radians
ft2m = 0.3048; % convert ft to m
m2ft = 100/2.54/12; % convert m to ft

v0 = v0 * mph2mps;
theta = 32 * deg2rad;
range = range * ft2m;

v0x = v0 * cos(theta); % x-component of v0
v0y = v0 * sin(theta); % y-component of v0

t_flight = 2 * v0y / g; % time for ball to reach ground, in s
r = v0x * t_flight; % range of baseball, in m

% ----- time array ----- %

tmin = 0;
tmax = t_flight; % time when ball lands
N = 2000; % # of intervals

t = linspace(tmin, tmax, 1+N);

% ----- analytical calculations ----- %

xt = x0 + v0x * t; % x(t), ax = 0 (no drag)
yt = y0 + v0y * t - 1/2 * g * t.^2; % y(t), ay = -g (no drag)

% ----- numeric solution -----

dt = (tmax - tmin) / N;

y = zeros(1, 1+N); % array for y(t)
x = zeros(1, 1+N); % array for x(t)

y(1) = y0; 
vy = v0y; % initialize vy
x(1) = x0;
vx = v0x; % initialize vx

% ----- Adding Drag ----- %

d = 0.074; % in meters - source: https://en.wikipedia.org/wiki/Baseball_(ball)
A = pi * (d / 2)^2; % cross sectional area m^2
C = input('Enter C value: '); % constant for baseball
p_air = 1.225; % in kg/m^3 - source: https://www.thoughtco.com/density-of-air-at-stp-607546

fdragcf = 1/2 * C * p_air * A; % common factor of drag force

for n = 1:N % stop at N
   
   v = (vx^2 + vy^2)^(1/2); % magnitude of velocity
   
   Fnetx = -fdragcf * vx * v; % net force in x direction
   Fnety = -fdragcf * v * vy - m * g; % net force in y direction
   
   ax = Fnetx / m; % acceleration in x direction
   ay = Fnety / m; % acceleration in y direction
   
   x(n+1) = x(n) + vx * dt + 1/2 * ax * dt^2; % value of x at each time interval
   y(n+1) = y(n) + vy * dt + 1/2 * ay * dt^2; % value of y at each time interval
   
   vy = vy + ay * dt; % velocity in x direction
   vx = vx + ax * dt; % velocity in y direction
   
end

% convert back to ft
x = x * m2ft; 
y = y * m2ft;
xt = xt * m2ft;
yt = yt * m2ft;

% ----- plotting ----- %

plot(xt, yt, x, y, 'LineWidth', 2) % plot analytical and numeric
grid on 

set(gca, 'FontSize', 20) % makes fonts size larger for axis

xlabel('x (ft)', 'FontSize', 22)
ylabel('y (ft)', 'FontSize', 22)

title({'ECE 202, Project 2 - Phase 2:',...
    'Trajectory of a baseball',...
    'Drag vs. No Drag'}, 'FontSize', 24)

legend("no drag (C = 0)"," drag (C = " + C + ")", 'Location', 'northeastoutside');

axis([0 750 0 130])

checkx = sum(abs(x - xt)) % should be close to zero
checky = sum(abs(y - yt)) % should be close to zero