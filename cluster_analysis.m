% effect of number of clusters (k) on number of computations (Nc)- for different
% sizes of image collection (n)
clear;
Nc=zeros(5,15);                 %   No of computations for each k for different number of image sizes
num_images=2000:2000:10000;     %   Different sizes of image collection
num_cluster=20:20:300;          %   Each cluster k=20,40,60,80,100,120,140,160,180,200,220,240,260,280,300

for i=1:5
    for j= 1:15            
        n=num_images(1,i);
        k=num_cluster(1,j);
        ndelta=floor(n/k);
        Nc(i,j)=k+ndelta;
    end
end
fprintf('\t\t\t\t\t No. of clusters (k)\n');

fprintf('n   '); disp(num_cluster);
fprintf('2000 '); disp(Nc(1,:));
fprintf('4000 '); disp(Nc(2,:));
fprintf('6000 '); disp(Nc(3,:));
fprintf('8000 '); disp(Nc(4,:));
fprintf('10000 '); disp(Nc(5,:));

