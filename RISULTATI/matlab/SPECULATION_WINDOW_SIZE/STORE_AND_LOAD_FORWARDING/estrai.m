clc
close all
clear all
set(0,'DefaultLineLineWidth',3);
set(0,'DefaultTextFontSize',18)
set(0,'DefaultTextInterpreter','latex')
set(0,'DefaultAxesFontSize',16)


data_ber = table2array(readtable('data_ber.xls'));
data_ber = cellfun(@str2double,data_ber);
data_cri = table2array(readtable('data_cri.xls'));
data_cri = cellfun(@str2double,data_cri);
data_dan = table2array(readtable('data_dan.xls'));
data_dan = cellfun(@str2double,data_dan);
% data_eli = table2array(readtable('data_eli.xls'));
% data_eli = cellfun(@str2double,data_eli);

figure
hold on
title ('Store to load forwarding');
grid on
xlabel('FNOPs injected'), ylabel('μops');
% xlim([0 4])
% ylim([0 500])


data_ber_exe = data_ber(:,1);
data_ber_ret = data_ber(:,2);


data_dan_exe = data_dan(:,1);
data_dan_ret = data_dan(:,2);

HD = load('matlab.mat');

data_ber_exe_filtered = filter(HD.HD,data_ber_exe);

data_ber_exe_regress = fitlm([1:194]',data_ber_exe);
data_ber_exe_regress = data_ber_exe_regress.Fitted;

% plot(1:size(data_ber_exe_filtered,1),data_ber_exe_filtered.*1.5,'-','MarkerEdgeColor','blu')
% hold on

plot(1:size(data_ber_exe,1),data_ber_exe,'-','MarkerEdgeColor','yellow')
hold on

plot(1:size(data_ber_ret,1),data_ber_ret,'-','MarkerEdgeColor','yellow')
hold on

plot(1:size(data_ber_exe_regress,1),data_ber_exe_regress,'-','MarkerEdgeColor','blu')
hold on

% p = polyfit([1:3]',[data_ber_exe(1) data_ber_exe_regress(19) data_ber_exe_regress(20)],2);
% py = polyval(p,[1:3]');
% plot([1:3]',py)

% plot(1:size(data_dan_exe,1),data_dan_exe,'--','MarkerEdgeColor','blu')
% hold on
% plot(1:size(data_dan_ret,1),data_dan_ret,'--','MarkerEdgeColor','yellow')
% hold on
% 
% 
% legend('8th-gen i7 uops executed','8th-gen i7 uops retired','5th-gen i5 uops executed','5th-gen i5 uops retired')
legend('8th-gen i7 uops executed','8th-gen i7 uops retired', '8th-gen i7 uops executed linear interp')


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



