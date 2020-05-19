function [f0_corr,f0_ceps,tw,t_init,form,bwf,en,val,val2,x]=my_speech_proc(y,fs,ener)
Hd=filtro_ch2(fs);
x=filter(Hd,y); % per pitch
N=length(x);
t_init=[1:N].*1/fs; % tempo originario
nsample=1024; % numero campioni per ogni frame
overlap=nsample/2;
seg=N/nsample;
%nsample = round(30 * fs / 1000); %prendo finestre da 30ms e mi trovo il corrispondente numero di campioni
%overlap = round(20 * fs / 1000); %faccio sovrapporre le finestre per 20ms e mi trovo anche in questo caso il corrispondente
%numero di campioni

for i = 1 : floor(2*seg-1)
    frame=y(round((i-1)*overlap+1:min(overlap*i+overlap,N)));
    frame=frame-mean(frame);
    en(i)=sum(frame.^2);
    clear frame;
end
val=en<ener*max(en); % booleano dei tratti vocali e non 0.05
ms2=fs/1000*48000/fs; % numero di campioni in 2ms
ms20=fs/100*48000/fs;  %numero di campioni in 20 ms
maxlag=fs/100*48000/fs;
for i = 1 : floor(2*seg-1)
    frame=y(round((i-1)*overlap+1:min(overlap*i+overlap,N)));
    frame=frame-mean(frame);
    frame=frame.*hamming(length(frame));
    % stima pitch
    r=xcorr(frame,maxlag,'coeff');
    rr=r;
    rr = r(floor(length(rr)/2):end);
    [maxi,idx]=max(abs(rr(ms2:ms20)));
    f0_corr(i)= fs/(ms2+idx-1);
    
    zz=fft(frame,nsample);    
    c = ifft(log(abs(zz))+eps);
    [maxi_c,idx_c]=max(abs(c(ms2:ms20)));
    f0_ceps(i)= fs/(ms2+idx_c-1);
    tw(i)=t_init(round((i-1)*overlap+1+overlap/2));
    clear frame r rr maxi idx zz c maxi_c idx_c;
end

% figure(); plot(tw(not(val)),f0(not(val)),'b.');
% set(gca,'YLim',[0 500]);

% ora stimo le formanti
%preemph = [1 0.63];
%Hp = filter(1,preemph,y);
Hp=filter([1 -0.95],1,y); % preemphasi
%figure(); plot(t_init,Hp);
%Pb=filtro_pb;
%z=filter(Pb,Hp);
%figure(); plot(t_init,z);

ncoeff=48/(48000/fs);

for i = 1 : floor(2*seg-1)
    %if not(val(i))
    frame=Hp(round((i-1)*overlap+1:min(overlap*i+overlap,N)));
    frame=frame-mean(frame);
    %window = 'hamming';
    %window   = eval(sprintf('%s(nsample)', window));
    frame=frame.*hamming(length(frame));
    %frame=frame.*window(:);
    if sum(frame)==0
        form(i,1:4)=nan;
        bwf(i,1:4)=nan;
    else
    [a,p]=lpc(frame,ncoeff);    
    radici=roots(a);
    radici2=radici(imag(radici)>0.01);
    const=(fs)/(2*pi);
    formn=atan2(imag(radici2),real(radici2))*const;
    bw=-2*const*log(abs(radici2));    %formant bandwidth
    app=sortrows([formn bw]);
    form(i,1:4)=app(1:4,1);
    bwf(i,1:4)=app(1:4,2);
    clear a p radici radici2 app formn bw frame;
    %else
    %form(i,1:4)=nan;
    %bwf(i,1:4)=nan;
    %end
    end
end
val2=val;
val2(isnan(form(i,1:4)))=true;

% figure(); plot(tw(not(val)),form(not(val),:),'.');
% hold on; plot(F(:,1),F(:,2:5),'k.');