%% Chiudo tutte le finestre aperte e pulisco il Command window e il Workspace
close all
clear all
clc

%% Acquisisco la il mio file di estensione 'mat' 
[file,path]=uigetfile('*.mat*');    % Scelgo il mio file
load([path,file]);                  % Acquisisco un file con i risultati
clear path file;                    % Pulisco 'path' e 'file' che non sono più necessari

%% Creo l'input e il target per la rete neurale
inputs = feat_speech;

label_speech=zeros(7,length(gt_speech));    % Crea la matrice dei label per l'addestramento della rete neurale
for i=1:length(gt_speech)
    for j=1:7
        if (gt_speech(i)==j)
            [j i]
            label_speech(j,i)=1;
        end
    end
end
targets = label_speech;

clear i j;      % Pulisco gli indici 'i' e 'j'

%% Creo la rete neurale, divido il dataset e definisco le funzioni degli strati
net = feedforwardnet([180]);        % Creo la rete neurale

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
[net,tr] = train(net,inputs,targets,'showResources','yes','useParallel','yes','useGPU','yes');

outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs);

%view(net)
plotconfusion(targets,outputs)