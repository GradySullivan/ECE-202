% Grady Sullivan
% 9/18/19
% ECE 202 Fall 2019, MATLAB Exercise M4
% product of two sinusoids

clf
clear

% source: https://fl01000126.schoolwires.net/cms/lib/FL01000126/Centricity/Domain/261/Ch5_Section4.pdf

tmin = 0; tmax = 200; % variables for time to make more robust

tms = linspace (tmin, tmax, 401); % in ms
t = tms / 1000; % in sec

K = 12;
x = 60 * t - 1.8;
y = 100 * t + 1.2;

s1 = K * 1/2 * cos(x - y); % sinusoid 1
s2 = K * 1/2 * cos(x + y); % sinusoid 2
ft = K * cos(x) .* cos(y); %function

plot(tms, s1+s2, 'r', tms, s1, 'b', tms, s2, 'g', 'LineWidth', 3)
axis([-inf inf -15 21]) % ymax larger to fit legend
xlabel('time t (ms)')
ylabel('f(t)')
title('ECE 202 M5: Product of Two Sinusods writting as the Sum of Two Sinusoids')

% ----- check -----

check = ft - (s1 + s2); % should be close to zero
hold on
plot(tms, check, 'k', 'LineWidth', 2) % plots check as black line
legend('f(t) = 12 * cos(60t - 1.8) * cos(100t + 1.2)', 's1 = 1/2 * 12cos(160t - 0.6)', 's2 = 1/2 * 12cos(-40t - 3)','check: f(t) - (s1 + s2)')

subplot(2,
absSum = sum(abs(check)) % should be close to zero
% if the abs function was not included, negative values could "cancel out"
% positive values, making the check appear accurate when it is not





