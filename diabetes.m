A = importdata('data.csv');
% [M, N] = size(A);
feat = 2;    % the index of the column we want to examine
             % for ft = 2, we have the plasma glucose concentration at 2h
             % in an oral glucose test
n_train = 100;
test_set = A(1:n_train, feat);
val_set = A(n_train+1:end, feat);

idx_pos = find( A(1:length(test_set),9) == 1 );  % finds the patients who have been tested positive for diabetes
idx_neg = find( A(1:length(test_set),9) == 0 );  % finds the patients who have been tested negative for diabetes

mle_p1 = length(idx_pos)/n_train;   % calculates the maximum likelihood estimate for p_1
mle_p2 = length(idx_neg)/n_train;   % calculates the maximum likelihood estimate for p_2

mle_m1 = sum( A(idx_pos, feat) )/length(idx_pos);  % calculates the maximum likelihood estimate for mean m_1
mle_m2 = sum( A(idx_neg, feat) )/length(idx_neg);  % calculates the maximum likelihood estimate for mean m_2

mle_s1 = sqrt( mean( (A(idx_pos, feat)-mle_m1).^2 ) ); % calculates the maximum likelihood estimate for standard deviation s_1
mle_s2 = sqrt( mean( (A(idx_neg, feat)-mle_m2).^2 ) ); % calculates the maximum likelihood estimate for standard deviation s_2

fprintf('The maximum likelihood estimator for p_1 is %f\n', mle_p1);
fprintf('The maximum likelihood estimator for m_1 is %f\n', mle_m1);
fprintf('The maximum likelihood estimator for s_1 is %f\n', mle_s1);
fprintf('The maximum likelihood estimator for p_2 is %f\n', mle_p2);
fprintf('The maximum likelihood estimator for m_2 is %f\n', mle_m2);
fprintf('The maximum likelihood estimator for s_2 is %f\n', mle_s2);

discr1 = - log(2*pi)/2 - log(mle_s1) - ((A(n_train+1:end, feat)-mle_m1).^2)/(2*(mle_s1^2)) + log(mle_p1);    % calculates the discriminant function of g_1(x)
discr2 = - log(2*pi)/2 - log(mle_s2) - ((A(n_train+1:end, feat)-mle_m2).^2)/(2*(mle_s2^2)) + log(mle_p2);    % calculates the discriminant function of g_2(x)

pred = zeros(length(val_set), 1);   % initialize prediction vector
for i = 1:length(val_set)
    if (discr1(i)>discr2(i))
        pred(i) = 1;
    else
        pred(i) = 0;
    end
end
pred_pos = size(find(pred == 1))    % calculates how many positive predictions
pred_neg = size(find(pred == 0))    % calculates how many negative predictions
accur = sum(pred == A(n_train+1:end,9))/length(val_set);   % calculates the accuracy of the classification by comparing it to the real data
fprintf('The accuracy of the estimator is %f\n', accur*100)


% plot the normal distribution of the x-points
% x1 = mle_m1 - mle_s1 : mle_m1 + mle_s1;     % sets the limits for the x-coordinate of the normal distribution function
% x2 = mle_m2 - mle_s2 : mle_m2 + mle_s2;
% plot(x1, normpdf(x1,mle_m1,mle_s1), x2, normpdf(x2,mle_m2,mle_s2))


% Bayes' discrimant points:
% a = (2*mle_s2^2)^-1 - (2*mle_s1^2)^-1 ;
% b = mle_m1/mle_s1^2 - mle_m2/mle_s2^2 ;
% c = mle_m2^2/(2*mle_s2^2) - mle_m1^2/(2*mle_s1^2) + log(mle_s2/mle_s1) + log(mle_p1/mle_p2);
% r1 = (-b + sqrt(b^2-4*a*c))/(2*a)
% r2 = (-b - sqrt(b^2-4*a*c))/(2*a)