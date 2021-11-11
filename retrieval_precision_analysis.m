function retrieval_precision_analysis(n_times)       % n_times-  No. of repetitions
%% Corel-1k dataset
disp('----------------------------------------------------------------------------------------');
disp('                      Retrieval Precision of Corel-1k Dataset                                       ');
disp('----------------------------------------------------------------------------------------');
i=1;
query_set_corel1k=[20,25,105,115,206,234,322,351,434,467,522,539,601,662,716,782,803,831,911,916];  %   Query set initialized for reproducibility
load('./data/dataset/corel1kfeature/csd_corel1k.mat','csd_corel1k');
dataset_csd_1k=csd_corel1k;                                                                         %   CSD feature vector of all images in Corel-1k dataset
num_cluster_1k=15; % Parameter - number of cluster
[avg_precision_1k(i,:),avg_time_1k(i,:),avg_storage(i,:)]=repeat_n_times(dataset_csd_1k, query_set_corel1k, n_times, num_cluster_1k);
fprintf("Feature   r=10 \t r=20  \t  r=30  \t  r=40  \t  r=50\n"); %top-r retrieved images
disp('----------------------------------------------------------------------------------------');
fmt=['\nCSD\t' repmat(' %.2f \t',1,numel(avg_precision_1k(i,:)))];
fprintf(fmt,avg_precision_1k(i,:));                                                                 
i=i+1;
load('./data/dataset/corel1kfeature/scd_corel1k.mat','scd_corel1k');
dataset_scd_1k=scd_corel1k;                                                                         %   SCD feature vector of all images in Corel-1k dataset
[avg_precision_1k(i,:),avg_time_1k(i,:),avg_storage(i,:)]=repeat_n_times(dataset_scd_1k, query_set_corel1k, n_times, num_cluster_1k);
fmt=['\nSCD\t' repmat(' %.2f \t',1,numel(avg_precision_1k(i,:)))];
fprintf(fmt,avg_precision_1k(i,:));                                                                 

i=i+1;
load('./data/dataset/corel1kfeature/cld_corel1k.mat','cld_corel1k');
dataset_cld_1k=cld_corel1k;                                                                         %   CLD feature vector of all images in Corel-1k dataset
[avg_precision_1k(i,:),avg_time_1k(i,:),avg_storage(i,:)]=repeat_n_times(dataset_cld_1k, query_set_corel1k, n_times, num_cluster_1k);
fmt=['\nCLD\t' repmat(' %.2f \t',1,numel(avg_precision_1k(i,:)))];
fprintf(fmt,avg_precision_1k(i,:));

i=i+1;
load('./data/dataset/corel1kfeature/ehd_corel1k.mat','ehd_corel1k');
dataset_ehd_1k=ehd_corel1k;                                                                         %   EHD feature vector of all images in Corel-1k dataset
[avg_precision_1k(i,:),avg_time_1k(i,:),avg_storage(i,:)]=repeat_n_times(dataset_ehd_1k, query_set_corel1k, n_times, num_cluster_1k);
fmt=['\nEHD\t' repmat(' %.2f \t',1,numel(avg_precision_1k(i,:)))];
fprintf(fmt,avg_precision_1k(i,:));

i=i+1;
load('./data/dataset/corel1kfeature/dcd_corel1k.mat','dcd_corel1k');
dataset_dcd_1k=dcd_corel1k;                                                                         %   DCD feature vector of all images in Corel-1k dataset
[avg_precision_1k(i,:),avg_time_1k(i,:),avg_storage(i,:)]=repeat_n_times(dataset_dcd_1k, query_set_corel1k, n_times, num_cluster_1k);
fmt=['\nDCD\t' repmat(' %.2f \t',1,numel(avg_precision_1k(i,:)))];
fprintf(fmt,avg_precision_1k(i,:));
fprintf('\n');
time_analysis_corel1k(n_times);                                                                      %   Time analysis in Corel-1k dataset
%% Corel-10k dataset- Distinct
disp('----------------------------------------------------------------------------------------');
disp('                   Retrieval Precision of Distinct categories in Corel-10k Dataset                           ');
disp('----------------------------------------------------------------------------------------');
fprintf("Feature   r=10  \t  r=20  \t  r=30  \t  r=40  \t  r=50\n");
disp('----------------------------------------------------------------------------------------');

% Image categories  5,8,15,16,17,18,20,21,35,39,42,43,52,56,58,61,70,82,92,94 
% are selected as distinct categories
i=1;
query_set_distinct=[20,25,105,115,206,234,322,351,434,467,522,539,601,662,716,782,803,831,911,916,1045,1055,1128,1136,1227,1235,1319,1326,1428,1430,1530,1542,1621,1626,1716,1722,1829,1845,1925,1938];  %   Query set initialized for reproducibility
load('./data/dataset/distinct/csd_distinct.mat','csd_distinct');                     %   CSD feature vector of all images in 20 distinct categories in Corel-10k dataset
dataset_csd_distinct=csd_distinct;
num_cluster_distinct=35;
[avg_precision_distinct(i,:),avg_time_distinct(i,:),avg_storage_distinct(i,:)]=repeat_n_times(dataset_csd_distinct, query_set_distinct, n_times, num_cluster_distinct);
fmt=['\nCSD\t' repmat(' %.2f \t',1,numel(avg_precision_distinct(i,:)))];
fprintf(fmt,avg_precision_distinct(i,:));

i=i+1;
load('./data/dataset/distinct/scd_distinct.mat','scd_distinct');                    %   SCD feature vector of all images in 20 distinct categories in Corel-10k dataset
dataset_scd_distinct=scd_distinct;
[avg_precision_distinct(i,:),avg_time_distinct(i,:),avg_storage_distinct(i,:)]=repeat_n_times(dataset_scd_distinct, query_set_distinct, n_times, num_cluster_distinct);
fmt=['\nSCD\t' repmat(' %.2f \t',1,numel(avg_precision_distinct(i,:)))];
fprintf(fmt,avg_precision_distinct(i,:));

i=i+1;
load('./data/dataset/distinct/cld_distinct.mat','cld_distinct');                    %   CLD feature vector of all images in 20 distinct categories in Corel-10k dataset
dataset_cld_distinct=cld_distinct;
[avg_precision_distinct(i,:),avg_time_distinct(i,:),avg_storage_distinct(i,:)]=repeat_n_times(dataset_cld_distinct, query_set_distinct, n_times, num_cluster_distinct);
fmt=['\nCLD\t' repmat(' %.2f \t',1,numel(avg_precision_distinct(i,:)))];
fprintf(fmt,avg_precision_distinct(i,:));

i=i+1;
load('./data/dataset/distinct/ehd_distinct.mat','ehd_distinct');                    %   EHD feature vector of all images in 20 distinct categories in Corel-10k dataset
dataset_ehd_distinct=ehd_distinct;
[avg_precision_distinct(i,:),avg_time_distinct(i,:),avg_storage_distinct(i,:)]=repeat_n_times(dataset_ehd_distinct, query_set_distinct, n_times, num_cluster_distinct);
fmt=['\nEHD\t' repmat(' %.2f \t',1,numel(avg_precision_distinct(i,:)))];
fprintf(fmt,avg_precision_distinct(i,:));

i=i+1;
load('./data/dataset/distinct/dcd_distinct.mat','dcd_distinct');                    %   DCD feature vector of all images in 20 distinct categories in Corel-10k dataset
dataset_dcd_distinct=dcd_distinct;
[avg_precision_distinct(i,:),avg_time_distinct(i,:),avg_storage_distinct(i,:)]=repeat_n_times(dataset_dcd_distinct, query_set_distinct, n_times, num_cluster_distinct);
fmt=['\nDCD\t' repmat(' %.2f \t',1,numel(avg_precision_distinct(i,:)))];
fprintf(fmt,avg_precision_distinct(i,:));
fprintf('\n');
%% Corel-10k dataset- Similar
i=1;
disp('----------------------------------------------------------------------------------------');
disp('              Retrieval Precision of Similar categories in Corel-10k Dataset                          ');
disp('----------------------------------------------------------------------------------------');
fprintf("Feature   r=10  \t  r=20  \t  r=30  \t  r=40  \t  r=50\n");
disp('----------------------------------------------------------------------------------------');
% Image categories 6,7,12,14,20,23,28,29,34,47,54,64,68,73,75,79,82,83,97,98 
% are selected as similar categories.

query_set_similar=[27,52,113,168,209,222,315,327,401,462,520,553,611,642,723,736,814,834,920,943,1029,1064,1114,1116,1224,1284,1332,1333,1414,1486,1549,1558,1616,1622,1762,1789,1876,1891,1958,1981];  %   Query set initialized for reproducibility
load('./data/dataset/similar/csd_similar.mat','csd_similar');                      %   CSD feature vector of all images in 20 similar categories in Corel-10k dataset
dataset_csd_similar=csd_similar;
num_cluster_csd_similar=30;
[avg_precision_similar(i,:),avg_time_similar(i,:),avg_storage_similar(i,:)]=repeat_n_times(dataset_csd_similar, query_set_similar, n_times, num_cluster_csd_similar);
fmt=['\nCSD\t' repmat(' %.2f \t',1,numel(avg_precision_similar(i,:)))];
fprintf(fmt,avg_precision_similar(i,:));

i=i+1;
load('./data/dataset/similar/scd_similar.mat','scd_similar');                       %   SCD feature vector of all images in 20 similar categories in Corel-10k dataset
dataset_scd_similar=scd_similar;
num_cluster_scd_similar=30;
[avg_precision_similar(i,:),avg_time_similar(i,:),avg_storage_similar(i,:)]=repeat_n_times(dataset_scd_similar, query_set_similar, n_times, num_cluster_scd_similar);
fmt=['\nSCD\t' repmat(' %.2f \t',1,numel(avg_precision_similar(i,:)))];
fprintf(fmt,avg_precision_similar(i,:));

i=i+1;
load('./data/dataset/similar/cld_similar.mat','cld_similar');                       %   CLD feature vector of all images in 20 similar categories in Corel-10k dataset
dataset_cld_similar=cld_similar;
num_cluster_cld_similar=30;
[avg_precision_similar(i,:),avg_time_similar(i,:),avg_storage_similar(i,:)]=repeat_n_times(dataset_cld_similar, query_set_similar, n_times, num_cluster_cld_similar);
fmt=['\nCLD\t' repmat(' %.2f \t',1,numel(avg_precision_similar(i,:)))];
fprintf(fmt,avg_precision_similar(i,:));

i=i+1;
load('./data/dataset/similar/ehd_similar.mat','ehd_similar');                       %   EHD feature vector of all images in 20 similar categories in Corel-10k dataset
dataset_ehd_similar=ehd_similar;
num_cluster_ehd_similar=30;
[avg_precision_similar(i,:),avg_time_similar(i,:),avg_storage_similar(i,:)]=repeat_n_times(dataset_ehd_similar, query_set_similar, n_times, num_cluster_ehd_similar);
fmt=['\nEHD\t' repmat(' %.2f \t',1,numel(avg_precision_similar(i,:)))];
fprintf(fmt,avg_precision_similar(i,:));

i=i+1;
load('./data/dataset/similar/dcd_similar.mat','dcd_similar');                       %   DCD feature vector of all images in 20 similar categories in Corel-10k dataset
dataset_dcd_similar=dcd_similar;
num_cluster_dcd_similar=15;
[avg_precision_similar(i,:),avg_time_similar(i,:),avg_storage_similar(i,:)]=repeat_n_times(dataset_dcd_similar, query_set_similar, n_times, num_cluster_dcd_similar);
fmt=['\nDCD\t' repmat(' %.2f \t',1,numel(avg_precision_similar(i,:)))];
fprintf(fmt,avg_precision_similar(i,:));
fprintf('\n');

%% Corel-10k dataset- Entire
query_set_entire=[59,70,122,170,207,256,301,345,402,486,520,525,627,652,713,768,805,815,906,920,1010,1027,1137,1141,1209,1222,1307,1327,1415,1427,1506,1534,1622,1651,1734,1767,1822,1839,1924,1991,2001,2062,2116,2182,2217,2245,2320,2353,2407,2449,2503,2525,2630,2678,2708,2742,2811,2842,2923,2936,3022,3055,3102,3136,3228,3232,3312,3318,3414,3434,3503,3531,3629,3640,3713,3728,3828,3854,3911,3916,4036,4046,4121,4141,4245,4255,4328,4336,4426,4430,4506,4526,4623,4625,4720,4743,4821,4834,4913,4918,5011,5012,5106,5129,5227,5235,5321,5331,5429,5464,5534,5551,5619,5626,5723,5745,5828,5830,5945,5963,6043,6047,6130,6142,6227,6228,6340,6347,6414,6416,6529,6536,6606,6625,6725,6733,6824,6884,6920,6926,7021,7026,7128,7129,7237,7238,7332,7333,7422,7430,7514,7586,7632,7633,7760,7761,7853,7858,7949,7958,8012,8021,8138,8146,8216,8222,8362,8389,8438,8454,8536,8537,8641,8642,8725,8733,8830,8832,8929,8936,9020,9028,9117,9128,9229,9245,9321,9325,9425,9438,9518,9521,9622,9630,9776,9791,9858,9881,9938,9942];  %   Query set initialized for reproducibility
i=1;
disp('------------------------------------------------------------------------------------------------------------------');
disp('              Retrieval Precision of Corel-10k Dataset- All categories                             ');
disp('------------------------------------------------------------------------------------------------------------------');
fprintf("Feature   r=10 \t\t r=20   \t\t   r=30   \t\t   r=40   \t\t   r=50\n");
disp('------------------------------------------------------------------------------------------------------------------');

load('./data/dataset/entire/csd_entire.mat','csd_all');                         %   CSD feature vector of all images in Corel-10k dataset
dataset_csd_entire=csd_all;
num_cluster_csd_entire=130;
[avg_precision_entire(i,:),avg_time_entire(i,:),avg_storage(i,2)]=repeat_n_times(dataset_csd_entire, query_set_entire, n_times, num_cluster_csd_entire);
fmt=['\nCSD\t' repmat(' %.2f \t\t',1,numel(avg_precision_entire(i,:)))];
fprintf(fmt,avg_precision_entire(i,:));

i=i+1;
load('./data/dataset/entire/scd_entire.mat','scd_all');                        %   SCD feature vector of all images in Corel-10k dataset
dataset_scd_entire=scd_all;
num_cluster_scd_entire=40;
[avg_precision_entire(i,:),avg_time_entire(i,:),avg_storage(i,2)]=repeat_n_times(dataset_scd_entire, query_set_entire, n_times, num_cluster_scd_entire);
fmt=['\nSCD\t' repmat(' %.2f \t\t',1,numel(avg_precision_entire(i,:)))];
fprintf(fmt,avg_precision_entire(i,:));

i=i+1;
load('./data/dataset/entire/cld_entire.mat','cld_all');                        %   CLD feature vector of all images in Corel-10k dataset
dataset_cld_entire=cld_all;
num_cluster_cld_entire=130;
[avg_precision_entire(i,:),avg_time_entire(i,:),avg_storage(i,2)]=repeat_n_times(dataset_cld_entire, query_set_entire, n_times, num_cluster_cld_entire);
fmt=['\nCLD\t' repmat(' %.2f \t\t',1,numel(avg_precision_entire(i,:)))];
fprintf(fmt,avg_precision_entire(i,:));

i=i+1;
load('./data/dataset/entire/ehd_entire.mat','ehd_all');                        %   EHD feature vector of all images in Corel-10k dataset
dataset_ehd_entire=ehd_all;
num_cluster_ehd_entire=130;
[avg_precision_entire(i,:),avg_time_entire(i,:),avg_storage(i,2)]=repeat_n_times(dataset_ehd_entire, query_set_entire, n_times, num_cluster_ehd_entire);
fmt=['\nEHD\t' repmat(' %.2f \t\t',1,numel(avg_precision_entire(i,:)))];
fprintf(fmt,avg_precision_entire(i,:));

i=i+1;
load('./data/dataset/entire/dcd_entire.mat','dcd_all');                        %   DCD feature vector of all images in Corel-10k dataset
dataset_dcd_entire=dcd_all;
num_cluster_dcd_entire=40;
[avg_precision_entire(i,:),avg_time_entire(i,:),avg_storage(i,2)]=repeat_n_times(dataset_dcd_entire, query_set_entire, n_times, num_cluster_dcd_entire);
fmt=['\nDCD\t' repmat(' %.2f \t\t',1,numel(avg_precision_entire(i,:)))];
fprintf(fmt,avg_precision_entire(i,:));
fprintf('\n');
time_analysis_corel10k(n_times);                                %   Time analysis in entire Corel-10k dataset

%% Print Storage analysis results
disp('----------------------------------------------------------------------------------------');
disp('Storage requirements of the secure index (KB) in Corel-1k and Corel-10k datasets');
disp('----------------------------------------------------------------------------------------');
fprintf("Feature   Corel-1k \t Corel-10k\n"); %top-r retrieved images
disp('----------------------------------------------------------------------------------------');

fmt=['\nCSD\t' repmat(' %d \t\t',1,numel(avg_storage(1,:)))];
fprintf(fmt,avg_storage(1,:));   
fmt=['\nSCD\t' repmat(' %d \t\t',1,numel(avg_storage(2,:)))];
fprintf(fmt,avg_storage(2,:));   
fmt=['\nCLD\t' repmat(' %d \t\t',1,numel(avg_storage(3,:)))];
fprintf(fmt,avg_storage(3,:));   
fmt=['\nEHD\t' repmat(' %d \t\t',1,numel(avg_storage(4,:)))];
fprintf(fmt,avg_storage(4,:));   
fmt=['\nDCD\t' repmat(' %d \t\t',1,numel(avg_storage(5,:)))];
fprintf(fmt,avg_storage(5,:));   
fprintf('\n'); 

%% Combined features in Corel-10k dataset
query_set_combined=[59,70,122,170,207,256,301,345,402,486,520,525,627,652,713,768,805,815,906,920,1010,1027,1137,1141,1209,1222,1307,1327,1415,1427,1506,1534,1622,1651,1734,1767,1822,1839,1924,1991,2001,2062,2116,2182,2217,2245,2320,2353,2407,2449,2503,2525,2630,2678,2708,2742,2811,2842,2923,2936,3022,3055,3102,3136,3228,3232,3312,3318,3414,3434,3503,3531,3629,3640,3713,3728,3828,3854,3911,3916,4036,4046,4121,4141,4245,4255,4328,4336,4426,4430,4506,4526,4623,4625,4720,4743,4821,4834,4913,4918,5011,5012,5106,5129,5227,5235,5321,5331,5429,5464,5534,5551,5619,5626,5723,5745,5828,5830,5945,5963,6043,6047,6130,6142,6227,6228,6340,6347,6414,6416,6529,6536,6606,6625,6725,6733,6824,6884,6920,6926,7021,7026,7128,7129,7237,7238,7332,7333,7422,7430,7514,7586,7632,7633,7760,7761,7853,7858,7949,7958,8012,8021,8138,8146,8216,8222,8362,8389,8438,8454,8536,8537,8641,8642,8725,8733,8830,8832,8929,8936,9020,9028,9117,9128,9229,9245,9321,9325,9425,9438,9518,9521,9622,9630,9776,9791,9858,9881,9938,9942];  %   Query set initialized for reproducibility
i=1;
disp('-----------------------------------------------------------------------------------------------------------------------');
disp('                    Retrieval Precision of Corel-10k Dataset- Combined descriptors (All Categories)             ');
disp('-----------------------------------------------------------------------------------------------------------------------');
fprintf("Feature  \t r=10  \t\t  r=20   \t\t   r=30   \t\t   r=40   \t\t   r=50\n");
disp('----------------------------------------------------------------------------------------------------------------------');

%   Combined features are created by concatenating two repective feature vectors
load('./data/dataset/combined/entire/csd_scd_entire.mat','csd_scd_entire');           %   CSD+SCD combined feature vector of all images in Corel-10k dataset
dataset_csd_scd=csd_scd_entire';
avg_time_storage_combined=zeros(10,4);
num_cluster_csd_scd=35;
[avg_precision_combined(i,:),avg_time_storage_combined(i,1:3),avg_time_storage_combined(i,4)]=repeat_n_times(dataset_csd_scd, query_set_combined, n_times, num_cluster_csd_scd);
fmt=['\nCSD + SCD\t' repmat(' %.2f \t\t',1,numel(avg_precision_combined(i,:)))];
fprintf(fmt,avg_precision_combined(i,:));

i=i+1;
load('./data/dataset/combined/entire/csd_cld_entire.mat','csd_cld_entire');           %   CSD+CLD combined feature vector of all images in Corel-10k dataset
dataset_csd_cld=csd_cld_entire';
num_cluster_csd_cld=40;
[avg_precision_combined(i,:),avg_time_storage_combined(i,1:3),avg_time_storage_combined(i,4)]=repeat_n_times(dataset_csd_cld, query_set_combined, n_times, num_cluster_csd_cld);
fmt=['\nCSD + CLD\t' repmat(' %.2f \t\t',1,numel(avg_precision_combined(i,:)))];
fprintf(fmt,avg_precision_combined(i,:));

i=i+1;
load('./data/dataset/combined/entire/csd_ehd_entire.mat','csd_ehd_entire');           %   CSD+EHD combined feature vector of all images in Corel-10k dataset
dataset_csd_ehd=csd_ehd_entire';
num_cluster_csd_ehd=30;
[avg_precision_combined(i,:),avg_time_storage_combined(i,1:3),avg_time_storage_combined(i,4)]=repeat_n_times(dataset_csd_ehd, query_set_combined, n_times, num_cluster_csd_ehd);
fmt=['\nCSD + EHD\t' repmat(' %.2f \t\t',1,numel(avg_precision_combined(i,:)))];
fprintf(fmt,avg_precision_combined(i,:));

i=i+1;
load('./data/dataset/combined/entire/csd_dcd_entire.mat','csd_dcd_entire');           %   CSD+DCD combined feature vector of all images in Corel-10k dataset
dataset_csd_dcd=csd_dcd_entire';
num_cluster_csd_dcd=30;
[avg_precision_combined(i,:),avg_time_storage_combined(i,1:3),avg_time_storage_combined(i,4)]=repeat_n_times(dataset_csd_dcd, query_set_combined, n_times, num_cluster_csd_dcd);
fmt=['\nCSD + DCD\t' repmat(' %.2f \t\t',1,numel(avg_precision_combined(i,:)))];
fprintf(fmt,avg_precision_combined(i,:));

i=i+1;
load('./data/dataset/combined/entire/scd_cld_entire.mat','scd_cld_entire');           %   SCD+CLD combined feature vector of all images in Corel-10k dataset
dataset_scd_cld=scd_cld_entire';
num_cluster_scd_cld=30;
[avg_precision_combined(i,:),avg_time_storage_combined(i,1:3),avg_time_storage_combined(i,4)]=repeat_n_times(dataset_scd_cld, query_set_combined, n_times, num_cluster_scd_cld);
fmt=['\nSCD + CLD\t' repmat(' %.2f \t\t',1,numel(avg_precision_combined(i,:)))];
fprintf(fmt,avg_precision_combined(i,:));

i=i+1;
load('./data/dataset/combined/entire/scd_ehd_entire.mat','scd_ehd_entire');           %   SCD+EHD combined feature vector of all images in Corel-10k dataset
dataset_scd_ehd=scd_ehd_entire';
num_cluster_scd_ehd=30;
[avg_precision_combined(i,:),avg_time_storage_combined(i,1:3),avg_time_storage_combined(i,4)]=repeat_n_times(dataset_scd_ehd, query_set_combined, n_times, num_cluster_scd_ehd);
fmt=['\nSCD + EHD\t' repmat(' %.2f \t\t',1,numel(avg_precision_combined(i,:)))];
fprintf(fmt,avg_precision_combined(i,:));

i=i+1;
load('./data/dataset/combined/entire/scd_dcd_entire.mat','scd_dcd_entire');           %   SCD+DCD combined feature vector of all images in Corel-10k dataset
dataset_scd_dcd=scd_dcd_entire';
num_cluster_scd_dcd=40;
[avg_precision_combined(i,:),avg_time_storage_combined(i,1:3),avg_time_storage_combined(i,4)]=repeat_n_times(dataset_scd_dcd, query_set_combined, n_times, num_cluster_scd_dcd);
fmt=['\nSCD + DCD\t' repmat(' %.2f \t\t',1,numel(avg_precision_combined(i,:)))];
fprintf(fmt,avg_precision_combined(i,:));

i=i+1;
load('./data/dataset/combined/entire/cld_ehd_entire.mat','cld_ehd_entire');           %   CLD+EHD combined feature vector of all images in Corel-10k dataset
dataset_cld_ehd=cld_ehd_entire';
num_cluster_cld_ehd=145;
[avg_precision_combined(i,:),avg_time_storage_combined(i,1:3),avg_time_storage_combined(i,4)]=repeat_n_times(dataset_cld_ehd, query_set_combined, n_times, num_cluster_cld_ehd);
fmt=['\nCLD + EHD\t' repmat(' %.2f \t\t',1,numel(avg_precision_combined(i,:)))];
fprintf(fmt,avg_precision_combined(i,:));

i=i+1;
load('./data/dataset/combined/entire/cld_dcd_entire.mat','cld_dcd_entire');           %   CLD+DCD combined feature vector of all images in Corel-10k dataset
dataset_cld_dcd=cld_dcd_entire';
num_cluster_cld_dcd=230;
[avg_precision_combined(i,:),avg_time_storage_combined(i,1:3),avg_time_storage_combined(i,4)]=repeat_n_times(dataset_cld_dcd, query_set_combined, n_times, num_cluster_cld_dcd);
fmt=['\nCLD + DCD\t' repmat(' %.2f \t\t',1,numel(avg_precision_combined(i,:)))];
fprintf(fmt,avg_precision_combined(i,:));

i=i+1;
load('./data/dataset/combined/entire/ehd_dcd_entire.mat','ehd_dcd_entire');           %   EHD+DCD combined feature vector of all images in Corel-10k dataset
dataset_ehd_dcd=ehd_dcd_entire';
num_cluster_ehd_dcd=50;
[avg_precision_combined(i,:),avg_time_storage_combined(i,1:3),avg_time_storage_combined(i,4)]=repeat_n_times(dataset_ehd_dcd, query_set_combined, n_times, num_cluster_ehd_dcd);
fmt=['\nEHD + DCD\t' repmat(' %.2f \t\t',1,numel(avg_precision_combined(i,:)))];
fprintf(fmt,avg_precision_combined(i,:));
fprintf('\n');


%% Print Time and Storage analysis of Combined Descriptors
disp('--------------------------------------------------------------------------------------------------------------------------------------');
disp('                Time and Storage analysis of combined features in Corel-10k Dataset for n=10000                       ');
disp('--------------------------------------------------------------------------------------------------------------------------------------');
fprintf("Feature   Index generation (s) \t Trapdoor generation (ms)  \t Search time (ms) \t Storage requirements of index (KB)\n"); 
disp('--------------------------------------------------------------------------------------------------------------------------------------');

fmt=['\nCSD+SCD\t\t' repmat(' %.2f \t\t\t',1,numel(avg_time_storage_combined(1,:)))];
fprintf(fmt,avg_time_storage_combined(1,:));  
fmt=['\nCSD+CLD\t\t' repmat(' %.2f \t\t\t',1,numel(avg_time_storage_combined(2,:)))];
fprintf(fmt,avg_time_storage_combined(2,:));   
fmt=['\nCSD+EHD\t\t' repmat(' %.2f \t\t\t',1,numel(avg_time_storage_combined(3,:)))];
fprintf(fmt,avg_time_storage_combined(3,:));   
fmt=['\nCSD+DCD\t\t' repmat(' %.2f \t\t\t',1,numel(avg_time_storage_combined(4,:)))];
fprintf(fmt,avg_time_storage_combined(4,:));   
fmt=['\nSCD+CLD\t\t' repmat(' %.2f \t\t\t',1,numel(avg_time_storage_combined(5,:)))];
fprintf(fmt,avg_time_storage_combined(5,:));  
fmt=['\nSCD+EHD\t\t' repmat(' %.2f \t\t\t',1,numel(avg_time_storage_combined(6,:)))];
fprintf(fmt,avg_time_storage_combined(6,:));   
fmt=['\nSCD+DCD\t\t' repmat(' %.2f \t\t\t',1,numel(avg_time_storage_combined(7,:)))];
fprintf(fmt,avg_time_storage_combined(7,:));   
fmt=['\nCLD+EHD\t\t' repmat(' %.2f \t\t\t',1,numel(avg_time_storage_combined(8,:)))];
fprintf(fmt,avg_time_storage_combined(8,:));   
fmt=['\nCLD+DCD\t\t' repmat(' %.2f \t\t\t',1,numel(avg_time_storage_combined(9,:)))];
fprintf(fmt,avg_time_storage_combined(9,:));   
fmt=['\nEHD+DCD\t\t' repmat(' %.2f \t\t\t',1,numel(avg_time_storage_combined(10,:)))];
fprintf(fmt,avg_time_storage_combined(10,:)); 
fprintf('\n');
disp('---------------------------------------------------------------------------------------------------------------------');
fprintf('\n');

