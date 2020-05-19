% questo file legge tutta la cartella emovo e calcola per ogni frase i
% parametri e assegna emozione e sesso del parlatore.
clear all;
%close all;
dirWAV='emovorisultati\';
f_s=dir([dirWAV,'f*']);
flag=0;
fs=48000;
nn=1;
database='emovo';
for k = 1 : length(f_s) % cicla sui parlatori
f_em=dir([dirWAV,f_s(k).name,'\em*']);
for l = 1 : length(f_em) % cicla sulle emozioni
f=dir([dirWAV,f_s(k).name,'\',f_em(l).name,'\*.wav']);
for i = 1 : length(f) % cicla sulle frasi
    [k l i]
nome=[dirWAV,f_s(k).name,'\',f_em(l).name,'\',f(i).name];
[y,fs]=wavread(nome);
%sound(y,fs);
y=y(:,1); % è in stereo prendo il primo canale
sent=select_sentence(f(i).name);
%if isempty(sent)==0
a=feat_sound(y,fs,'mean',0.8,0.05,0.99999); 
feat_speech(nn,:)=a;

[gt_speech(nn),int(nn),em_n(nn,:),sp_n(nn)]=set_emotion(f(i).name,f_s(k).name,database);
sex(nn)=setB_sex(f_s(k).name,database);
nn=nn+1;
clearvars -except dirWAV flag l k f_s f_em f fs feat_speech nn gt_speech int em_n sex sp_n database;
end
end
end
%end
%
%save('Feat_Emovo_r.mat','sex','feat_speech'','gt_speech','sp_n','em_n');
