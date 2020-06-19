clear;clc;
close all;

%% Mid vs high deep
src = 'F:\zn1\znMCM\MsCeleb1M_code\facerecognitionM\IJB-A_gabor\';
curvedata = csvread([src 'listcmck.csv']); 
plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

xlabel('Rank');
ylabel('Recognition Rate(%)');
axis([0 50 0 1]);
title('Comparison of High, Middle & Low Quality Images using Facescrub Gabor features','FontSize',15);
set(gca,'fontweight','bold','FontSize',15);
grid on;
hold on;

%% low vs middle deep
src = 'F:\zn1\znMCM\MsCeleb1M_code\facerecognitionLM\ijba_gabor\';
curvedata = csvread([src 'listcmck.csv']); 
plot(curvedata(1:50,1),curvedata(1:50,2),'g-','LineWidth',2);

%% High vs Low deep
% src = 'F:\zn1\znMCM\MsCeleb1M_code\facerecognitionL\IJB-A_gaborfeature\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'r-','LineWidth',2);
legend('Middle vs High','Low vs Middle');
% legend('Middle vs High','Low vs Middle','Low vs High');
