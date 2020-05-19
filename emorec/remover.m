clear all;
clc;

[file,path]=uigetfile();

load([path,file]);

ind=[];
for i=1:length(gt_speech)
    for j=1
        if (gt_speech(i)==j)
        ind=[ind, i];
        end
    end
end

for i=1:length(gt_speech)
    for j=2
        if (gt_speech(i)==j)
        ind=[ind, i];
        end
    end
end

% for i=1:length(gt_speech)
%     for j=3
%         if (gt_speech(i)==j)
%         ind=[ind, i];
%         end
%     end
% end

for i=1:length(gt_speech)
    for j=4
        if (gt_speech(i)==j)
        ind=[ind, i];
        end
    end
end

% for i=1:length(gt_speech)
%     for j=5
%         if (gt_speech(i)==j)
%         ind=[ind, i];
%         end
%     end
% end

for i=1:length(gt_speech)
    for j=6
        if (gt_speech(i)==j)
        ind=[ind, i];
        end
    end
end

for i=1:length(gt_speech)
    for j=7
        if (gt_speech(i)==j)
        ind=[ind, i];
        end
    end
end

% for i=1:length(sex)
%     j='F';
%         if(sex(i)==j)
%             ind=[ind, i];
%         end
% end

% for i=1:length(sex)
%     j='M';
%         if(sex(i)==j)
%             ind=[ind, i];
%         end
% end

ind=unique(ind);
ind=sort(ind);

for i=length(ind):-1:1
    feat_speech(:,ind(i))=[];
    sex(:,ind(i))=[];
    gt_speech(:,ind(i))=[];
    gt_sent(:,ind(i))=[];
    em_n(:,ind(i))=[];
    sp_n(:,ind(i))=[]; 
end

uisave({'feat_speech', 'sex', 'gt_speech', 'gt_sent','em_n','sp_n'},'Result.mat');
clear all;
