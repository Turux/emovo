%% Chiudo tutte le finestre aperte e pulisco del Command window e del Workspace
close all;
clear all;
clc;

%% Acquisisco la il mio file di estensione 'mat' 
[file,path]=uigetfile('*.mat*');    
load([path,file]);              %Acquisisce un file con i risultati
clear path file;

%% Creo l'input e il target per la rete neurale
inputs = feat_speech;
label_speech=zeros(2,length(gt_speech)); %Crea la matrice dei label per l'addestramento della rete neurale.

A=gt_speech(1);
for i=1:length(gt_speech)
    if (gt_speech(i)==A)
        label_speech(1,i)=1;
    else
        label_speech(2,i)=1;
    end
end

targets = label_speech;

clear i j;      % Pulisco gli indici 'i' e 'j'

%% Creo la rete neurale, divido il dataset e definisco le funzioni degli strati
net = patternnet([60]);        % Creo la rete neurale

net.divideFcn = 'dividerand';           % Divido il dataset in modo casuale
net.divideParam.trainRatio = 0.8;
net.divideParam.valRatio = 0.1;
net.divideParam.testRatio = 0.1;

net.layers{1}.transferFcn = 'radbas'; 	% Scelgo il tipo di funzione per lo strato

%% Definisco il tipo di addestramento e i suoi parametri
net.trainFcn = 'traingdm';
net.trainParam.show = 25;
net.trainParam.goal = 1e-5;
net.trainParam.epochs = 10000;
net.trainParam.mc = 0.7;

%% Addestro la rete e vedo graficamente i risultati
%[net,tr] = train(net,inputs,targets,'showResources','yes','useParallel','yes','useGPU','yes');
[net,tr] = train(net,inputs,targets,'showResources','yes','useParallel','yes');

outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs);

%view(net)
plotconfusion(targets,outputs)