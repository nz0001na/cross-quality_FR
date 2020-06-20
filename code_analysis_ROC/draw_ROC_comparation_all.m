clear;clc;
close all;
% compare all persons

result_path = 'F:\zn1\znMCM\MsCeleb1M_code\0code_human_recognition\code_human_exp_tool\';
db = 'facescrub';
score_path = [result_path '\EXP_V3\0_result\']
auc_path = [result_path '\EXP_V3\0_analysis\']
% read names and AUC
ex=importdata([auc_path db '_auc.csv']);
names = ex.textdata;
aucs = ex.data(:,4);
namesize = size(ex,1);

% 1 person
name = names{1};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);

figure();
plot(far,gar,'r-','LineWidth',2);
xlabel('False Accept Rate');
ylabel('Genuine Accept Rate');
title([db ' ROC Comparation ' ], 'FontSize',15);
axis([0 1 0 1]);
set(gca,'fontweight','bold','FontSize',15);
grid on;
hold on;

% 2 person
name = names{2};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'r--','LineWidth',2);

% 3 person
name = names{3};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'r:','LineWidth',2);

% 4 person
name = names{4};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'r-.','LineWidth',2);

% 5 person
name = names{5};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'m-','LineWidth',2);

% 6 person
name = names{6};
curve_path = [score_path string(name) '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'m--','LineWidth',2);

% 7 person
name = names{7};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'m:','LineWidth',2);

% 8 person
name = names{8};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'m-.','LineWidth',2);

% 9 person
name = names{9};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'g-','LineWidth',2);

% 10 person
name = names{10};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'g--','LineWidth',2);

% 11 person
name = names{11};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'g:','LineWidth',2);

% 12 person
name = names{12};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'g-.','LineWidth',2);

% 13 person
name = names{13};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'c-','LineWidth',2);

% 14 person
name = names{14};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'c--','LineWidth',2);

% 15 person
name = names{15};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'c:','LineWidth',2);

% 16 person
name = names{16};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'c-.','LineWidth',2);

% 17 person
name = names{17};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'b-','LineWidth',2);

% 18 person
name = names{18};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'b--','LineWidth',2);

% 19 person
name = names{19};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'b:','LineWidth',2);

% 20 person
name = names{20};
curve_path = [score_path name '\ROC_' db '\' ];
far = csvread([curve_path 'FAR.csv']);
gar = csvread([curve_path 'GAR.csv']);
plot(far,gar,'b-.','LineWidth',2);

% all
curve_path = [auc_path 'all_pairs/' ];
far = csvread([curve_path db '_FAR.csv']);
gar = csvread([curve_path db '_GAR.csv']);
plot(far,gar,'k-','LineWidth',2);


leg1 = [char(names{1}) ' (' num2str(aucs(1)) ')'];
leg2 = [char(names{2}) ' (' num2str(aucs(2)) ')'];
leg3 = [char(names{3}) ' (' num2str(aucs(3)) ')'];
leg4 = [char(names{4}) ' (' num2str(aucs(4)) ')'];
leg5 = [char(names{5}) ' (' num2str(aucs(5)) ')'];
leg6 = [char(names{6}) ' (' num2str(aucs(6)) ')'];
leg7 = [char(names{7}) ' (' num2str(aucs(7)) ')'];
leg8 = [char(names{8}) ' (' num2str(aucs(8)) ')'];
leg9 = [char(names{9}) ' (' num2str(aucs(9)) ')'];
leg10 = [char(names{10}) ' (' num2str(aucs(10)) ')'];
leg11 = [char(names{11}) ' (' num2str(aucs(11)) ')'];
leg12 = [char(names{12}) ' (' num2str(aucs(12)) ')'];
leg13 = [char(names{13}) ' (' num2str(aucs(13)) ')'];
leg14 = [char(names{14}) ' (' num2str(aucs(14)) ')'];
leg15 = [char(names{15}) ' (' num2str(aucs(15)) ')'];
leg16 = [char(names{16}) ' (' num2str(aucs(16)) ')'];
leg17 = [char(names{17}) ' (' num2str(aucs(17)) ')'];
leg18 = [char(names{18}) ' (' num2str(aucs(18)) ')'];
leg19 = [char(names{19}) ' (' num2str(aucs(19)) ')'];
leg20 = [char(names{20}) ' (' num2str(aucs(20)) ')'];
leg21 = 'All (0.885)';

%legend
legend(leg1,leg2,leg3,leg4,leg5,leg6,leg7,leg8,leg9,leg10,leg11,leg12,leg13,leg14,leg15,leg16,leg17,leg18,leg19,leg20,leg21);

