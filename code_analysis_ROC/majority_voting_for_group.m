clear; clc;
close all;

% % get votes of each group
result_path = 'F:\zn1\znMCM\MsCeleb1M_code\0code_human_recognition\code_human_exp_tool\EXP_V3\';
result_data_path = [result_path '0_result/' ];
name_list = [result_path '0_analysis/name_list_group1_2.txt'];
db = 'facescrub';

% names = importdata(name_list);
% sum_sub = size(names,1);
% pos_matrix = [];
% neg_matrix = [];
% for n = 1:sum_sub
%     subject_id = names{n};  
%     score_path = [ result_data_path subject_id '\ROC_' db '\' ];
%     neg_path = [score_path 'roc_' db '_neg_score.csv' ];
%     pos_path = [score_path 'roc_' db '_pos_score.csv' ];
%     pos = csvread(pos_path);
%     neg = csvread(neg_path);
%     pos_matrix = [pos_matrix, pos];
%     neg_matrix = [neg_matrix, neg];
% end
% csvwrite([result_path '0_analysis/group1_2/' db '_pos_votes_all.csv'], pos_matrix);
% csvwrite([result_path '0_analysis/group1_2/' db '_neg_votes_all.csv'], neg_matrix);

%% select majority votes:
poses = csvread([result_path '0_analysis/group1_2/' db '_neg_votes_all.csv']);
rows = size(poses,1);
score = [];
for i = 1: rows
    pos = poses(i,1);
    len1 = length(find(pos == 1));
    len2 = length(find(pos == -1));
    if(len1 > len2)
        score = [score; 1];
    end
    if(len1 < len2)
        score = [score; -1];
    end
end
csvwrite([result_path '0_analysis/group1_2/' db  '_neg_score_all.csv'], score);

