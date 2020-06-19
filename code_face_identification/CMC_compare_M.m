 clear;clc;
close all;

% addpath('./redist-source');

%% before enhancement
src = 'E:\zn_Projects\facerecognition_deep\face_recognition\';
curvedata = csvread([src 'listcmck_M.csv']); 
plot(curvedata(1:50,1),curvedata(1:50,2),'r-','LineWidth',2);

xlabel('Rank');
ylabel('Recognition Rate(%)');
title('Middle Quality versus High Quality');
grid on;
hold on;

%% deblur_new all sharpneww
src = 'E:\zn_Projects\facerecognition_deep\deblur\';
curvedata = csvread([src 'm_listcmck.csv']); 
plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% deep feature
% src = 'E:\zn_Projects\facerecognition_deep\face_recognition\middle_deep_v2\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% photometric using illumination measure
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\middle_photo_rgb_measure\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% deblur using front enhanced and sharpness new
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\middle_deblur_sharpness_new\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% deblur using front enhanced match
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\middle_deblur_front_enhanced_match\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% front using new thresholds xyz
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\middle_front_xyz_rgb\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% deblur using frontalized images
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\middle_deblur_front_rgb\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% pthoto  using frontlizaed
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\middle_photo_front_rgb\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% frontalization highmean rgb
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\middle_frontal_highmean_rgb\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% just photo_metric
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\middle_photo_QA\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);


%% deblur 
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\deblur\';
% curvedata = csvread([src 'relistcmck_M.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);


%% photometric
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\phometric_norm\middle\';
% curvedata = csvread([src 'relistcmck_M.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'c-');

%% frontalization

% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\frontalization\';
% curvedata = csvread([src 'listcmck_M.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% frontalization 2-qa-landmark
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\middle_landmarks\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'LineWidth',2);

%% frontalization 3-rgb-landmark
% src = 'F:\zn1\znMCM\MsCeleb1M_code\reFaceRecognitionM\middle_landmarks_rgb\';
% curvedata = csvread([src 'listcmck.csv']); 
% plot(curvedata(1:50,1),curvedata(1:50,2),'b-','LineWidth',2);

%% legend
% legend('cropped faces','Before Enhancement','deblur','photometric normalization','Frontalization');
legend('Before Enhancement','After Enhancement');
% legend('No deep feature','Use deep feature');

