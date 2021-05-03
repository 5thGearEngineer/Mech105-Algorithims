function [base2] = binaryConverter(base10)
if base10 == 0
base2= 0;
else
base2= [];
while base10 ~= 0
  base2= [base10 - 2.*floor(base10./2), base2];
  base10= (base10 - base2(1))/2;
end
end
end