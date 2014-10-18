close all
clear all

x = importdata('auto-mpg.csv');
[N,d] = size(x);
m = sum(x);
for i=1:d
    y(:,i) = x(:,i) - m(i);
end

sigma = (1/N)*x'*x;
[U,S,V] = eig(sigma);
thres = 0;
k = d;
while (thres < 0.99)
       thres = trace(S(1:k,1:k))/trace(S);
       k = k-1;
end

U_reduce = U(:,1:k);
z = x*U_reduce;
c_1 = U(:,1)
c_2 = U(:,2)
k

axis equal
plot(U(:,1), 'o')
hold on
plot(U(:,2), '*r')
legend('c1','c2', 'Location', 'southeast')

var_1 = max( c_1'*sum(c_1)-S(1,1)*(c_1'*c_1-1) )
var_2 = max( c_2'*sum(c_2)-S(2,2)*(c_2'*c_2-1) )
% T = importdata('auto-mpg-names.txt'); 