clear; clc;
close all;

% result_path = 'D:\zn_Projects\human_exp\result_analysis\EXP_V3_VGG\result\19 sr\';
result_path = 'D:\zn_Projects\human_exp\result_analysis\EXP_V3_VGG\result_group\all\'
db = 'ijba';
score_path = [result_path 'ROC_' db '\']

genuine_scores = csvread([score_path db '_pos_result.csv']); 
imposter_scores = csvread([score_path db '_neg_result.csv']); 
FAR = [];
GAR = [];  

threshold = [2;1;0;-1;-2];
T = size(threshold);

for n=1:T
    trhd = threshold(n,1);
    FAR(n,1)=(sum(sum(imposter_scores >= trhd )))/length(imposter_scores);
    GAR(n,1)= (sum(sum(genuine_scores >= trhd )))/length(genuine_scores);
end

% csvwrite( [score_path 'threshold.csv'], threshold);
csvwrite([score_path db '_FAR.csv'], FAR);
csvwrite([score_path db '_GAR.csv'], GAR);

figure();
plot(FAR,GAR,'b-','LineWidth',2);
xlabel('False Accept Rate');
ylabel('Genuine Accept Rate');
title(['ROC on IJB-A by All'], 'FontSize',15);
axis([0 1 0 1]);
set(gca,'fontweight','bold','FontSize',15);

% compute AUC
auc = trapz(FAR, GAR);
disp(auc);



