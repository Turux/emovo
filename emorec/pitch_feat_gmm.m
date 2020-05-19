function [feat_gmm]=pitch_feat_gmm(f0_e,K,flag,emotions)
        point=f0_e;
        point=point(point>quantile(point,0.05)&point<quantile(point,0.95));
        point=point';
        % Inizialization using fuzzy c-means clustering
        mixture = initMixture(point,K);
        % Set the maximum number of iterations
        options = statset('MaxIter',2000,'Display','off');
        % GM model
        obj= gmdistribution.fit(point',K,'start',mixture,'Options',options,'Regularize',eps);
        for l= 1 : K
           muv(l)=obj.mu(l);
           sigma(l)=squeeze(obj.Sigma(l));
           comp(l)=obj.PComponents(l);
        end
         x=sortrows([muv' sigma' comp']);
         feat_gmm=[x(:,1)' x(:,2)' x(:,3)'];
             if flag
         figure(10);
         [n,c]=hist(f0_e,50);
         hold on;
         bar(c,n/(sum(n)*(c(2)-c(1))));
         hold on;
         gm_plot3(x,K,f0_e);
         title(emotions);
         hold on; 
             end
end
