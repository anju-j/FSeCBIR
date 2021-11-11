------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
								FSeCBIR: A Faster Secure Content-Based Image Retrieval for Cloud
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Authors and Affiliations	:	Anju J, Department of Computer Science and Engineering, College of Engineering Trivandrum, Thiruvananthapuram, Kerala, India-695016. 
					Affiliated to APJ Abdul Kalam Technological University, Thiruvananthapuram, Kerala, India-695016. 
					Email: anjuj@cet.ac.in
					
					Shreelekshmi R, Department of Information Technology, Government Engineering College Barton Hill, Thiruvananthapuram, Kerala, India-695035. 
					Affiliated to APJ Abdul Kalam Technological University, Thiruvananthapuram, Kerala, India-695016. 					
					Email: shreelekshmir@gecbh.ac.in

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
											ABSTRACT
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				
	In recent years, content-based image retrieval in encrypted domain has emerged as an important challenge in cloud environment. We present a software, FSeCBIR that provides Faster and Secure Content-Based Image Retrieval ensuring secure search and retrieval in large encrypted image databases outsourced in cloud. This software also provides a copy deterrence module to identify data leaks through untrustworthy query users. FSeCBIR can be used in real-time applications involving sensitive information which demand high level of security, retrieval precision and less time/space complexity.

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
								  		HOW TO RUN THE SCRIPTS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Pre-requisite	: 		MATLAB
To Run		:		Run shell script './run.sh' in terminal Or run `main.m' in MATLAB.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
Files and Folders:

data/		-	Contains Readme.txt and Sample_Results.txt
data/dataset/	-	Contains datasets used in the experiments.
			corel_1k/	-	Corel-1k Image dataset. URL: http://wang.ist.psu.edu/~jwang/test1.tar. Accessed on 1 June 2019. 
			corel1kfeature/ -	Feature vectors of images in Corel-1k dataset. Five MPEG-7 visual descriptors (Cited as: Manjunath, B.S., Ohm, J.R., Vasudevan, V.V., Yamada, A., 2001. 							Color and texture descriptors. IEEE Transactions on circuits and systems for video technology 11, 703–715):
    						--Color Structure Descriptor (CSD)
    						--Scalable Color Descriptor (SCD)
    						--Color Layout Descriptor (CLD)
    						--Edge Histogram Descriptor (EHD) and 
    						--Dominant Color Descriptor (DCD)

						The features are extracted using MPEG-7 Low Level Feature Extraction Library in the article: Muhammet Bastan, Hayati Cam, Ugur Gudukbay and Ozgur Ulusoy, 						"BilVideo-7: An MPEG-7 Compatible Video Indexing and Retrieval System", IEEE MultiMedia, vol. 17, no. 3, pp. 62-73, July-September 2010.
					
			entire/	-	Feature vectors of 10000 images in Corel-10k (URL: http://www.ci.gxnu.edu.cn/cbir/Dataset.aspx. Accessed on 1 Jan 2019) datasets. 
			distinct/	-	Feature vectors of 2000 images belonging to 20 distinct image categories in Corel-10k dataset.
			similar/	-	Feature vectors of 2000 images belonging to 20 similar image categories in Corel-10k dataset.
			combined/	-	To analyse the combined effect of two MPEG-7 visual descriptors, two feature vectors of images in Corel-10k dataset are concatenated to generate a 						combined feature vector. 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------				
License: MIT License

Copyright © 2021 ANJU J
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
