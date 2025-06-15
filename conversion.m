clc
clear all;
close all;


% Load the text file
filename = 'theta_90_3GHz_to_4GHZ.TXT';

% Read the data from the text file
data = readtable(filename, 'FileType', 'text', 'Format', '%f%f', 'ReadVariableNames', false);
data.Properties.VariableNames = {'p', 'f_p'}; % Assign column names

% Create output Excel file name
[~, name, ~] = fileparts(filename); % Extract name without extension
outputExcel = [name, '.xlsx']; % Append .xlsx to name

% Save as Excel file
writetable(data, outputExcel, 'WriteVariableNames', true);

disp(['File saved as ', outputExcel]);
