function time_analysis_corel10k(n_times)
index_time=zeros(5,5);                              % Rows indicate 5 feature descriptors and columns indicate number of images in the collection
trapdoor_time=zeros(1,5);                           % Columns indicate 5 feature descriptors
search_time=zeros(5,5);                             % Rows indicate 5 feature descriptors and columns indicate number of images in the collection

%% 
num_cluster1=40;                                     
low=1;
%----------------------------------CSD--------------------------------------------------------------------
i=1;
load('./data/dataset/entire/csd_entire.mat');                      %   CSD feature vector of all images in Corel-10k dataset
for j=1:5
    high=j*2000;
    n_query=(high/100)*2;                                   %   Two queries per image category
    query_set=randi(high,1,n_query);
    dataset=csd_all(low:high,:);
    num_cluster=num_cluster1+(20*(i-1));
    [avg_precision(j,:),avg_time(j,:)]=repeat_n_times(dataset, query_set, n_times, num_cluster);
end
index_time(i,:)=avg_time(:,1)';                                % Index generation time of CSD in seconds
trapdoor_time(1,i)=mean(avg_time(:,2));                        % Trapdoor generation time of each query for CSD in milliseconds
search_time(i,:)=avg_time(:,1)';                               % Search time of each query for CSD in milliseconds

%----------------------------------SCD--------------------------------------------------------------------
i=i+1;
load('./data/dataset/entire/scd_entire.mat');       %   SCD feature vector of all images in Corel-10k dataset
for j=1:5
    high=j*2000;
    n_query=(high/100)*2;                                   %   Two queries per image category
    query_set=randi(high,1,n_query);
    dataset=scd_all(low:high,:);
    num_cluster=num_cluster1+(20*(i-1));
    [avg_precision(j,:),avg_time(j,:)]=repeat_n_times(dataset, query_set, n_times, num_cluster);
end
index_time(i,:)=avg_time(:,1)';                                % Index generation time of SCD in seconds
trapdoor_time(1,i)=mean(avg_time(:,2));                             % Trapdoor generation time of each query for SCD in milliseconds
search_time(i,:)=avg_time(:,1)';                               % Search time of each query for SCD in milliseconds
%----------------------------------CLD--------------------------------------------------------------------
i=i+1;
load('./data/dataset/entire/cld_entire.mat');       %   CLD feature vector of all images in Corel-10k dataset
for j=1:5
    high=j*2000;
    n_query=(high/100)*2;                                   %   Two queries per image category
    query_set=randi(high,1,n_query);
    dataset=cld_all(low:high,:);
    num_cluster=num_cluster1+(20*(i-1));
    [avg_precision(j,:),avg_time(j,:)]=repeat_n_times(dataset, query_set, n_times, num_cluster);
end
index_time(i,:)=avg_time(:,1)';                                % Index generation time of CLD in seconds
trapdoor_time(1,i)=mean(avg_time(:,2));                             % Trapdoor generation time of each query for CLD in milliseconds
search_time(i,:)=avg_time(:,1)';                               % Search time of each query for CLD in milliseconds
%----------------------------------EHD--------------------------------------------------------------------
i=i+1;
load('./data/dataset/entire/ehd_entire.mat');       %   EHD feature vector of all images in Corel-10k dataset
for j=1:5
    high=j*2000;
    n_query=(high/100)*2;                                   %   Two queries per image category
    query_set=randi(high,1,n_query);
    dataset=ehd_all(low:high,:);
    num_cluster=num_cluster1+(20*(i-1));
    [avg_precision(j,:),avg_time(j,:)]=repeat_n_times(dataset, query_set, n_times, num_cluster);
end
index_time(i,:)=avg_time(:,1)';                                % Index generation time of EHD in seconds
trapdoor_time(1,i)=mean(avg_time(:,2));                             % Trapdoor generation time of each query for EHD in milliseconds
search_time(i,:)=avg_time(:,1)';                               % Search time of each query for EHD in milliseconds

%----------------------------------DCD--------------------------------------------------------------------
i=i+1;
load('./data/dataset/entire/dcd_entire.mat');       %   DCD feature vector of all images in Corel-10k dataset
for j=1:5
    high=j*2000;
    n_query=(high/100)*2;                                   %   Two queries per image category
    query_set=randi(high,1,n_query);
    dataset=dcd_all(low:high,:);
    num_cluster=num_cluster1+(20*(i-1));
    [avg_precision(j,:),avg_time(j,:)]=repeat_n_times(dataset, query_set, n_times, num_cluster);
end
index_time(i,:)=avg_time(:,1)';                                % Index generation time of DCD in seconds
trapdoor_time(1,i)=mean(avg_time(:,2));                             % Trapdoor generation time of each query for DCD in milliseconds
search_time(i,:)=avg_time(:,1)';                               % Search time of each query for DCD in milliseconds

disp('----------------------------------------------------------------------------------------');
disp('Index generation time (s) for different sizes (n) of images in Corel-10k Dataset');
disp('----------------------------------------------------------------------------------------');
fprintf("Feature   n=2000 \t n=4000 \t n=6000 \t n=8000 \t n=10000"); %top-r retrieved images
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
disp('Search time (ms)per query for different sizes (n) of images in Corel-10k Dataset');
disp('----------------------------------------------------------------------------------------');
fprintf("Feature   n=2000 \t n=4000 \t n=6000 \t n=8000 \t n=10000"); %top-r retrieved images
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
disp('Trapdoor generation time (ms) per query  in Corel-10k Dataset');
disp('----------------------------------------------------------------------------------------');
fprintf("CSD \t SCD \t CLD \t EHD \t DCD\n"); %top-r retrieved images
avg_trpadoor=trapdoor_time(1,:);
fmt=[ repmat('%.2f \t',1,numel(trapdoor_time(1,:)))];
fprintf(fmt,trapdoor_time(1,:));  
fprintf('\n');

