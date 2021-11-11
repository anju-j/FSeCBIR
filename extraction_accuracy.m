function accuracy=extraction_accuracy(original_wm,extracted_wm)     %   Accuracy of extracted watermark
    Nw=size(original_wm,2);         %   Nw is the size of the watermark
    Ne=0;
    for i=1:Nw
        if original_wm(1,i)==extracted_wm(1,i)
            Ne=Ne+1;                %   Ne is the count of correctly extracted watermarks
        end
    end
    accuracy=(Ne/Nw)*100;           %   No. of watermark bits correctly extracted/ Total number of watermark bits
end