close all
clear all

X = importdata('kmeans_data_1.txt');
[m, d] = size(X);
figure(1), plot(X,'.')

k = 2;
init_cen = datasample(X,k)
[idx, C] = kmeans(X, k, 'start',init_cen);

figure(2), hold on
plot( X(idx==1), '.')
plot( X(idx==2), '.r')
% how to plot C?
