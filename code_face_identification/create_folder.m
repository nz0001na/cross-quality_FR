clear;clc;
close all;

dst = '../feature_output/VGG_face/0126_V2/low/';
if(~exist(dst))
    mkdir('../feature_output/VGG_face/0126_V2/low/');
end

%% lightCNN /  CenterLoss
% pathFolder = 'F:\zn1\znMCM\MsCeleb1M_code\code_deep_fr\deep_features\CenterLoss\0126_V\';
% data = importdata([pathFolder 'centerloss_IJBA_high_Features.mat']);
% features = data.features;
% image_path = data.image_path;

%% faceNet
% src = 'F:\zn1\znMCM\MsCeleb1M_code\code_deep_fr\deep_features\FaceNet\ijba_mid.nn4.small2.v1.reps\';
% features = importdata([src 'reps.csv']);
% image_path = importdata([src 'labels.csv']);

%% create folders
% for n=1:length(image_path)
%     path_n = image_path{n,1};
%     S1 = regexp(path_n, '/', 'split');
%     subID = S1{1,9};
%    
%     dstq = [dst subID '/'];
%     if(~exist(dstq))
%       mkdir([dst subID '/']);
%     end
% end

%% VGG face
namelist = importdata('namelist_low.mat');
src = 'F:\zn1\znMCM\MsCeleb1M_code\code_deep_fr\deep_features\VGG_face\0126_V\';
data = importdata([src 'vggface_IJBA_low_Features.mat']);
features = data.features;
image = data.image_path;
len = length(image);
for n=1:len
    image_n = image{1,n};
    index = find(ismember(namelist, image_n));
%     IndexC = strfind(namelist, image_n); % ?? {[1], [], []}  
%     index = find(~(cellfun('isempty', IndexC))); 
    subID = namelist{index-6196,1};
    
    dstq = [dst subID '/'];
    if(~exist(dstq))
      mkdir([dst subID '/']);
    end
end



