function [f01_e,te,f02_e,te2,sel2]=smooth_pitch(t1,f0,sel,sig,intfa) % f0 e t1 devono comprendere tutti i punti
sel2=sel>0 & abs(f0-median(f0(sel)))<sig*std(f0(sel));

id1=find(sel2==1,1,'first');
id2=find(sel2==1,1,'last');
fmin=min(f0(sel2));
fmax=max(f0(sel2));

id_rec=f0>=fmin & f0<=fmax;
id_rec(1:id1-1)=false;
id_rec(id2+1:end)=false;
sel2(id_rec)=true;
% s = fitoptions('Method','SmoothingSpline','SmoothingParam',0.9);
% [f0_fit]=fit(t1(sel)',f0(sel)','smoothingspline',s); % qui gli passo i punti ad energia bassa
% id=find(sel);
% I1 = abs(f0_fit(t1(sel))' - median(f0(sel))) > 0.8*std(f0(sel)); 
% I=id(I1);
% sel2=sel; % tolti i silenzi
% sel2(I)=false; % tolti outliers e silenzi
% %outliers = excludedata(t1,f0,'indices',I);
% %for_m=mean(f0(sel2));
% %f0(sel)=f0(sel)-mean(f0(sel2));
% %f0(not(sel))=0;
% %s = fitoptions('Method','SmoothingSpline','SmoothingParam',0.99999999,'Exclude',outliers);
s = fitoptions('Method','SmoothingSpline','SmoothingParam',intfa); %0.99999

[f0_fit2]=fit((t1(sel2))',(f0(sel2))','smoothingspline',s);
te=linspace(min(t1(sel2)),max(t1(sel2)),1024); 
%f01_e=f0_fit2(te)+for_m;
f01_e=f0_fit2(te);

% estraggo anche i punti senza modello
f02_e=f0(sel2);
te2=t1(sel2);
end