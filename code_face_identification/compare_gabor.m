clear;clc;
close all;

% addpath('./redist-source');

%% low deep
src = 'F:\zn1\znMCM\MsCeleb1M_code\code_deep_fr\face_recognition_result\';
curvedata = csvread([src 'listcmck_L.csv']); 
plot(curvedata(1:50,1),curvedata(1:50,2),'r-','LineWidth',2);

xlabel('Rank');
ylabel('Recognition Rate(%)');
axis([0 50 0 1]);
title('Comparation of Low vs. High & Middle vs. High using gabor features');
grid on;
hold on;

%% high deep
src = 'F:\zn1\znMCM\MsCeleb1M_code\code_deep_fr\face_recognition_result\';
curvedata = csvread([src 'listcmck_M.csv']); 
plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

legend('Low vs High','Middle vs High');
