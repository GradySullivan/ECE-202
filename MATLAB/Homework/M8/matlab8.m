% Grady Sullivan
% 11/3/19
% ECE 202 Fall 2019, MATLAB Exercise M8
% partial fraction expansion

clear

% ----- set up x values -----

prompt = 'Insert value of n: '; % string that appears for input
n = input(prompt); % user-input for 'n' 
xmin = -4; xmax = 4; % min and max x values, as requested from prompt
x = linspace (xmin, xmax, n); % array of x values

% ----- givens -----

D1 = x - 1; % denominator of first part of partial fraction
D2 = x - 2; % denominator of second part of partial fraction
D3 = x - 3; % denominator of third part of partial fraction
R = (6 + 5 .* x + 4 * x.^2) ./ (D1 .* D2 .* D3); % original expression

% ----- calculations -----

A = [1, 1, 1;... % coefficeients of x^2
    -5, -4, -3;... % coefficients of x
    6, 3, 2]; % coefficients of constants

b = [4; 5; 6]; % coefficents of sum of x^2 terms, x terms, and constant terms, respectively

c = A^(-1) * b % to calculate c1, c2, and c3 in an array

R1 =  c(1) ./ D1; % R1(x)
R2 =  c(2) ./ D2; % R2(x)
R3 =  c(3) ./ D3; % R3(x)

check = sum(abs(R-R1-R2-R3)) % one line check, should be close to zero

% The check works only when no values of x in the array are equal to the
% vertical asymptotes, which are when x = 1, 2, 3. When the value "n" is
% inputed to determine how many intervals there will be, if any of the x
% values land on an asymptote, the test will fail.