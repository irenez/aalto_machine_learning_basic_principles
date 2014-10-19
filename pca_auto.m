close all
clear all

x = importdata('auto-mpg.csv');
[N,d] = size(x);
m = mean(x);

for i=1:d
    y(:,i) = (x(:,i) - m(1,i));
end

sigma = cov(y);
[U,S,V] = svd(sigma);
k = 2;  % set d if you want the 'while' to choose best k

% while (thres < 0.99)
%        thres = trace(S(1:k,1:k))/trace(S);
%        k = k-1;
% end

U_reduce = U(:,1:k);
z = y*U_reduce;
c_1 = U(:,1)
c_2 = U(:,2)

pov = trace(S(1:k,1:k))/trace(S)    % proportional variance
plot(z(:,1), z(:,2), '.r')
% hold on
% T = importdata('auto-mpg-names.txt'); 
% text(z(90:100,1), z(90:100,2), T(90:100))