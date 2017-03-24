function show_data(yearIndex,user1,user2)
% MATLAB function that plots message history between user1 and user2
% This function is written to accommodate older versions of MATLAB
% (pre-2014b) which used the first version of the handle graphics engine.
% It will work perfectly fine in more recent releases but keep in mind the
% following:
%
% 1) The example plots included in the tutorial will not match the plots
% from newer versions of MATLAB
%
% 2) There are much easier ways of plotting dates using the datetime
% datatype. This is not done here for sake of backwards compatibility.

figWidth = 3.5; % figure width in inches
figHeight = 2.5; % figure height in inches


% find the 7-day running average
k = ones(1,7)/7;
u1Avg = conv(user1,k,'same');
u2Avg = conv(user2,k,'same');

% sample the weekly average
dayIndex = 1:length(u1Avg);
dayIndex = dayIndex(1:7:end);
u1Avg = u1Avg(1:7:end);
u2Avg = u2Avg(1:7:end);

% plot using MATLAB defaults
f1 = figure(1);
set(f1,'NumberTitle','off','Name','Default MATLAB plot');
clf
plot(repmat(dayIndex,[3 1])',[u1Avg+u2Avg; u1Avg; u2Avg]');

% set the x axis limits
xlim([0 max(dayIndex)])
set(gca,'XTick',yearIndex(2,:),'XTickLabel',yearIndex(1,:));

legend('Combined','User 1','User 2')
xlabel('Date');
ylabel('Number of messages per day');
title('Daily usage (7 day running average)')

% resize the figure to match that of the paper figure size
set(f1,'Units','inches');
xywh = get(f1,'Position');
set(f1,'Position',[floor(xywh(1:2)) figWidth figHeight]);

%% Plot with tweaks to make the plot legible

% set the color scheme for the plot
color1 = [0 0 0];
color2 = [53 108 186]/255;
color3 = [125 41 140]/255;

f2 = figure(2);
set(f2,'NumberTitle','off','Name','Improved MATLAB plot');
% set(f2,'DefaultAxesFontSize',24); % make the font bigger
clf
hold on
plot(dayIndex,u1Avg+u2Avg,'color',color1);
plot(dayIndex,u1Avg,':','color',color2);
plot(dayIndex,u2Avg,'-.','color',color3);
hold off

% set the x axis limits
xlim([0 max(dayIndex)])
set(gca,'XTick',yearIndex(2,:),'XTickLabel',yearIndex(1,:));

legend('Combined','User 1','User 2')
xlabel('Date');
ylabel('Number of messages per day');
title('Daily usage (7 day running average)')

% resize the figure to match that of the paper figure size
set(f2,'Units','inches');
xywh = get(f2,'Position');
set(f2,'Position',[floor(xywh(1:2)) figWidth figHeight]);

end
