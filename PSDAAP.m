clear;
clc;
function [PP1,PP2,PP3,PP4]=PSDAAP(positive,negative,Test_p,Test_p)
M1=length(positive);
x=(M1+1)/2;
%
n1=length(positive);
for i=1:n1
   P{1,i}(x)='';
   s=positive{1,i};
   positive{1,i}=s;
end
n2=length(negative);
%
for i=1:n2
   negative{1,i}(x)='';
   s=negative{1,i};
   negative{1,i}=s;
end
%
%—————————————————————————
AA='ACDEFGHIKLMNPQRSTVWYX';
M=length(negative{1,1}); %M=34
F1=zeros(21,M);%
F2=zeros(21,M);
for m=1:n1
    for j=1:M
        t=positive{1,m}(j);
        k=strfind(AA,t);
        F1(k,j)=F1(k,j)+1;
    end
end
%
for m=1:n2
    for j=1:M
        t=negative{1,m}(j);
        k=strfind(AA,t);
        F2(k,j)=F2(k,j)+1;
    end
end
%
F1= F1/n1;
F2= F2/n2;
%%%%%%
PP1=zeros(n1,M);
PP2=zeros(n2,M);
F=F1-F2;
for m=1:n1
    for j=1:M
        t=positive{1,m}(j);
        k=strfind(AA,t);
        PP1(m,j)=F(k,j);
    end
end
%%%%%
for m=1:n2
    for j=1:M
        t=negative{1,m}(j);
        k=strfind(AA,t);
        PP2(m,j)=F(k,j);
    end
end
n3=length(Test_p);
n4=length(Test_n);
for i=1:n3
	Test_p{1,i}(x)='';
	s=Test_p{1,i};
	Test_p{1,i}=s;
end
for i=1:n4
	Test_n{1,i}(x)='';
	s=Test_n{1,i};
	Test_n{1,i}=s;
end
PP3=zeros(n3,M);
PP4=zeros(n4,M);
for m=1:n3
    for j=1:M
        t1=Test_p{1,m}(j);
        k1=strfind(AA,t1);
        PP3(m,j)=F(k1,j);
    end
end
for m=1:n4
    for j=1:M
        t1=Test_n{1,m}(j);
        k1=strfind(AA,t1);
        PP4(m,j)=F(k1,j);
    end
end
