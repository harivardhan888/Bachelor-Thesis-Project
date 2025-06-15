clc;
clear;
close all;

% Read data
A = xlsread('btp.xlsx', 1);
B = xlsread('btp.xlsx', 2);
C = xlsread('btp.xlsx', 3);

% Frequencies and wavelength
freq_in_GHZ = A(82:115,1);
wavelength = 1 ./ freq_in_GHZ;

% Ellipse parameters
a = 1;
b1 = 0.25;
b2 = 0.5;
b3 = 0.75;

% Areas
area1 = pi*a*b1;
area2 = pi*a*b2;
area3 = pi*a*b3;

% Circumferences
circumference1 = 2*pi*sqrt((a^2 + b1^2)/2);
circumference2 = 2*pi*sqrt((a^2 + b2^2)/2);
circumference3 = 2*pi*sqrt((a^2 + b3^2)/2);

% Sheet A: b = 0.25
theta_0_b1 = A(82:115,2);
theta_15_b1 = A(82:115,3);
theta_30_b1 = A(82:115,4);
theta_45_b1 = A(82:115,5);
theta_60_b1 = A(82:115,6);
theta_75_b1 = A(82:115,7);
theta_90_b1 = A(82:115,8);

% Sheet B: b = 0.5
theta_0_b2 = B(82:115,2);
theta_15_b2 = B(82:115,3);
theta_30_b2 = B(82:115,4);
theta_45_b2 = B(82:115,5);
theta_60_b2 = B(82:115,6);
theta_75_b2 = B(82:115,7);
theta_90_b2 = B(82:115,8);

% Sheet C: b = 0.75
theta_0_b3 = C(82:115,2);
theta_15_b3 = C(82:115,3);
theta_30_b3 = C(82:115,4);
theta_45_b3 = C(82:115,5);
theta_60_b3 = C(82:115,6);
theta_75_b3 = C(82:115,7);
theta_90_b3 = C(82:115,8);

x_axis1 = circumference1 ./ wavelength;
x_axis2 = circumference2 ./ wavelength;
x_axis3 = circumference3 ./ wavelength;

y_0_b1 = (theta_0_b1 .* wavelength.^2) / area1;
y_15_b1 = (theta_15_b1 .* wavelength.^2) / area1;
y_30_b1 = (theta_30_b1 .* wavelength.^2) / area1;
y_45_b1 = (theta_45_b1 .* wavelength.^2) / area1;
y_60_b1 = (theta_60_b1 .* wavelength.^2) / area1;
y_75_b1 = (theta_75_b1 .* wavelength.^2) / area1;
y_90_b1 = (theta_90_b1 .* wavelength.^2) / area1;

y_0_b2 = (theta_0_b2 .* wavelength.^2) / area2;
y_15_b2 = (theta_15_b2 .* wavelength.^2) / area2;
y_30_b2 = (theta_30_b2 .* wavelength.^2) / area2;
y_45_b2 = (theta_45_b2 .* wavelength.^2) / area2;
y_60_b2 = (theta_60_b2 .* wavelength.^2) / area2;
y_75_b2 = (theta_75_b2 .* wavelength.^2) / area2;
y_90_b2 = (theta_90_b2 .* wavelength.^2) / area2;

y_0_b3 = (theta_0_b3 .* wavelength.^2) / area3;
y_15_b3 = (theta_15_b3 .* wavelength.^2) / area3;
y_30_b3 = (theta_30_b3 .* wavelength.^2) / area3;
y_45_b3 = (theta_45_b3 .* wavelength.^2) / area3;
y_60_b3 = (theta_60_b3 .* wavelength.^2) / area3;
y_75_b3 = (theta_75_b3 .* wavelength.^2) / area3;
y_90_b3 = (theta_90_b3 .* wavelength.^2) / area3;

semilogx(x_axis1, y_0_b1, '-r'); hold on;
semilogx(x_axis1, y_15_b1, '--r');
semilogx(x_axis1, y_30_b1, ':r');
semilogx(x_axis1, y_45_b1, '-.r');
semilogx(x_axis1, y_60_b1, '-r*');
semilogx(x_axis1, y_75_b1, '--r*');
semilogx(x_axis1, y_90_b1, ':r*');

semilogx(x_axis2, y_0_b2, '-b');
semilogx(x_axis2, y_15_b2, '--b');
semilogx(x_axis2, y_30_b2, ':b');
semilogx(x_axis2, y_45_b2, '-.b');
semilogx(x_axis2, y_60_b2, '-bo');
semilogx(x_axis2, y_75_b2, '--bo');
semilogx(x_axis2, y_90_b2, ':bo');

semilogx(x_axis3, y_0_b3, '-g');
semilogx(x_axis3, y_15_b3, '--g');
semilogx(x_axis3, y_30_b3, ':g');
semilogx(x_axis3, y_45_b3, '-.g');
semilogx(x_axis3, y_60_b3, '-gs');
semilogx(x_axis3, y_75_b3, '--gs');
semilogx(x_axis3, y_90_b3, ':gs');

% Plot details
xlabel('Circumference / Wavelength');
ylabel('RCS / Area');
title('RCS vs Frequency for All Angles and b Values');
grid on;

legend({'0° b=0.25', '15° b=0.25', '30° b=0.25', '45° b=0.25', '60° b=0.25', '75° b=0.25', '90° b=0.25', ...
        '0° b=0.5',  '15° b=0.5',  '30° b=0.5',  '45° b=0.5',  '60° b=0.5',  '75° b=0.5',  '90° b=0.5', ...
        '0° b=0.75', '15° b=0.75', '30° b=0.75', '45° b=0.75', '60° b=0.75', '75° b=0.75', '90° b=0.75'}, ...
        'Location', 'eastoutside');
saveas(gcf, 'Optical.png')