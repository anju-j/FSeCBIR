function [avg_precision,final_time,avg_storage_req]=repeat_n_times(dataset, query_set, n_times, num_cluster)    %   Repeats expeimenst n_times and average the results
searchable_index=struct([]);
time_taken=zeros(n_times,3);            
precision=zeros(n_times,5);
num_queries=size(query_set,2);

for i=1:n_times  
[searchable_index(i).secure_index, time_taken(i,:),precision(i,:)]=scbir_scheme(dataset,query_set,num_cluster);
end
%% Storage Analysis
save('./results/searchable_index1.mat','searchable_index');
s=dir('./results/searchable_index1.mat');
avg_storage_req=floor((s.bytes/1024)/n_times);                 % Storage requirements for the index in KB averaged on n_times repetition
delete('./results/searchable_index1.mat');
%% Average precision of top-10, 20, 30, 40, and 50 retrieved images
sum_pre=zeros(1,5);
for g=1:size(precision,1)
       sum_pre=sum_pre+ precision(g,:);
end
avg_precision=zeros(1,5);      
for k=1:size(sum_pre,2)
    avg_precision(1,k)=(sum_pre(1,k)/n_times)*100;
end

%% Time analysis - 1. Indexing time 2. Trapdoor generation time 3. Search time
sum_time=zeros(1,3);
for g=1:size(time_taken,1)
       sum_time=sum_time+ time_taken(g,:);
end

avg_time=zeros(1,3);
for k=1:size(sum_time,2)
    avg_time(1,k)=sum_time(1,k)/n_times;            %   Averaged on n_times repetitions
end
final_time(1,1)=avg_time(1,1);                      %   Indexing time(s)
final_time(1,2)=(avg_time(1,2)/num_queries)*1000;	%   Trapdoor generation time per query (ms)
final_time(1,3)=(avg_time(1,3)/num_queries)*1000;	%   Search time per query (ms)

