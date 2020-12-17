clc
close all
clear all
set(0,'DefaultLineLineWidth',5);
set(0,'DefaultTextFontSize',18)
set(0,'DefaultTextInterpreter','latex')
set(0,'DefaultAxesFontSize',16)


data_ber = table2array(readtable('data_ber.xls'));
data_ber = cellfun(@str2double,data_ber);
data_cri = table2array(readtable('data_cri.xls'));
data_cri = cellfun(@str2double,data_cri);
data_dan = table2array(readtable('data_dan.xls'));
data_dan = cellfun(@str2double,data_dan);
data_eli = table2array(readtable('data_eli.xls'));
data_eli = cellfun(@str2double,data_eli);

figure
hold on
title ('Conditional Branches');
grid on
xlabel('instructions before the system call'), ylabel('μops');
xlim([0 9])
% ylim([0 500])


data_ber_cond = data_ber(1:9);
data_ber_noncond = data_ber(10:end);
m = (data_ber_cond+data_ber_noncond)/2;
e1 = data_ber_cond-data_ber_noncond;
e = errorbar(1:1:9,m,e1,'o','MarkerEdgeColor','red')
e.Color = 'red';

data_cri_cond = data_cri(1:9);
data_cri_noncond = data_cri(10:end);
m = (data_cri_cond+data_cri_noncond)/2;
e2 = data_cri_cond-data_cri_noncond;
e = errorbar(1:1:9,m,e2,'o','MarkerEdgeColor','green')
e.Color = 'green';

data_dan_cond = data_dan(1:9);
data_dan_noncond = data_dan(10:end);
m = (data_dan_cond+data_dan_noncond)/2;
e3 = data_dan_cond-data_dan_noncond;
e = errorbar(1:1:9,m,e3,'o','MarkerEdgeColor','blue')
e.Color = 'blue';

data_eli_cond = data_eli(1:9);
data_eli_noncond = data_eli(10:end);
m = (data_eli_cond+data_eli_noncond)/2;
e4 = data_eli_cond-data_eli_noncond;
e = errorbar(1:1:9,m,e4,'o','MarkerEdgeColor','yellow')
e.Color = 'yellow';

legend('8th-gen i7','9th-gen i9','5th-gen i5','3th-gen i5')


% plot(1:size(data_ber,1),data_ber,'-')
% hold on
% plot(1:size(data_cri,1),data_cri,'--')
% hold on
% plot(1:size(data_dan,1),data_dan,'-o')
% hold on
% plot(1:size(data_eli,1),data_eli,'o')
% hold on

% 
% title ('μops executed in kernel mode');
% grid on
% xlabel('instructions before the system call'), ylabel('μops');
% % xlim([0 22])
% % ylim([0 7])
% legend('8th-gen i7','9th-gen i9','5th-gen i5','3th-gen i5')
%legend('9th-gen i9','5th-gen i5','3th-gen i5')



