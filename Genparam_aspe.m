function [M1,M2,S]=Genparam_aspe(dim)   %   Generate parameters for ASPE
l=dim;
M1=randi([1 50],l+1,l+1);               %   M1 and M2 are two invertible matrices of size (l + 1) * (l + 1)
S=randi([0,1],1,l+1);                   %   S is a binary vector of length (l + 1)
M2=randi([1 50],l+1,l+1);
end
