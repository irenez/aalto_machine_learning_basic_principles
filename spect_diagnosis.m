TrainData = importdata('spect_training.txt');
TestData = importdata('spect_test.txt');

[N,M] = size(TrainData); 
r_train = TrainData(:,1);     % final diagnosis
x_train = TrainData(:, 2:23);   % image features
r_test = TestData(:,1);
x_test = TestData(:, 2:23);

a = 1;
K = 2;  % number of classes

idx_0 = (find(r_train == 0));
idx_1 = (find(r_train == 1));

mle_p = ones(2,M-1);     % initialize p_ij MLE
w = ones(1,M-1);     % initialize w parameter

mle_pr = sum(r_train)/N ;
for j = 1:(M-1)
    mle_p(1,j) = (a + sum(x_train(:,j).* (r_train == 0)) )/ (K*a + length(r_train(idx_0)));
    mle_p(2,j) = (a + sum(x_train(:,j).* (r_train == 1)) ) / (K*a + sum(r_train(idx_1)));     
                  % --> since r(idx_1(i)) == 1, we assume that sum(r) == length(r) <--
    w(j) = log( mle_p(1,j)) - log( 1-mle_p(1,j) )- log( mle_p(2,j) ) + log( 1-mle_p(2,j) );
end
w_0 = sum( log(1-mle_p(1,:)) ) + log(1-mle_pr) - sum( log(1-mle_p(2,:)) ) - log(mle_pr);

discr_train = 1 ./(1+exp(w*(x_train') + w_0));
pred_train = (discr_train > 0.5);
err_train = mean((r_train - pred_train').^2)

discr_test = 1 ./(1+exp(w*(x_test') + w_0));
pred_test = (discr_test > 0.5);
err_test = mean((r_test - pred_test').^2)


% fprintf('The maximum likelihood estimator for p_r is %f\n', mle_pr);
% fprintf('The maximum likelihood estimator for p_ij is '); mle_p
% fprintf('The parameters of the sigmoid form are w, w_0: '); w, w_0
% fprintf('The error for the training set is %f\n ', err_train);
% fprintf('The error for the test set is %f\n ', err_test);