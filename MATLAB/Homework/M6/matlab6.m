% Grady Sullivan
% 10/31/19
% ECE 202 Fall 2019, MATLAB Exercise M6
% three carts colliding, using user-defined functions

clear

% ----- given information -----

m = [240 120 360]; % mass of carts, in g
vi = [30 15 -45]; % velocity of carts, in cm/s

% ----- calculations -----

%Source: https://academo.org/demos/one-dimensional-elastic-collisions/

pt = sum(m .* vi); % total momentum

Et = sum(1/2 * m .* vi .^2); % total energy

% Collision A (including user defined functions)

vA(2) = finalVelocity(m(2), vi(2), m(3), vi(3));
vA(3) = finalVelocity(m(3), vi(3), m(2), vi(2)); % velocity of cart 3, in cm/s 

vA(1) = vi(1)

% check Collision A

checkMomentumA = pt - sum(m .* vA) % should equal zero
checkEnergyA = Et - sum(1/2 * m .* vA .^2) % should equal zero

% Collision B (including user defined functions)

vB(1) = finalVelocity(m(1), vA(1), m(2), vA(2)); % velocity of cart 1, in cm/s 
vB(2) = finalVelocity(m(2), vA(2), m(1), vA(1)); % velocity of cart 2, in cm/s

vB(3) = vA(3)

% check Collision B

checkMomentumB = pt - sum(m .* vB) % should equal zero
checkEnergyB = Et - sum(1/2 * m .* vB .^2) % should equal zero

% Collision C (including user defined functions)

vC(2) = finalVelocity(m(2), vB(2), m(3), vB(3)); % velocity of cart 2, in cm/s
vC(3) = finalVelocity(m(3), vB(3), m(2), vB(2)); % velocity of cart 3, in cm/s 

vC(1) = vB(1)

% check Collision C

checkMomentumC = pt - sum(m .* vC) % should equal zero
checkEnergyC = Et - sum(1/2 * m .* vC .^2) % should equal zero

% Collision D (including user defined functions)

vD(1) = finalVelocity(m(1), vC(1), m(2), vC(2)); % velocity of cart 1, in cm/s 
vD(2) = finalVelocity(m(2), vC(2), m(1), vC(1)); % velocity of cart 2, in cm/s

vD(3) = vC(3)

% check Collision D (including user defined functions)

checkMomentumD = pt - sum(m .* vD) % should equal zero
checkEnergyD = Et - sum(1/2 * m .* vD .^2) % should equal zero

% ----- functions -----

function vf = finalVelocity(m1, v1i, m2, v2i)
    vf = 1/(m1+m2) * ((m1 - m2) * v1i + 2 * m2 * v2i); % pulled out common factor (1/(m1+m2))
end

% a) There will be a total of 4 collisions. The output of vD (velocity
%after collision D) is [-50 -35 25]. This means that carts 1 and 2 are
%moving to the left, but cart 2 will never catch up with cart 1. Cart 3
%will also not collide with either one again as it is moving in the opposite
%direction
