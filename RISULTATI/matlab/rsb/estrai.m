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

plot(1:size(data_ber,1),data_ber,'-')
hold on
plot(1:size(data_cri,1),data_cri,'--')
hold on
plot(1:size(data_dan,1),data_dan,'-o')
hold on
plot(1:size(data_eli,1),data_eli,'o')
hold on


title ('Return Stack Buffer length');
grid on
xlabel('call stack depth'), ylabel('marker hit');
xlim([0 22])
ylim([0 7])
legend('8th-gen i7','9th-gen i9','5th-gen i5','3th-gen i5')



