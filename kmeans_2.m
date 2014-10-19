close all
clear all

X = importdata('kmeans_data_2.txt');
[m, d] = size(X);
figure(1), plot(X,'x')

for k = 1:30
    [idx,C,sumd,D] = kmeans(X,k);
    J = sum(D);
    k = k+1;
end
idx_min = find(J == min(J))
J_min = min(J)

figure(2), plot(J), title('Fig.2')
hold on
