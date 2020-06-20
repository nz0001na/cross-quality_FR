clear;clc;
close all;
% compare all persons

auc_path = 'D:\zn_Projects\human_exp\result_analysis\EXP_V3_VGG\result_group\';
db = 'ijba';
% auc_path = [result_path '\EXP_V3\0_analysis\'];

% all
curve_path = [auc_path 'all\ROC_' db '\' ];
far = csvread([curve_path db '_FAR.csv']);
gar = csvread([curve_path db '_GAR.csv']);

figure();
plot(far,gar,'k--','LineWidth',2);
xlabel('False Accept Rate');
ylabel('True Accept Rate');
title('ROC on IJB-A' , 'FontSize',15);
axis([0 1 0 1]);
set(gca,'fontweight','bold','FontSize',15);
grid on;
hold on;

% group 1
curve_path = [auc_path 'group1_3\ROC_' db '\'];
far = csvread([curve_path db '_FAR.csv']);
gar = csvread([curve_path db '_GAR.csv']);
plot(far,gar,'r-','LineWidth',2);

% group 2
curve_path = [auc_path 'group2_4\ROC_' db '\' ];
far = csvread([curve_path db '_FAR.csv']);
gar = csvread([curve_path db '_GAR.csv']);
plot(far,gar,'g-','LineWidth',2);

% group3
curve_path = [auc_path 'group3_13\ROC_' db '\' ];
far = csvread([curve_path db '_FAR.csv']);
gar = csvread([curve_path db '_GAR.csv']);
plot(far,gar,'b-','LineWidth',2);

leg1 = 'All (0.840)';
leg2 = 'Group1 (0.920)';
leg3 = 'Group2 (0.795)';
leg4 = 'Group3 (0.760)';

%legend
legend(leg1,leg2,leg3,leg4);

