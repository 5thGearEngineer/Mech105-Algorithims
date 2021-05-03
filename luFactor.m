function [L, U, P] = luFactor(A)
% finds size of A
[m,n]=size(A);
% checks for errors in A, m must equal n
if m ~= n
    error('This matrix is not of the proper size') 
end
% Set variables, L becomes a function of ones on the diagonal, U is set
% equal to A, and P is set equal to L.
L=eye(m,n);
U=A;
P=L;
for y= 1:m
[p,g]= max(abs(U(y:m,y)));
g=g+y-1;
if g ~= y   
% Swap rows g and y in U
U([g,y],:)= U([y,g],:);
% Swap rows g and y in P
P([g,y],:)= P([y,g],:);
%swap rows g and y in columns y-1 of L
if y >= 2
    L([g,y],1:y-1)= L([y,g],1:y-1);
end
end
%Calculate L and U
  for x= y+1:n
      L(x,y)= U(x,y)/ U(y,y);
      U(x,:)= U(x,:)- L(x,y)*U(y,:);
      
end
end