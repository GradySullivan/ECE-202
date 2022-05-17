% Grady Sullivan
% 10/03/19
% ECE 202 Fall 2019, Exam 1
% Sum as a Ratio of Polynomials

clf % clears figure
clear % clears variables

% ----- Givens -----

% two values to avoid (would result in undefined solution to functions) 
xmin = -4;
xmax = 3;

x = linspace(xmin+1, xmax-1, 401); % 401 values for "x"


f1 = 2 ./ (x - 3); % function 1
f2 = 7 ./ (x + 4); %function 2

% ----- Calculations ------

f = (9 * x - 13) ./ (x.^2 + x - 12); % f1 + f2

plot(x, f1, '--', x, f2, '--', x, f, 'LineWidth', 2) % plots all three functions
xlabel('x', 'FontSize', 14) % larger font size for readability
ylabel('f(x)', 'FontSize', 14) % larger font size for readability
title({'ECE 202: Exam 1',... % separated for clearer code
    'Sum as a Ratio of Polynomials',...
    'f(x) = 2/(x-3) + 7/(x+4)'}, 'FontSize', 16) % title font should be biggger
legend('f1(x) = 2 / (x - 3)', 'f2(x) = 7 / (x + 4)',...
    'f(x) = 2/(x-3) + 7/(x+4)', 'Location', 'northeast') % legend in top right corner
axis([-3 2 -2 8])
grid on 
hold on % doesn't let next plot overwrite existing info

% ----- Checks ---

check = f - (f1 + f2); % should be close to zero at every value of x
plot(x, check, 'LineWidth', 2) % plot check function
legend('f1(x) = 2 / (x - 3)', 'f2(x) = 7 / (x + 4)',...
    'f(x) = 2/(x-3) + 7/(x+4)', 'check: f(x) - (f1(x) + f2(x)) ', 'Location', 'northeast') % reused to add checking part of legend

checkingFunction = sum(abs(check)) % should be close to zero

% We need to avoid these two values of x, because the undefined values
% could cause strain
