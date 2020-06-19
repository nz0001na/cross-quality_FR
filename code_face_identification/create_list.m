clear;clc;
close all;

pathFolder = 'F:\zn1\znMCM\MsCeleb1M_code\statistic_rqs_3f\QAoutput';
d = dir(pathFolder);
isub = [d(:).isdir]; % returns logical vector
nameFolds = {d(isub).name}';
nameFolds(ismember(nameFolds,{'.','..'})) = [];
namelist = {};

for n=1:length(nameFolds)
     fprintf('%d/%d %s\n', n, length(nameFolds), nameFolds{n});
     subject_id = nameFolds{n};   %probe subjectId 
    
     data = importdata([pathFolder '/' subject_id '/' subject_id '_low_scores.csv']);
     if(~isempty(data))
     names = data.textdata;
     ids=cell(length(names),1);
     ids(:)={[subject_id]};
     namelist = [namelist;[ids,names]];
     end
    
end
save('namelist_low.mat','namelist');

