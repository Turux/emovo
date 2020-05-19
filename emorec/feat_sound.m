function [feat_speech,t_mod,f0_mod,t_point,f0_point,t_init,t_for,FR_n,T,en_e,SWA,SWD,tr,coe]=feat_sound(y,fs,select,sig,ener,intfa)
%% Estrai pitch con corr e cepstrum
% [t_for,t_init,t_en,tim2,f0_corr,en,x,ind,formant,tx]=my_pitch_corr(y,fs,0);
% [timeax,tim1,f0_ceps]=pitch_ceps(y,fs,flag);
[f0_corr,f0_ceps,tw,t_init,form,bwf,en,val,val2,x]=my_speech_proc(y,fs,ener);
sel=not(val);
%f0_tot=mean([f0_ceps;f0_corr]);
%f0=(f0_tot-mean(f0_tot))/std(f0_tot);
%f0=f0_tot;
%% exclude outliers and fit from corr and ceps and form the model for pitch
[f01_corr,te11,f02_corr,te21,sel21]=smooth_pitch(tw,f0_corr,sel,sig,intfa);
[f01_ceps,te12,f02_ceps,te22,sel22]=smooth_pitch(tw,f0_ceps,sel,sig,intfa);
f0_mix=mean([f0_corr',f0_ceps']');
[f01_mix,te1_mix,f02_mix,te2_mix,sel2_mix]=smooth_pitch(tw,f0_mix,sel,sig,intfa);

% da qui la scelta di quale dei tre prendere separando opportunamente punti
% e modello
if (strcmp(select,'corr'))
    f0_point=f02_corr;
	f0_mod=f01_corr;
	t_point=te21;
	t_mod=te11;
    sel2=sel21;
elseif (strcmp(select,'ceps'))
    f0_point=f02_ceps;
	f0_mod=f01_ceps;
	t_point=te22;
	t_mod=te12;
    sel2=sel22;
else 
    f0_point=f02_mix;
	f0_mod=f01_mix;
	t_point=te2_mix;
	t_mod=te1_mix;
    sel2=sel2_mix;
end

% non possiamo mediare su entrambi i segnai perché sono a t diversi

%[f01_e,te,f02_e,te2]=smooth_pitch(t1,f0,sel) 
% for i = 1 : size(form,2)
%     [form1(:,i),t_for]=smooth_pitch(tw,form(:,i)',sel2);
%     formn(:,i)=form1(:,i);
%     [bwf1(:,i),t_for]=smooth_pitch(tw,bwf(:,i)',sel2);
%     bwfn(:,i)=bwf1(:,i);
% 
% end

%f0_e=mean([f01_corr';f01_ceps']);

%te=te1;

%% calcola parametri temporali su Teager transform
for i = 2 : length(x)-1
    T(i)=x(i).^2-x(i-1)*x(i+1);
end
T(1)=T(2);

%T=(T-mean(T))/std(T);
T_feat=feat_mom(T);

% calcola parametri su energia del segnale
[~,~,en_e]=smooth_pitch(tw,en,sel2,sig,intfa);
en_e(en_e<0)=0;
%en_e=(en_e)/std(en_e);
E_feat=feat_mom(en_e);

% calcolo decomposizione wavelet del pitch 
lev=8;
% qui devo fare statistica e poi wavelet
F0_n=std(f0_point)/mean(f0_point);
%f0_n=(f0_e-mean(f0_e))/std(f0_e);
%f0_n=(f0_e-mean(f0_e));

[SWA,SWD] = swt(f0_mod,lev,'sym8');
for i = 1 : lev
Wa_feat(i,:)=feat_mom(SWA(i,:));
Wd_feat(i,:)=feat_mom(SWD(i,:));
end

% calcola parametri statistici su pitch e gmm
F0_feat=feat_mom(f0_point);

gmm_feat=pitch_feat_gmm(f0_point',4,0,'');

% parametri temporali sul pitch



% pendenza della retta di regressione
[tr_feat,tr]=pitch_feat_tr(t_point,f0_point);
% range
Ra_feat=max(f0_point)-min(f0_point);

% statistiche del polinomio di Legendre del quarto ordine
f0_1=(mapminmax(f0_mod'))';
P = legendre(4,f0_1);
coe=P(1,:);
%coe=(coe-mean(coe))/std(coe);
P_feat=feat_mom(coe);


% statistiche voiced su unvoiced
dind=diff(not(val));
v=find(dind==1);
nv=find(dind==-1);
if length(nv)>length(v)
    nv=nv(2:end);
end
if length(v)>length(nv)
    v=v(1:end-1);
end
tv=tw(nv)-tw(v); % lunghezza dei tratti vocali
if length(tv)==1
tv_feat=[sum(tv)/(tv) max(tv)/(tv)];
else
tv_feat=[sum(tv)/(tw(nv(end))-tw(nv(1))) max(tv)/(tw(nv(end))-tw(nv(1)))];
end
f0_n=f0_mod-mean(f0_mod);
for i = 2 : length(f0_n)-1
 if f0_n(i-1)*f0_n(i+1) <0 
     zc(i)=1;
 else
     zc(i)=0;
 end
end
ZC_feat=sum(zc)/(sum(tv));

% statistiche su formanti

FR=form(:,1)./form(:,2);
FR(isnan(FR) | isinf(FR))=[];
%FR_n=(FR-mean(FR))/std(FR);
FR_n=FR;
for i = 1 : size(form,2)
    app=form(:,i);
    app(isnan(app))=[];
    FOR_feat(i,:)=feat_mom(app);
    clear app;
    app=bwf(:,i);
    app(isnan(app))=[];
    BW_feat(i,:)=feat_mom(app);
    clear app;
end
FR_feat=feat_mom(FR_n);

a=Wa_feat(:,:);
b=Wd_feat(:,:);
c=FOR_feat(:,1:end);
d=BW_feat(:,1:end);
feat_speech=[T_feat E_feat a(:)' b(:)' F0_feat(1:end) F0_n gmm_feat ZC_feat tr_feat Ra_feat P_feat(1:end) tv_feat FR_feat(1:end) c(:)' d(:)'];





