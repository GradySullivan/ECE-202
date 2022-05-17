% Grady Sullivan
% 11/11/19
% ECE 202 Fall 2019, MATLAB Project 2, Phase 1
% hitting a home run

% for this phase, we are calculating the baseball projectory, without
% taking drag into account

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
deg2rad = pi() /180; % convert degrees to radians
ft2m = 0.3048; % convert ft to m
m2ft = 3.28084; % convert m to ft

v0 = v0 * mph2mps;
theta = 32 * deg2rad;
range = range * ft2m;

v0x = v0 * cos(theta); % x-component of v0
v0y = v0 * sin(theta); % y-component of v0

t_flight = 2 * v0y / g; % time for ball to reach ground, in s
r = v0x * t_flight; % range of baseball, in m

% ----- time array -----

tmin = 0;
tmax = t_flight; % time when ball lands
N = 2000; % # of intervals

t = linspace(tmin, tmax, 1+N);

% ----- analytical calculations -----

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

for n = 1:N % stop at N
   
   Fnetx = m * 0; % net force in x direction
   Fnety = -1 * m * g; % net force in y direction
   
   ax = Fnetx/m;
   ay = Fnety/m;
   
   x(n+1) = x(n) + vx * dt + 1/2 * ax * dt^2; % value of y at each time interval
   y(n+1) = y(n) + vy * dt + 1/2 * ay * dt^2; % value of y at each time interval
   
   vy = vy + ay * dt; 
   vx = vx + ax * dt;
   
end

% ----- plotting ----- %

x = x * m2ft; % convert back to ft
y = y * m2ft;
xt = xt * m2ft;
yt = yt * m2ft;

plot(xt, yt, x, y, 'LineWidth', 2) % plot analytical and numeric
grid on 

set(gca, 'FontSize', 20) % makes fonts size larger for axis

xlabel('x (ft)', 'FontSize', 18)
ylabel('y (ft)', 'FontSize', 18)

title({'ECE 202, Project 2 - Phase 1:',...
    'Trajectory of a baseball',...
    'Analytic vs Numeric Solution (No Drag)'}, 'FontSize', 24)

legend({'analytic (behind numeric)', ...
    'numeric'}, 'Location', 'northeastoutside', 'FontSize', 18)

axis([-inf 750 -inf 130])

checkx = sum(abs(x - xt)) % should be close to zero
checky = sum(abs(y - yt)) % should be close to zero