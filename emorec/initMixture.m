function mixture = initMixture(pixels, K)
 
% [c,U]=fcm(pixels,K,[2 100 1e-5 0]);
% maxU=max(U);
% for i=1:K
%     idx((U(i,:)==maxU))=i;
% end
% 
% 
 for i=1:K
     sigma(:,:,i)=1/K*var(pixels);
     mu(i)=i*(max(pixels)-min(pixels))/(K+1);
     p(i) = 1/K;
 end


%    for k=1:K
%       
%       p(k) = 1/K;
%       mu(k) = c(k);
%       sigma(:,:,k)=var_c(k);
%    end

mixture.mu=mu';
mixture.Sigma=sigma;
mixture.PComponents=p;


