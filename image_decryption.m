function decrypted_image = image_decryption(streamkey,encrypted_image)        %   Decrypts encrypted image using secret stream key
r=size(encrypted_image,1);
c=size(encrypted_image,2);
decrypted_image=zeros(r,c,'uint8');
temp_p=false(1,8);
temp_b=false(1,8);
temp_d=false(1,8);
    for i=1:r
        for j=1:c
            for k=1:8
                k1=k-1;
                temp_p(1,k)=mod(floor(double(encrypted_image(i,j))/2^k1),2);
                temp_b(1,k)=mod(floor(double(streamkey(i,j))/2^k1),2);
                temp_d(1,k)=xor(temp_p(1,k),temp_b(1,k));                       %   XORing image pixel and stream bitwise
            end
           decrypted_image(i,j)=bi2de(temp_d(1,:),'right-msb');                 %   Converting XORed result to decimal value 
        end
    end
end