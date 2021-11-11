function time_analysis_corel1k(n_times)             %   n_times- No. of repetitions
index_time=zeros(5,5);                              %   Rows indicate 5 feature descriptors and columns indicate number of images in the collection
trapdoor_time=zeros(1,5);                           %   Columns indicate 5 feature descriptors
search_time=zeros(5,5);                             %   Rows indicate 5 feature descriptors and columns indicate number of images in the collection

%% 
num_cluster_1k=10;                                  %   k=10 is fixed for Corel-1k dataset
low=1;
%----------------------------------CSD--------------------------------------------------------------------
i=1;
load('./data/dataset/corel1kfeature/csd_corel1k.mat');   %   CSD feature vector of all images in Corel-1k dataset
for j=1:5
    high=j*200;
    n_query=(high/100)*2;                           %   Two queries per image category
    query_set_1k=randi(high,1,n_query);
    dataset=csd_corel1k(low:high,:);
    [avg_precision_1k(j,:),avg_time_1k(j,:)]=repeat_n_times(dataset, query_set_1k, n_times, num_cluster_1k);
end
index_time(i,:)=avg_time_1k(:,1)';                  %   Index generation time of CSD in seconds
trapdoor_time(1,i)=mean(avg_time_1k(:,2));          %   Trapdoor generation time of each query for CSD in milliseconds
search_time(i,:)=avg_time_1k(:,1)';                 %   Search time of each query for CSD in milliseconds

%----------------------------------SCD--------------------------------------------------------------------
i=i+1;
load('./data/dataset/corel1kfeature/scd_corel1k.mat');   %   SCD feature vector of all images in Corel-1k dataset
for j=1:5
    high=j*200;
    n_query=(high/100)*2;                           %   Two queries per image category
    query_set_1k=randi(high,1,n_query);
    dataset=scd_corel1k(low:high,:);
    [avg_precision_1k(j,:),avg_time_1k(j,:)]=repeat_n_times(dataset, query_set_1k, n_times, num_cluster_1k);
end
index_time(i,:)=avg_time_1k(:,1)';                  %   Index generation time of SCD in seconds
trapdoor_time(1,i)=mean(avg_time_1k(:,2));          %   Trapdoor generation time of each query for SCD in milliseconds
search_time(i,:)=avg_time_1k(:,1)';                 %   Search time of each query for SCD in milliseconds
%----------------------------------CLD--------------------------------------------------------------------
i=i+1;
load('./data/dataset/corel1kfeature/cld_corel1k.mat');   %   CLD feature vector of all images in Corel-1k dataset
for j=1:5
    high=j*200;
    n_query=(high/100)*2;                           %   Two queries per image category
    query_set_1k=randi(high,1,n_query);
    dataset=cld_corel1k(low:high,:);
    [avg_precision_1k(j,:),avg_time_1k(j,:)]=repeat_n_times(dataset, query_set_1k, n_times, num_cluster_1k);
end
index_time(i,:)=avg_time_1k(:,1)';                  %   Index generation time of CLD in seconds
trapdoor_time(1,i)=mean(avg_time_1k(:,2));          %   Trapdoor generation time of each query for CLD in milliseconds
search_time(i,:)=avg_time_1k(:,1)';                 %   Search time of each query for CLD in milliseconds
%----------------------------------EHD--------------------------------------------------------------------
i=i+1;
load('./data/dataset/corel1kfeature/ehd_corel1k.mat');   %   EHD feature vector of all images in Corel-1k dataset
for j=1:5
    high=j*200;
    n_query=(high/100)*2;                           %   Two queries per image category
    query_set_1k=randi(high,1,n_query);
    dataset=ehd_corel1k(low:high,:);
    [avg_precision_1k(j,:),avg_time_1k(j,:)]=repeat_n_times(dataset, query_set_1k, n_times, num_cluster_1k);
end
index_time(i,:)=avg_time_1k(:,1)';                  %   Index generation time of EHD in seconds
trapdoor_time(1,i)=mean(avg_time_1k(:,2));          %   Trapdoor generation time of each query for EHD in milliseconds
search_time(i,:)=avg_time_1k(:,1)';                 %   Search time of each query for EHD in milliseconds

%----------------------------------DCD--------------------------------------------------------------------
i=i+1;
load('./data/dataset/corel1kfeature/dcd_corel1k.mat');   %   DCD feature vector of all images in Corel-1k dataset
for j=1:5
    high=j*200;
    n_query=(high/100)*2;                           %   Two queries per image category
    query_set_1k=randi(high,1,n_query);
    dataset=dcd_corel1k(low:high,:);
    [avg_precision_1k(j,:),avg_time_1k(j,:)]=repeat_n_times(dataset, query_set_1k, n_times, num_cluster_1k);
end
index_time(i,:)=avg_time_1k(:,1)';                  %    Index generation time of DCD in seconds
trapdoor_time(1,i)=mean(avg_time_1k(:,2));          %   Trapdoor generation time of each query for DCD in milliseconds
search_time(i,:)=avg_time_1k(:,1)';                 %   Search time of each query for DCD in milliseconds
%% Print time analysis results
disp('----------------------------------------------------------------------------------------');
disp('Index generation time (s) for different sizes (n) of images in Corel-1k Dataset');
disp('----------------------------------------------------------------------------------------');
fprintf("Feature   n=200     \t n=400     \t n=600     \t n=800    \t n=1000"); %	n-different sizes of image collection 
fmt=['\nCSD\t' repmat(' %.2f \t\t',1,numel(index_time(1,:)))];
fprintf(fmt,index_time(1,:));   
fmt=['\nSCD\t' repmat(' %.2f \t\t',1,numel(index_time(2,:)))];
fprintf(fmt,index_time(2,:));   
fmt=['\nCLD\t' repmat(' %.2f \t\t',1,numel(index_time(3,:)))];
fprintf(fmt,index_time(3,:));   
fmt=['\nEHD\t' repmat(' %.2f \t\t',1,numel(index_time(4,:)))];
fprintf(fmt,index_time(4,:));   
fmt=['\nDCD\t' repmat(' %.2f \t\t',1,numel(index_time(5,:)))];
fprintf(fmt,index_time(5,:));   
fprintf('\n'); 

disp('----------------------------------------------------------------------------------------');
disp('Search time (ms)per query for different sizes (n) of images in Corel-1k Dataset');
disp('----------------------------------------------------------------------------------------');
fprintf("Feature   n=200     \t n=400     \t n=600     \t n=800    \t n=1000"); %	n-different sizes of image collection 
fmt=['\nCSD\t' repmat(' %.2f \t\t',1,numel(search_time(1,:)))];
fprintf(fmt,search_time(1,:));   
fmt=['\nSCD\t' repmat(' %.2f \t\t',1,numel(search_time(2,:)))];
fprintf(fmt,search_time(2,:));   
fmt=['\nCLD\t' repmat(' %.2f \t\t',1,numel(search_time(3,:)))];
fprintf(fmt,search_time(3,:));   
fmt=['\nEHD\t' repmat(' %.2f \t\t',1,numel(search_time(4,:)))];
fprintf(fmt,search_time(4,:));   
fmt=['\nDCD\t' repmat(' %.2f \t\t',1,numel(search_time(5,:)))];
fprintf(fmt,search_time(5,:));   
fprintf('\n'); 

disp('----------------------------------------------------------------------------------------');
disp('Trapdoor generation time (ms) per query  in Corel-1k Dataset');
disp('----------------------------------------------------------------------------------------');
fprintf("CSD \t SCD \t CLD \t EHD \t DCD\n"); %top-r retrieved images
fmt=[ repmat('%.2f \t',1,numel(trapdoor_time(1,:)))];
fprintf(fmt,trapdoor_time(1,:));   
fprintf('\n');

