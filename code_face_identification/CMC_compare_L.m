clear;clc;
close all;
%addpath('./redist-source');

%% before enhancement
src = 'E:\zn_Projects\facerecognition_deep\face_recognition\';
curvedata = csvread([src 'listcmck_L.csv']); 
plot(curvedata(1:50,1),curvedata(1:50,2),'r-', 'LineWidth',2);

xlabel('Rank');
ylabel('Recognition Rate(%)');
title('Low Quality versus High Quality');
grid on;
hold on;

%% deep feature
src = 'E:\zn_Projects\facerecognition_deep\face_recognition\low_deep_v2\';
curvedata = csvread([src 'listcmck.csv']); 
plot(curvedata(1:50,1),curvedata(1:50,2),'b-', 'LineWidth',2);

%% photo illum measure rgb 
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionL\low_photo_rgb_measure\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-', 'LineWidth',2);

%% deblur using front enhaced matching and sharpness new
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionL\low_deblur_sharpness_new\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-', 'LineWidth',2);

%% deblur using front enhanced matching
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionL\low_deblur_front_enhanced_match\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-', 'LineWidth',2);

%% frontalization using xyz
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionL\low_xyz_rgb\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-', 'LineWidth',2);

%%deblur using frontalized images
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionL\low_deblur_front_rgb\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-', 'LineWidth',2);

%%photometric using front facess
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\low_photo_front_rgb\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-', 'LineWidth',2);

%% frontalization highmean rgb
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionL\low_frontal_landmark_highmean_rgb\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% just photo_metric
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionL\low_photo_QA\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% deblur 
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionL\deblur\';
% curvedata = csvread([src 'relistcmck_L.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% photometric
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionL\photometric\';
% curvedata = csvread([src 'relistcmck_L.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'c-');

%% frontalization
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionL\frontalization\';
% curvedata = csvread([src 'listcmck_L.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% frontalization 2
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\';
% curvedata = csvread([src 'listcmck_L.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% frontalization rgb
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\low_landmarks_rgb\';
% curvedata = csvread([src 'listcmck_L.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);
%% 3 together
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionL\low_after_deblur\';
% curvedata = csvread([src 'relistcmck_L.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% legend
%legend('cropped faces','Before Enhancement','deblur','photometric normalization','Frontalization','three together');
% legend('Before Enhancement','After Enhancement');
legend('No deep feature','Use deep feature');


