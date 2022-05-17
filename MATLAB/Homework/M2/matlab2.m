% Grady Sullivan
% 9/11/19
% ECE 202 Fall 2019, MATLAB Exercise M2
% finding the mass of cart #1 and the final velocity of cart #2

clear %clears all variables

% ----- given information -----

v1i = 30; %velocity of cart #1, in cm/s
v2i = -30; %velocity of cart #2, in cm/s
m2 = 150; %mass of cart #2, in g
v1f = 0; %final velocity of cart #1, in cm/s

% ----- calculations -----

%Source: https://academo.org/demos/one-dimensional-elastic-collisions/

m1 = (m2 * (2 * v2i - v1i - v1f)) / (v1f - v1i) % mass of cart 1 (part c)

mt = m1 + m2; % total mass of m1 + m2

v2f = (2*m1*v1i+v2i*(m2-m1))/mt % final velocity of cart 2, in cm/s (part of part f)

% ----- check -----

% part e

% check momentum

p1i = m1 * v1i; % cart 1 initial momentum
p2i = m2 * v2i; % cart 2 initial momentum
p1f = m1 * v1f; % cart 1 final momentum
p2f = m2 * v2f; % cart 2 final momentum
dp = p1i + p2i - p1f - p2f  % conservation of momentum, should equal 0


% check energy

KE1i = (1/2)*m1*v1i^2; % cart 1 KE initial
KE2i = (1/2)*m2*v2i^2; % cart 2 KE initial
KE1f = (1/2)*m1*v1f^2; % cart 1 KE final
KE2f = (1/2)*m2*v2f^2; % cart 2 KE final

dKE = KE1i + KE2i - KE1f - KE2f % conservation of energy, should equal 0

% ----- equations from M1 -----

% part f

v1f = (2*m2*v2i+v1i*(m1-m2))/mt % final velocity of cart 1, in cm/s

% The final speed of cart #1 is zero; thus, the design criterion is met.