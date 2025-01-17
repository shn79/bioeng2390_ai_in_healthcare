%% Load sample data
load('EEG_sleep.mat')           

%% 
% Examine the dimensionality of the signal by loading it into a new
% variable:
s_of_t = EEG.data;

%% 
% Plot the signals in different sampling frequencies
figure(1)
subplot(1,2,1)
plot(s_of_t(1:1000));
title('First 1000 data points, full fs data')

subplot(1,2,2)
plot(s_of_t(1:100:1000))
title('First 1000 data points, skipping by 100s, full fs data')


% superimpose the plots by appropriate x-axis definitions  
figure(2)
plot(1:1000, s_of_t(1:1000));
title('First 1000 data points, full fs data')

hold on;
plot(1:100:1000, s_of_t(1:100:1000), 'r')
title('First 1000 data points, skipping by 100s, full fs data')


%% Subset the data to the first 10000 elements and write that data out to a file
s_of_t_subset = s_of_t(1:10000);
 csvwrite('s_of_t_subset.csv', s_of_t_subset);