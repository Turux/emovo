function y=feat_mom(x)
y(1)=mean(x); % mediana
y(2)=std(x);% mad
y(3)=skewness(x); % skewness
y(4)=kurtosis(x); % kurtosis
y(5)=sum(x.^2)/length(x); % energy
id=(abs(x) < 10^(-6)*max(x));
y(6)=sum(log(abs(x(not(id)))).*abs(x(not(id))))/sum(not(id)); % entropy

% z(1)=y(1)/y(2);
% z(2)=y(3);
% z(3)=y(4);
% z(4:5)=y(5:6)/y(2);
