% Grady Sullivan
% 9/15/19
% ECE 202 Fall 2019, MATLAB Exercise M3
% finding the total number of collisions and final velocities

clear

% ----- given information -----

m = [240 120 360]; % mass of carts, in g
vi = [30 15 -45]; % velocity of carts, in cm/s

% ----- calculations -----

%Source: https://academo.org/demos/one-dimensional-elastic-collisions/

m12 = m(1) + m(2); % mass of carts 1 and 2
m23 = m(2) + m(3); % mass of carts 2 and 3

pt = sum(m .* vi); % total momentum

Et = sum(1/2 * m .* vi .^2); % total energy

% Collision A

%vA = vi % creates array for velocities after collision A

vA(2) = (2 * m(3) * vi(3) + vi(2) * (m(2) - m(3))) / m23; % velocity of cart 2, in cm/s
vA(3) = (2 * m(2) * vi(2) + vi(3) * (m(3) - m(2))) / m23; % velocity of cart 3, in cm/s 

vA = [vi(1) vA(2) vA(3)]

% check Collision A

checkMomentumA = pt - sum(m .* vA) % should equal zero
checkEnergyA = Et - sum(1/2 * m .* vA .^2) % should equal zero

% Collision B

vB1 = (2 * m(2) * vA(2) + vA(1) * (m(1) - m(2))) / m12; % velocity of cart 1, in cm/s 
vB2 = (2 * m(1) * vA(1) + vA(2) * (m(2) - m(1))) / m12; % velocity of cart 2, in cm/s

vB = [vB1 vB2 vA(3)]

% check Collision B

checkMomentumB = pt - sum(m .* vB) % should equal zero
checkEnergyB = Et - sum(1/2 * m .* vB .^2) % should equal zero

% Collision C

vC2 = (2 * m(3) * vB(3) + vB(2) * (m(2) - m(3))) / m23; % velocity of cart 2, in cm/s
vC3 = (2 * m(2) * vB(2) + vB(3) * (m(3) - m(2))) / m23; % velocity of cart 3, in cm/s 

vC = [vB(1) vC2 vC3]

% check Collision C

checkMomentumC = pt - sum(m .* vC) % should equal zero
checkEnergyC = Et - sum(1/2 * m .* vC .^2) % should equal zero

% Collision D

vD1 = (2 * m(2) * vC(2) + vC(1) * (m(1) - m(2))) / m12; % velocity of cart 1, in cm/s 
vD2 = (2 * m(1) * vC(1) + vC(2) * (m(2) - m(1))) / m12; % velocity of cart 2, in cm/s

vD = [vD1 vD2 vC(3)]

% check Collision D

checkMomentumD = pt - sum(m .* vD) % should equal zero
checkEnergyD = Et - sum(1/2 * m .* vD .^2) % should equal zero

% a) There will be a total of 4 collisions. The output of vD (velocity
%after collision D) is [-50 -35 25]. This means that carts 1 and 2 are
%moving to the left, but cart 2 will never catch up with cart 1. Cart 3
%will also not collide with either one again as it is movign in the opposite
%direction