y = pi         % assigning the constant value to variable y
y = log10(4) 
y = log(4)     % equivalent to ln
sqrt(4) 
exp(5)         % equals e^5
cos(a), acos(a)       % the cos and inverse cos of the angle as it is in rad 
cosd(a), acosd(a)     % the cos and inverse cos of the angle as it is in degree


a = 2 - 5i     % imaginary number
abs(a)         % finding the absolute of the number
angle(a)       % finding the rad representation of the angle of a
real(a)        % printing the real part of the imaginary number
imag(a)        % pringting the imaginary part of the imaginary number
a = complex(1, 2)   % assigning 1 + 2i to a


G = [1 2; 3 4]     % 2d matrix. adding, subtracting, multiplication and division are straight forward just G*H
G.*H and G./H      % multiply or divide the 2 matrices element by element


t = eye(4)     % constructing a 4*4 I matrix
s = inv(t)     % getting inverse of a matrix
t'             % finding transpose of a matrix
m = det(t)     % finding matrix's determinant
j = repmat(pi, 3, 5)     % a 3 by 5 matrix with pi value in all indecies


k = [1 2 2 4];    % x^3 + 2*x^2 + 2*x + 4
p = roots(k)      % finding the roots of a given function

p = [1; 2 ; 4];   % roots: 1, 2, 4
k = poly(p)    % finding the function that has the given roots


% basic operations on polynomials
x = [1    -7    14]; 
y = [1    2     3];
a = x + y       % addition
b = x - y       % subtraction
c = conv(x, y)  % multiplication
[m,n] = deconv(c, x)     % division  --m is the polynomial, n is the remainder


% getting transfer function
num = [1 2 3];
den = [3 4 5 5];
tf(num, den)     % inputs: numerator and denomenator polynomials
%       s^2 + 2 s + 3
%  -----------------------
%   3 s^3 + 4 s^2 + 5 s + 5


% partial fraction solving
num = [1 8 16 9 6];
den = [1 6 11 6];
[x y z] = residue(num, den)
% x = [-6 -4 3]       % those are the constants    
% y = [-3 -2 -1]      % those are the poles of the denomenator   
% z = [1 2]           % means: + 1*s^1 + 2*s^0


% zpk
z = [-2; -4]
p = [-3; -2+5i; -2-5i]
k = 20
sys = zpk(z, p, k)    % takes the zeros, poles, and constants' matrices and gives the original fraction
%     20 (s+2) (s+4)
%  ---------------------
%  (s+3) (s^2 + 4s + 29)


% state space to transfer function
A = [0 1; -2 -3];
B = [0; 1];
C = [1 0];
D = 0;
[num, den] = ss2tf(A, B, C, D);
tf(num, den)


% transfer function to state space
num = [2 5];
den = [1 3 2];
[A, B, C, D] = tf2ss(num, den);


% syms, expand, factor
syms x;
g = x^2 + x;     % another way to write a polynomial
f = x^3 + 5;
m = g * f;       % (x^3 + 5)*(x^2 + x)
n = expand(m);   % x^5 + x^4 + 5*x^2 + 5*x
d = factor(n);   % [x, x + 1, x^3 + 5] -- means x*(x+1)*(x^3+5)


% subs
syms x y;
g = x*y + x*(y-3) + y^2;
subs(g, y, 3);           % substitute each y with a 3. output: 3*x + 9
subs(g, y, (x+1));       % output: (x + 1)^2 + x*(x + 1) + x*(x - 2)
subs(g, {x, y}, {1, 0})  % output: -3


syms x
f = x^3 + 4*x^2 + 10;
limit(f, x, 0)     % output: 10


syms t;
j = t^2+exp(3*t);
f = sym(j);
a = laplace(f)  % output: 1/(s - 3) + 2/s^3
b = ilaplace(a) % output: exp(3*t) + t^2


num = [1];
den = [1 3 2 0];  % s^3 + 3s^2 + 2s --the missed term is represented with 0
j = tf(num,den);  % getting transfer function
rlocus(j)         % plotting the root locus
