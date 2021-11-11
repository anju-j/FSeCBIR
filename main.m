% -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
% 				A Faster Secure Content-Based Image Retrieval Using Clustering for Cloud
% -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
% This demo implements the SCBIR scheme proposed in the paper titled "A Faster Secure Content-Based Image Retrieval Using Clustering for Cloud", Expert Systems with Applications, 2021. 
% The scheme uses MPEG-7 visual descriptors extracted from images for indexing. The scheme enables cloud to perform secure search over encrypted images using a secure searchable index. 
% The secure searchable index uses clustering for indexing and Asymmetric scalar-product preserving encryption (ASPE) for protecting feature vectors in it. The proposed copy deterrence 
% mechanism embeds unique watermarks in retrieved encrypted images specific to each query users. This watermark is extracted from suspicious images to determine illegal query user. The 
% performance is evaluated using Corel-1k and Corel-10k datasets. The performance evaluation includes retrieval precision analysis, storage analysis, assessment of perceptual quality of 
% watermarked images and  time analysis for index generation, trapdoor generation, search and watermark embedding.      
% ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
% Author Affiliations: 	
%           Anju J. (Corresponding Author)
% 			Department of Computer Science and Engineering,
% 			College of Engineering Trivandrum,
% 			Thiruvananthapuram, Kerala, India-695016.
% 			Affiliated to APJ Abdul Kalam Technological University, 
% 			Thiruvananthapuram, Kerala, India-695016.
% 			
%
% 			Dr. Shreelekshmi R.
% 			Department of Computer Science and Engineering,
%           Government Engineering College,
% 			Thrissur, Kerala, India-680009.
% 			Affiliated to APJ Abdul Kalam Technological University, 
% 			Thiruvananthapuram, Kerala, India-695016.
% 			
% Corresponding Author E-mail:	anjuj@cet.ac.in
% %------------------------------------------------------------------------------------------------------
%main.m
clear;
diary ./results/Results.txt;
warning('off');
diary on;
n_times=20;                               %	Number of times the experiments are repeated	
retrieval_precision_analysis(n_times);	 %	Analyses Retrieval precision, storage and time requirements of SCBIR scheme using Corel-1k and Corel-10k datasets
main_copy_deterrence_sample;			 %	Analyses the performance of Copy-deterrence scheme on one sample image in Corel-1k dataset 
%main_copy_deterrence;                    %	To analyse the performance of Copy-deterrence scheme on entire Corel-1k dataset and obtain results
                                         %   averaged on 1000 images in it (reported in the article). --Commenting since we have already generated sample results using "main_copy_deterrence_sample".
diary off;
