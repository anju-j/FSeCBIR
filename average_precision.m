function  [precision,avg_precision]=average_precision(count_array)      %   Computes average precision averaged on number of queries
    num_queries=size(count_array,1);
    precision=zeros(num_queries,5);
  
    for i=1:num_queries
        for k=10:10:50                                                   %  Precision for top-10,20,30,40 and 50 retrieved images
            index=k/10;
            val=count_array(i,index);
            precision(i,index)=val/k;                                   %   No. of similar images retrieved/Total No. of retreievd images
        end
    end
    avg_precision=zeros(1,5);
    for i=1:5
        avg_precision(1,i)=mean(precision(:,i));                        %   Average precision averaged on all queries
    end
    
end
