% Grady Sullivan
% 10/18/19
% Class 20
% hitting a baseball

clear
clf

% ----- define given information -----

x0 = 0; y0 = 0; % because we really don't care where it starts
v0mph = 105; % exit velocity, in mph, from mlb.stat
phi0deg = 24.9; % launch angle, in degrees, also from mlb.stat
g = 10; % gravitational field strength in N/kg, (1 N/kg = 1 m/s)

% ----- set up some useful variables -----

mph2mps = 5280 * 12 * 2.54 / 100 /3600; % mph to mps
deg2rad = pi() / 180;

v0 = v0mph * mph2mps; % exit velocity, in m/s (no units in variable names)
phi0 = phi0deg * deg2rad; % launch angle in rad (no units in name)

v0x = v0 * cos(phi0); % x-component of v0
v0y = v0 * sin(phi0); % y-component of v0

% ----- compute useful characteristics of the trajectory ----- 

tH = v0y / g; % time to reach max height H
t_land = 2 * tH % time to land, in m

H = v0y^2/2/g % max height, in m
R = v0x * t_land % range of baseball (where it lands) in m

% ----- set up time array and compute x(t) and y(t) -----

tmin = 0; tmax = t_land; % stop when ball lands
N = 2000; % intervals
t = linspace(tmin, tmax, 1+N);

xt = x0 +v0x * t; % x(t), ax = 0 (no drag)
yt = y0 +v0y * t - 1/2 * g * t.^2; % y(t), ay = -g (no drag)

plot(xt, yt, 'LineWidth', 2)
grid on 

xlabel('x (m)', 'FontSize', 18)
ylabel('y (m)', 'FontSize', 18)

title({'ECE 202, Class 20:',...
    'Trajectory of a baseball, no drag'}, 'FontSize', 24)

% ----- add numerical solution -----

dt = (tmax - tmin) / N;

y = zeros(1, 1+N); % initialize y(t)

y1 = y0;
vy = v0y; % initialize vy

for n = 1:N % stop at N
   
    % ay = -g
    
    y(n+1) = y(n) + vy * dt - 1/2 * g * dt^2;
    vy = vy - g * dt; % vy(n+1) = vy(n) + ay * dt
    
    % ----- plot trajectory -----
end

plot(xt, yt, 'LineWidth', 2)






