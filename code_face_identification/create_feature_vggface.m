clear;clc;
close all;

% destanation of feature 
pathFolder = 'F:\zn1\znMCM\MsCeleb1M_code\code_deep_fr\feature_output\VGG_face\0126_V2\low\';
d = dir(pathFolder);
isub = [d(:).isdir]; % returns logical vector
nameFolds = {d(isub).name}';
nameFolds(ismember(nameFolds,{'.','..'})) = [];

% source files of feature
namelist = importdata('namelist_low.mat');
src = 'F:\zn1\znMCM\MsCeleb1M_code\code_deep_fr\deep_features\VGG_face\0126_V\';
data = importdata([src 'vggface_IJBA_low_Features.mat']);
features = data.features;
image = data.image_path;
subID = [];
for i=1:length(image)
    image_i = image{1,i};
    index = find(ismember(namelist, image_i));
%     IndexC = strfind(namelist, image_i); % ?? {[1], [], []}  
%     index = find(~(cellfun('isempty', IndexC))); 
    id = namelist{index-6196,1};
    subID = [subID; {num2str(id)}, {image_i} ];
end
count = 0;
for n=1:length(nameFolds);
    fprintf('%d/%d %s\n', n, length(nameFolds), nameFolds{n});
    subject_id = nameFolds{n};   
    
%     index_images = [];
%     name_imges = [];
    feature = [];
%     i = 1;
     
    fid = fopen([pathFolder subject_id '/' subject_id '_name.csv'], 'w');
    for j=1:length(subID)
        id = subID{j,1};
        name = subID{j,2};
        if(strcmp(id,subject_id))
%             index_images = [index_images;j];
%             name_imges{i,1} = {name};
%             i=i+1;
            feature = [feature;features(j,:)]
            fprintf(fid, '%s\n',name);
            count = count+1;
        end
    end
   
    csvwrite([pathFolder subject_id '/' subject_id '_feature.csv'],feature);
    fclose(fid);
      
    
end