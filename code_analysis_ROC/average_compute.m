clear; clc;
close all;

% get all accuracy
result_path = 'F:\zn1\znMCM\MsCeleb1M_code\0code_human_recognition\code_human_exp_tool\EXP_V3\0_analysis\';
data_file = [result_path 'facescrub_auc.csv'];

ex= importdata(data_file);
data = ex.data;
pos_avg = mean(data(:,1));
neg_ave = mean(data(:,2));
total_avg = mean(data(:,3));
auc_avg = mean(data(:,4));
