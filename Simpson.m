function [I] = Simpson(x, y)
% checks the size of each matrix
[m,s]=size(x);
[k,g]=size(y);
% If this function is equal to zero, x is equally spaced.
p=(x(2:end)-x(1:end-1));
e = max(p) - min(p);
%Checks if there are two inputs
if nargin ~= 2
   error('Input the correct number of arrays')
end
%Checks if x is equally spaced
if e ~= 0
   error('x array is not equally spaced')
end
%Checks if the matrices match in height and are equal to one
if m ~= k && 1 ~= k && m ~= 1
    error('The heights of the matrices do not match or are not equal to one')
end
%Checks if the matrices match in length
if s ~= g 
    error('The lengths of the matrices do not match')
end
%Finds needed values
l= length(x);
a=x(1);
b=x(l);
n=l;
v=l-1;
h=(b-a)/2;
xi=a:h:b;
%Checks to see if the number is even or odd
Odd=rem(n,2);
if s == 2 && g == 2
warning('The Trapazoid Rule has to be used since there are only two data points')
I=(b-a).*((y(1)+ y(length(y)))./2); 
else
if length(x)-1 == 2
oddarray=[2];
a1=x(1);
b1=x(3);
I= (b-a).*((y(1)+4.*(sum(y(oddarray)))+2.* (0) + y(n))./(3.*(n-1)));
else
if 0 == Odd
oddarray=2:2:(l-2);
evearray=3:2:(l-1);
a1=x(1);
b1=x((length(x)-1));
else
oddarray=2:2:(l-1);
evearray=3:2:(l);
end      
%Checks to see if the Trapazoid Rule has to be used on the last interval
if 0 == Odd
%1/3 Rule with Trapazoid Rule   
    warning('The Trapazoid Rule has to be used on the last interval')
tl= length(y)-1;
 t=(x(length(x))-x((length(x)-1)))*((y(tl)+ y(length(y)))/2);
 I= (b1-a1).*((y(1)+4.*(sum(y(oddarray)))+2.* (sum(y(evearray))) + y(n-1))./(3.*(v-1)))+t;

else
    
%Normal 1/3 Rule   
I= (b-a).*((y(1)+4.*(sum(y(oddarray)))+2.* (sum(y(evearray))) + y(n))./(3.*(v)));
end
end
end
end
