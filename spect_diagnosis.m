Data = importdata('spect_training.txt');
[N,M] = size(Data); 
r = Data(:,1);     % final diagnosis
x = Data(:, 2:23);   % image features
a = 1;
K = 2;  % number of classes

idx_0 = (find(Data(:,1) == 0));
idx_1 = (find(Data(:,1) == 1));

mle_pr = sum(r)/N 
% mle_p_red = sum(x_red(:,feat)) / length(r_red)
% mle_p_white = sum(x_white(:,feat)) / length(r_white)
mle_p_0 = sum(x(idx_0,:)) / length(r(idx_0))
mle_p_1 = sum(x(idx_1,:)) / length(r(idx_1))
% for j = 1:22
%     mle_p_0(j) = (a + sum(r(idx_0)' * x(idx_0,j))) / (K*a + length(r(idx_0)));
%     mle_p_1(j) = (a + sum(r(idx_1)' * x(idx_1,j))) / (K*a + sum(r(idx_1)));
%     w_0(j) = sum( log(1-mle_p_0(j)) ) + log(1-mle_pr) - sum( log(1-mle_p_1(j)) ) - log(mle_pr);
%     w = sum( log( mle_p_0(j)*(1-mle_p_1(j)) ) ) - sum( log( mle_p_1(j)*(1-mle_p_0(j)) ) );
% end
% mle_p_0, mle_p_1, w_0, w

w_0 = sum( log(1-mle_p_0) ) + log(1-mle_pr) - sum( log(1-mle_p_1) ) - log(mle_pr)
w = sum( log( mle_p_0.*(1-mle_p_1) ) ) - sum( log( mle_p_1.*(1-mle_p_0) ) )

% err_train = TO BE CONTINUED