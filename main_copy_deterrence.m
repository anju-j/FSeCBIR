clear;
srcFiles = dir('./data/dataset/corel_1k/*.jpg');     %       Path of dataset
lensrc=length(srcFiles);                        %       Run on entire Corel-1k dataset
%% Initialize result variables for storig results of all images
result=struct();
accuracy_bitflip_16=zeros(lensrc,9);
accuracy_bitflip_24=zeros(lensrc,9);
accuracy_bitflip_32=zeros(lensrc,9);

accuracy_jpeg_comp_16=zeros(lensrc,9);
accuracy_jpeg_comp_24=zeros(lensrc,9);
accuracy_jpeg_comp_32=zeros(lensrc,9);

result_without_attack_16=zeros(lensrc,4);
result_without_attack_24=zeros(lensrc,4);
result_without_attack_32=zeros(lensrc,4);
%%
for j =1:lensrc
    filename = strcat('./data/dataset/corel_1k/',srcFiles(j).name);
%      fprintf('\nIMAGE is');disp(j);
     name=srcFiles(j).name;
     n1=strsplit(name,'.');
     n2=strsplit(n1{1,1},'_');
     i1=n2{1,2};
     image_id=str2double(i1);                               %  Fetch image ID
     I1 = imread(filename);
     I=rgb2gray(I1);
     Nw=64;                                                  %   Number of watermark bits
     watermark_value=randi(10000000000000,1,1);              %   Unique to each query user
     watermark=de2bi(watermark_value,Nw);                    %   Convert to binary
     [accuracy_bitflip,accuracy_jpeg_comp,result_without_attack]=watermark_main(image_id,I,watermark);       % Analyse PSNR,SSIM, embedding time, and extraction accuracies under JPEG compression and bit flipping attacks.
     
     accuracy_bitflip_16(j,:)=accuracy_bitflip(1,:);
     accuracy_bitflip_24(j,:)=accuracy_bitflip(2,:);
     accuracy_bitflip_32(j,:)=accuracy_bitflip(3,:);
     
     accuracy_jpeg_comp_16(j,:)=accuracy_jpeg_comp(1,:);
     accuracy_jpeg_comp_24(j,:)=accuracy_jpeg_comp(2,:);
     accuracy_jpeg_comp_32(j,:)=accuracy_jpeg_comp(3,:);
     
     result_without_attack_16(j,:)=result_without_attack(1,:);
     result_without_attack_24(j,:)=result_without_attack(2,:);
     result_without_attack_32(j,:)=result_without_attack(3,:);
end
%% Results averaged on 1000 images
result.accuracy_bitflip(1,:)=floor(mean(accuracy_bitflip_16));             
result.accuracy_bitflip(2,:)=floor(mean(accuracy_bitflip_24));
result.accuracy_bitflip(3,:)=floor(mean(accuracy_bitflip_32));

result.accuracy_jpeg_comp(1,:)=floor(mean(accuracy_jpeg_comp_16));
result.accuracy_jpeg_comp(2,:)=floor(mean(accuracy_jpeg_comp_24));
result.accuracy_jpeg_comp(3,:)=floor(mean(accuracy_jpeg_comp_32));

result.result_without_attack(1,:)=mean(result_without_attack_16);
result.result_without_attack(2,:)=mean(result_without_attack_24);
result.result_without_attack(3,:)=mean(result_without_attack_32);
%% Print results
disp('---------------------------------------------------------------------------------------------------------------------');
disp('                     Analysis of Copy-deterrence in Corel-1k Dataset (averaged on 1000 images)             ');
disp('---------------------------------------------------------------------------------------------------------------------');
fprintf("Block size \t PSNR (dB) \t\t SSIM \t\t Embedding time (s) \t Extraction accuracy without attack\n"); 
disp('---------------------------------------------------------------------------------------------------------------------');

fmt=['\n16\t\t' repmat(' %.4f \t\t',1,numel(result.result_without_attack(1,:)))];
fprintf(fmt,result.result_without_attack(1,:));  
fmt=['\n24\t\t' repmat(' %.4f \t\t',1,numel(result.result_without_attack(2,:)))];
fprintf(fmt,result.result_without_attack(2,:));  
fmt=['\n32\t\t' repmat(' %.4f \t\t',1,numel(result.result_without_attack(3,:)))];
fprintf(fmt,result.result_without_attack(3,:));
fprintf('\n');
disp('---------------------------------------------------------------------------------------------------------------------------------------');
disp('                      Extraction Accuracy under JPEG Compression Attack at different quality factors (averaged on 1000 images)                                        ');
disp('---------------------------------------------------------------------------------------------------------------------------------------');
fprintf("Block size \t QF=60   QF=65   QF=70   QF=75   QF=80   QF=85   QF=90  QF=95   QF=100\n"); 
disp('----------------------------------------------------------------------------------------------------------------------------------------');
fmt=['\n16\t\t' repmat(' %d\t',1,numel(result.accuracy_jpeg_comp(1,:)))];
fprintf(fmt,result.accuracy_jpeg_comp(1,:));  
fmt=['\n24\t\t' repmat(' %d\t',1,numel(result.accuracy_jpeg_comp(2,:)))];
fprintf(fmt,result.accuracy_jpeg_comp(2,:));  
fmt=['\n32\t\t' repmat(' %d\t',1,numel(result.accuracy_jpeg_comp(3,:)))];
fprintf(fmt,result.accuracy_jpeg_comp(3,:));
fprintf('\n');

disp('-----------------------------------------------------------------------------------------------------------------------------------------');
disp('                Extraction Accuracy under Bit-Flipping Attack at different bit-flipping proportions  (averaged on 1000 images)                                   ');
disp('------------------------------------------------------------------------------------------------------------------------------------------');
fprintf("Block size  \t 10 \t  15 \t  20  \t 25 \t  30  \t 35  \t 40  \t 45 \t 50\n"); 
disp('------------------------------------------------------------------------------------------------------------------------------------------');

fmt=['\n16\t\t' repmat(' %d\t',1,numel(result.accuracy_bitflip(1,:)))];
fprintf(fmt,result.accuracy_bitflip(1,:));  
fmt=['\n24\t\t' repmat(' %d\t',1,numel(result.accuracy_bitflip(2,:)))];
fprintf(fmt,result.accuracy_bitflip(2,:));  
fmt=['\n32\t\t' repmat(' %d\t',1,numel(result.accuracy_bitflip(3,:)))];
fprintf(fmt,result.accuracy_bitflip(3,:));
fprintf('\n');
