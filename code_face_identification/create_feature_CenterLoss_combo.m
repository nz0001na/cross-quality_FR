clear;clc;
close all;

src = 'F:\zn1\znMCM\FaceScrub_dataset\facescrub_deepfeature\';
data = importdata([src 'centerloss_facescrub_Features.mat']);
features = data.features;
image_path = data.image_path;
%subID = [];  % id, name

by_path = 'F:\zn1\znMCM\FaceScrub_dataset\facescrub_rqs\facescrub_rqs_data\';

for i=1:length(image_path)
    path1 = image_path{1,i};
    S1 = regexp(path1, '/', 'split');
    %subID = [subID;S1(9),S1(10)];
    subject_id = S1(9);
    image_name = S1(10);
    feature = features(i,:);
    
    by_name = [by_path subject_id '/' subject_id '_scores.csv'];
    fid = fopen( na, 'r');
    C = textscan(fid, '%s %d');
    C1=C{1};
    
    % group images
%     by_path = ['F:\NaZhang\datasets_facescrub\facescrub_rqs_data/' subject_id '/' subject_id '_scores.csv'];
%     scor_f = fopen(by_path, 'r');
%     C = textscan(scor_f, '%s %d');
%     if(isempty(C{1}))
%         continue;
%     else
%         C1 = C{1};
%     end
    
    
     for c=1:size(C1,1)
        BLj = subject_f_Probe(l,:);       
        name_sc = C1(l);      
        name_sco = deblank(name_sc);
        name_scor = regexp(name_sco, ',', 'split');
        name_score=name_scor{1}
        name1=char(name_score(1,1))
%         score1=str2num(char(name_score(1,2)))       
        imageprobe = name1;
        
     end
    
    
    
    
end









% for n=1:length(nameFolds);
%     fprintf('%d/%d %s\n', n, length(nameFolds), nameFolds{n});
%     subject_id = nameFolds{n};   
%     
%     index_images = [];
%     name_imges = [];
%     feature = [];
%     i = 1;
%      
%     
%     
%     
%     fid = fopen([pathFolder subject_id '/' subject_id '_name.csv'], 'w');
%     for j=1:length(subID)
%         id = subID{j,1};
%         name = subID{j,2};
%         if(strcmp(id,subject_id))
%             index_images = [index_images;j];
%             name_imges{i,1} = {name};
%             i=i+1;
%             feature = [feature;features(j,:)]
%             fprintf(fid, '%s\n',name);
%         end
%     end
%    
%     csvwrite([pathFolder subject_id '/' subject_id '_feature.csv'],feature);
%     fclose(fid);
%       
%     
% end