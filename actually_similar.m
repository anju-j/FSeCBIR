function count_array=actually_similar(query,i)     %   i is the sorted list of retreived images
    category= ceil(query/100);                     %   Determine the category of query image. 100 is size of each category
    high=category*100;
    low=high-100+1;
    count=0;
    count_array=zeros(1,5);   
        for k=1:5
             in=k*10;
              for z=1:in
                 if z>size(i,1)
                    break;
                end
                  if i(z,1)>=low && i(z,1)<=high
                        count=count+1;          %   Counts images belonging to the category of query image
                  end                
              end
              count_array(1,k)=count;           %   Counts similar images in top 10, 20, 30, 40 and 50 retrieved images
              count=0; 
        end
end