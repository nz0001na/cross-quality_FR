clear;clc;
close all;

% destanation of feature 
pathFolder = 'F:\zn1\znMCM\MsCeleb1M_code\code_deep_fr\feature_output\CenterLoss\0126_V\high\';
d = dir(pathFolder);
isub = [d(:).isdir]; % returns logical vector
nameFolds = {d(isub).name}';
nameFolds(ismember(nameFolds,{'.','..'})) = [];

% source files of feature
src = 'F:\zn1\znMCM\MsCeleb1M_code\code_deep_fr\deep_features\CenterLoss\0126_V\';
data = importdata([src 'centerloss_IJBA_high_Features.mat']);
features = data.features;
image_path = data.image_path;
subID = [];
for i=1:length(image_path)
    path1 = image_path{1,i};
    S1 = regexp(path1, '/', 'split');
    subID = [subID;S1(9),S1(10)];
end

for n=1:length(nameFolds);
    fprintf('%d/%d %s\n', n, length(nameFolds), nameFolds{n});
    subject_id = nameFolds{n};   
    
    index_images = [];
    name_imges = [];
    feature = [];
    i = 1;
     
    fid = fopen([pathFolder subject_id '/' subject_id '_name.csv'], 'w');
    for j=1:length(subID)
        id = subID{j,1};
        name = subID{j,2};
        if(strcmp(id,subject_id))
            index_images = [index_images;j];
            name_imges{i,1} = {name};
            i=i+1;
            feature = [feature;features(j,:)]
            fprintf(fid, '%s\n',name);
        end
    end
   
    csvwrite([pathFolder subject_id '/' subject_id '_feature.csv'],feature);
    fclose(fid);
      
    
end