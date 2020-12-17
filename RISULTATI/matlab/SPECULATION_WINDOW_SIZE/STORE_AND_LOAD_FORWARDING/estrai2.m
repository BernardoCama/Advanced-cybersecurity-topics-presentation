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

data_cri_exe = data_cri(:,1);
data_cri_ret = data_cri(:,2);


data_dan_exe = data_dan(:,1);
data_dan_ret = data_dan(:,2);

HD = load('matlab.mat');
[b,a] = ellip(6,5,40,0.25);
% freqz(b,a)

data_ber_cri_filtered = filter(b, a, data_cri_exe);
% data_ber_cri_filtered = filter(HD.HD,data_cri_exe);

data_ber_exe_regress = fitlm([1:194]',data_ber_exe);
data_ber_exe_regress = data_ber_exe_regress.Fitted;

data_cri_exe_regress = fitlm([1:194]',data_cri_exe);
data_cri_exe_regress = data_cri_exe_regress.Fitted;


data_cri_exe_regress = medfilt1(data_cri_exe(1:end),41);
data_cri_ret_regress = medfilt1(data_cri_ret(1:end),41);

% plot(1:size(data_ber_exe_filtered,1),data_ber_exe_filtered.*1.5,'-','MarkerEdgeColor','blu')
% hold on

plot(1:size(data_cri_exe,1),data_cri_exe,'-','MarkerEdgeColor','yellow','LineWidth',1)
hold on

plot(1:size(data_cri_ret,1),data_cri_ret,'-','MarkerEdgeColor','yellow','LineWidth',1)
hold on

plot(1:size(data_cri_exe_regress,1),data_cri_exe_regress,'-','MarkerEdgeColor','blu')
hold on

plot(1:size(data_cri_ret_regress,1),data_cri_ret_regress,'-','MarkerEdgeColor','blu')
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
legend('9th-gen i9 uops executed','9th-gen i9 uops retired', '9th-gen i9 uops executed median filter', '9th-gen i9 uops retired median filter')


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



