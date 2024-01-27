
function [clusters, centroids] = k_means(X, k)

[N,d]=size(X);

r=zeros(N,k);   % matrix with one hot vectors to represent its assigned cluster 
centroids= 2*rand(k,2) -1; % Random initialization of centeroids
clusters=zeros(N,1);

for iterations=1:5
    % Estep
    for n=1:N
        r(n,1:k)=zeros(1,k);
        vecnorm(repmat(X(n,:), k, 1)-centroids,2,2);
        [M,I]=min(vecnorm(repmat(X(n,:), k, 1)-centroids,2,2).^2);
        r(n,I)=1;
    end
    % fprintf("loss after E step");
    % loss=0;
    % for n=1:N
    %     for K=1:k
    %         loss=loss+r(n,K)*(norm((X(n)-centroids(K)),2)^2);
    %     end
    % end
    % loss
    
    % M step
    for j=1:k
        if(sum(r(:,j))~=0)
            centroids(j,:)=(r(:,j)'*X)/(sum(r(:,j)));
        end
    end
    % fprintf("loss after M step");
    % loss=0;
    % for n=1:N
    %     for K=1:k
    %         loss=loss+r(n,K)*(norm((X(n)-centroids(K)),2)^2);
    %     end
    % end
    % loss
end

for p=1:N
    for q=1:k
        if r(p,q)==1
            clusters(p)=q;
        end
    end
end


