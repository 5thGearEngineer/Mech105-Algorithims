function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%x1 and xu are upper and lower guesses
% func is the function
%es is desired error
%maxit is the maximum iterations
% vargin is any additional parameters
% checks to see if there are the proper amount of inputs
if nargin<3
    error('at least 3 input arguments required')
end 
% checks to see if es has a value otherwise it substitues 0.0001
if nargin<4||isempty(es) 
    es= 0.0001;
end
% checks to see if maxit has a value otherwise it substitues 200
if nargin<5||isempty(maxit)
    maxit= 200;
end
%Defines starting variables
iter= -1;
xr= xl;
ea= 100;
if func(xl)*func(xu)>0
    error('The root is not between the bounds')
end
while(1)
% calculates root, error,and adds one to the iteration.  
xr1= xr;
xr= xu - (func(xu))*(xl-xu)/(func(xl)-func(xu));
if xr ~= 0
    ea= abs((xr-xr1)/xr)* 100;
else
    ea=0;
end
iter= iter+1;
fl= func(xl);
fu= func(xu);
fr=func(xr);
% Prints out every iteration 
if(iter == 1)
    fprintf('iter  xl     f(xl)   xu    f(xu)   xr   f(xr)   ea \n');
end
fprintf('%d %5.4f %5.4f %5.4f %5.4f %5.4f %5.4f %2.2f\n', iter, xl, fl, xu, fu, xr, fr, abs(ea));

% checks to see if we reach the proper error or go to the max iterations
if ea <= es||iter >= maxit
    break
end
% If it is not in the desired range the xl or xu are replaced base on sign
% and another iteration is started.
if func(xr) == func(xl)
    xl= xr;
else
    xu= xr;
end
end

%finds final root and function evaluated at the root
root=xr;
fx=func(xr);
