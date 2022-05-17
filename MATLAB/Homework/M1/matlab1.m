% Grady Sullivan
% 9/8/19
% ECE 202 Fall 2019, MATLAB Exercise M1
% finding the final velocities of two carts

clear %clears all variables

% ----- given information -----

v1i = 40; %velocity of cart #1, in cm/s
v2i = -30; %velocity of cart #2, in cm/s
m1 = 250; %mass of cart #1, in g
m2 = 150; %mass of cart #2, in g

% ----- calculations -----

%Source: https://academo.org/demos/one-dimensional-elastic-collisions/

mt = m1 + m2; % total mass of m1 + m2

v1f = (2*m2*v2i+v1i*(m1-m2))/mt % final velocity of cart 1, in cm/s

v2f = (2*m1*v1i+v2i*(m2-m1))/mt % final velocity of cart 2, in cm/s

% ----- check answers -----

dp = (m1*v1i+m2*v2i) - (m1*v1f+m2*v2f) % conservation of momentum, should equal 0

dKE = ((1/2)*m1*v1i^2 + (1/2)*m2*v2i^2) - ((1/2)*m1*v1f^2 + (1/2)*m2*v2f^2) % conservation of energy, should equal 0
