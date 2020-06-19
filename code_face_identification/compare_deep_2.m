clear;clc;
close all;

% addpath('./redist-source');

%% low deep
src = 'F:\zn1\znMCM\MsCeleb1M_code\code_deep_fr\face_recognition_result\VGGface\0126_V2_low\';
curvedata = csvread([src 'listcmck.csv']); 
plot(curvedata(1:50,1),curvedata(1:50,2),'r-','LineWidth',2);

xlabel('Rank');
ylabel('Recognition Rate(%)');
axis([0 50 0 1]);
title('Comparison of Low vs High & Middle vs High using VGGFace features','FontSize',15);
set(gca,'fontweight','bold','FontSize',15);
grid on;
hold on;

%% high deep
src = 'F:\zn1\znMCM\MsCeleb1M_code\code_deep_fr\face_recognition_result\VGGface\0126_V2_middle\';
curvedata = csvread([src 'listcmck.csv']); 
plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

legend('Low vs High','Middle vs High');
