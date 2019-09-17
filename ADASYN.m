function X=ADASYN(P,N)
train_data=[P;N];
train_label=[1*ones(1,size(P,1)),(-1)*ones(1,size(N,1))]';
ms=size(P,1);
mm=size(P,2);
ml=length(N(:,1));
L=ms+ml;
N=ml-ms;
[ncb,dcb]=knnsearch(train_data,P,'K',6);
dcb(:,1)=[];
ncb(:,1)=[];
Z1=zeros(ms,5);
for i=1:ms
    for j=1:5
        if ncb(i,j)>ms
            Z1(i,j)=Z1(i,j)+1;
        end
    end
end
g=zeros(1,ms);
for j=1:ms
    Z(j)=sum(Z1(j,:));
    r(j)=Z(j)./5;
end
for l=1:ms
    r1(l)=r(:,l)./(sum(r));
    g(l)=r1(l).*((ml-ms));
end
num=sum(round(g));
% %
AA=zeros(ms,1);
a=rand;
B=zeros(num,mm);
u1=1;
r2=0;
for t=1:ms
    g(:,t)=round(g(:,t));
    if g(:,t)==0
        continue
    end
    sample=zeros(g(:,t),mm);
    for s=1:g(:,t)
        b(s)=randperm(5,1);
        AA(t,1)=ncb(t,b(s));
        BB=train_data(AA(t,1),:);
        sample(s,:)=xx(t,:)+a*(BB-xx(t,:));
    end
    for k=g(:,t)
        %w=g(1,k);
        B(u1:k+r2,:)=B(u1:k+r2,:)+sample;
        u1=u1+s;
        r2=r2+g(1,t);
    end
end
Positive=[B;P];
Negative=N;
X=[Positive;Negative];
end
