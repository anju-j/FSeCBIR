function encrypted_image=image_encryption(streamkey,I1)                 %   Encrypts image, I1 using secret stream key
r=size(I1,1);
c=size(I1,2);
encrypted_image=zeros(r,c,'uint8');
temp_p=false(1,8);
temp_b=false(1,8);
temp_e=false(1,8);
    for i=1:r
        for j=1:c
            for k=1:8
                k1=k-1;
                temp_p(1,k)=mod(floor(double(I1(i,j))/2^k1),2);
                temp_b(1,k)=mod(floor(double(streamkey(i,j))/2^k1),2);
                temp_e(1,k)=xor(temp_p(1,k),temp_b(1,k));               %   XORing image pixel and stream bitwise
            end
                encrypted_image(i,j)=bi2de(temp_e(1,:),'right-msb');    %   Converting XORed result to decimal value   
        end
    end
end
