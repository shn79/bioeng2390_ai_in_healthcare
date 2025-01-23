% Create a 1D matrix of values 0 and 1
x = linspace(0, 1,100);
% Define the coefficients
b1 = 5;
b0 = 10;
% Compute y = b1 * x + b0
y = b1 * x + b0 + 0.5.*rand(1,100);
% Plot the results
figure;
plot(x, y, 'r*');
xlabel('x');
ylabel('y');
title('Linear Function of y = b1 * x + b0');
grid on;
%%
b=y';
A = [ones(100,1),x'];
solution = inv(A'*A)*(A'*b)
%
% solution =
%
%    10.0478
%     5.0001