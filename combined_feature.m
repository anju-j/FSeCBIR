function combined= combined_feature(f1,f2)      %   Feature vectors of n images (n*d) where d is the dimension of feature vector
l1=size(f1,1);
l2=size(f2,1);
l3=size(f1,2);
combined=zeros(l1+l2,l3);
combined(1:l1,:)=f1;
combined(l1+1:l1+l2,:)=f2;
