function nerN=ENN(P,N)
train_data=[P;N];
mm=size(P,2);
ml=length(N(:,1));
m=length(P(:,1));
[ncb,dcb]=knnsearch(train_data,N,'K',37);
ncb(:,1)=[];
Z1=zeros(ml,36);
for i=1:ml
    for j=1:36
        if ncb(i,j)<m+1
            Z1(i,j)=Z1(i,j)+1;
        end
    end
    Z(i)=sum(Z1(i,:));
    if Z(i)>1
      N(i,:)=zeros(1,mm);
    else
      N(i,:)=xxx(i,:);
    end
end
N(all(N==0,2),:)=[];
end
