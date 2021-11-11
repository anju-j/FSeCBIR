clear;
srcFiles = dir('./data/dataset/corel_1k/*.jpg');        % Path of dataset
lensrc=length(srcFiles);

for j =1:1%lensrc                                  % Run copy deterrence on first image in Corel-1k dataset        
     filename = strcat('./data/dataset/corel_1k/',srcFiles(j).name);
     name=srcFiles(j).name;
     n1=strsplit(name,'.');
     n2=strsplit(n1{1,1},'_');
     i1=n2{1,2};
     image_id=str2double(i1);                                %  Fetch image ID
     I1 = imread(filename);
     I=rgb2gray(I1);
     Nw=64;                                                  %   Number of watermark bits
     watermark_value=randi(10000000000000,1,1);              %   Unique to each query user
     watermark=de2bi(watermark_value,Nw);                    %   Convert to binary
     [accuracy_bitflip,accuracy_jpeg_comp,result_without_attack]=watermark_main(image_id,I,watermark);      % Analyse PSNR,SSIM, embedding time, and extraction accuracies under JPEG compression and bit flipping attacks.
end
%% Print results
disp('---------------------------------------------------------------------------------------------------------------------');
disp('                     Analysis of Copy-deterrence in one sample image (ID: 0_0.jpg) in Corel-1k Dataset             ');
disp('---------------------------------------------------------------------------------------------------------------------');
fprintf("Block size \t PSNR (dB) \t\t SSIM \t\t Embedding time (s) \t Extraction accuracy without attack\n"); 
disp('---------------------------------------------------------------------------------------------------------------------');

fmt=['\n16\t\t' repmat(' %.4f \t\t',1,numel(result_without_attack(1,:)))];
fprintf(fmt,result_without_attack(1,:));  
fmt=['\n24\t\t' repmat(' %.4f \t\t',1,numel(result_without_attack(2,:)))];
fprintf(fmt,result_without_attack(2,:));  
fmt=['\n32\t\t' repmat(' %.4f \t\t',1,numel(result_without_attack(3,:)))];
fprintf(fmt,result_without_attack(3,:));
fprintf('\n');
disp('--------------------------------------------------------------------------------------------------------------------------------------');
disp('                      Extraction Accuracy under JPEG Compression Attack at different quality factors (in one sample image)         ');
disp('---------------------------------------------------------------------------------------------------------------------------------------');
fprintf("Block size \t QF=60   QF=65   QF=70   QF=75   QF=80   QF=85   QF=90  QF=95   QF=100\n"); 
disp('---------------------------------------------------------------------------------------------------------------------------------------');
fmt=['\n16\t\t' repmat(' %d\t',1,numel(accuracy_jpeg_comp(1,:)))];
fprintf(fmt,accuracy_jpeg_comp(1,:));  
fmt=['\n24\t\t' repmat(' %d\t',1,numel(accuracy_jpeg_comp(2,:)))];
fprintf(fmt,accuracy_jpeg_comp(2,:));  
fmt=['\n32\t\t' repmat(' %d\t',1,numel(accuracy_jpeg_comp(3,:)))];
fprintf(fmt,accuracy_jpeg_comp(3,:));
fprintf('\n');

disp('----------------------------------------------------------------------------------------------------------------------------------------');
disp('                Extraction Accuracy under Bit-Flipping Attack at different bit-flipping proportions  (in one sample image)                 ');
disp('----------------------------------------------------------------------------------------------------------------------------------------');
fprintf("Block size  \t 10 \t  15 \t  20  \t 25 \t  30  \t 35  \t 40  \t 45 \t 50\n"); 
disp('-----------------------------------------------------------------------------------------------------------------------------------------');

fmt=['\n16\t\t' repmat(' %d\t',1,numel(accuracy_bitflip(1,:)))];
fprintf(fmt,accuracy_bitflip(1,:));  
fmt=['\n24\t\t' repmat(' %d\t',1,numel(accuracy_bitflip(2,:)))];
fprintf(fmt,accuracy_bitflip(2,:));  
fmt=['\n32\t\t' repmat(' %d\t',1,numel(accuracy_bitflip(3,:)))];
fprintf(fmt,accuracy_bitflip(3,:));
fprintf('\n');
