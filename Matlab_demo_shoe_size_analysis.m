%%% Gunnar Schmidtmann, University of Plymouth, November 2020

clearvars
close all
clc
commandwindow


%%% create a sepearte Data folder whcih should contina the 'shoe_size.xlsx' data file


%%% set directories and read the data
current_dir = pwd;
data_folder = [current_dir '/Data'];
cd(data_folder);

filename = 'shoe_size.xlsx';
[data,txt,raw] = xlsread(filename);

%%% sort the data with respect to sex (male, female)
for i = 1:length(data)
    if data(i,1) == 1
        male_data(i,:) = data(i,1:2);
    elseif data(i,1) == 2
        female_data(i,:) = data(i,1:2);
    end
end

%%% erase cells with zeros (0)
male_data( ~any(male_data,2), :) = [];
female_data( ~any(female_data,2), :) = [];

%%% calcualte mean and standard deviation for each group
mean_male = mean(male_data(:,2));
SD_male = std(male_data(:,2));
mean_female = mean(female_data(:,2));
SD_female = std(female_data(:,2));

%%% plot a scatter plot
subplot(1,2,1) % data plot
plot(male_data(:,2),'bo','markersize',10)
hold on
plot(female_data(:,2),'ro','markersize',10)
set(gca,'FontSize',15)
legend('Male','Female')
ylabel('Shoe Size')
grid on
ylim([0 14])

%%% plot histograms, fit a Gaussian
subplot(1,2,2) % histogram
h=histfit(male_data(:,2),10,'normal')
h(2).Color = [0 0 1];
h(1).FaceColor = [0 0 0.5]
h(1).FaceAlpha = 0.5;

hold on
j=histfit(female_data(:,2),10,'normal')
j(2).Color = [1 0 0];
j(1).FaceColor = [0.5 0 0];
j(1).FaceAlpha = 0.5;

grid on
set(gca,'FontSize',15)
set (gca,'Xdir','reverse')
camroll(270)
