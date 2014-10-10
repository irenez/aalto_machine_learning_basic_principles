A = importdata('training_data.txt');
x = sort(A(:,1));
y = sort(A(:,2));
deg = 10;
for i = 0 : deg
[pred, err] = polyfit(x, y, i);
y_fit = polyval(pred, x, err);
end
plot(x, y_fit, '-', x, y, 'o')
pred