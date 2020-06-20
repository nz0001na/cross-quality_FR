clear; clc;
close all;

% get all votes
result_path = 'D:\zn_Projects\human_exp\result_analysis\EXP_V3_VGG\result_group\all\';
db = 'facescrub'
% d = dir(result_path);
% isub = [d(:).isdir]; % returns logical vector
% nameFolds = {d(isub).name}';
% nameFolds(ismember(nameFolds,{'.','..'})) = [];
% sum_sub= length(nameFolds);
% 
% pos_matrix = [];
% neg_matrix = [];
% for n = 1:sum_sub
%     subject_id = nameFolds{n};  
%     score_path = [ result_path subject_id '\ROC_' db '\' ];
%     neg_path = [score_path 'roc_facescrub_neg_score.csv' ];
%     pos_path = [score_path 'roc_facescrub_pos_score.csv' ];
%     pos = csvread(pos_path);
%     neg = csvread(neg_path);
%     pos_matrix = [pos_matrix, pos];
%     neg_matrix = [neg_matrix, neg];
% end
% csvwrite([result_path db '_pos_votes_all.csv'], pos_matrix);
% csvwrite([result_path db '_neg_votes_all.csv'], neg_matrix);

% select majority votes:
poses = csvread([result_path db '_samples_list.csv']);
rows = size(poses,1);
score = [];
for i = 1: rows
    pos = poses(i,1:19);
    len1 = length(find(pos == 1));
    len2 = length(find(pos == -1));
    if(len1 > len2)
        score = [score; 1];
    end
    if(len1 < len2)
        score = [score; -1];
    end
end

csvwrite([result_path db '_vote_result.csv'], score);

