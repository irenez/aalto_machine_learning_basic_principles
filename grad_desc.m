clear all 
close all

D = importdata('db_data.csv');
[N, d] = size(D);
n_train = round(N*0.7);
r_train = D(1:n_train,d);
x_train = D(1:n_train,1:d-1);

niter = 100;       % number of iterations
alpha = 0.001;        % step

eta = repmat(mean(x_train), n_train, 1);    % feature scaling
sigma = repmat(std(x_train), n_train, 1);
x_train = (x_train - eta)./sigma;

theta_0 = 1;
theta = ones(1,d-1);

for j = 1:niter
    
    y = 1./(1+exp(-x_train*theta' - theta_0));    % sigmoid function
    J(j) = (r_train'*log(y) + (1-r_train')*log(1-y));    % cost function

    for i = 1:d-1
        J_der(i) =  sum(x_train(:,i).*(r_train-y));       % derivative of cost function
    end
    theta = theta + alpha * J_der;
    
    theta_0 = theta_0 + alpha*sum(r_train-y);
    
end
theta, theta_0
plot(J)


r_valid = D(n_train+1:end,d);
x_valid = D(n_train+1:end,1:d-1);
pred = zeros(length(r_valid), 1);

y_val = 1./(1+exp(x_valid*theta' + theta_0));
pred = (r_valid'*log(y_val) + (1-r_valid')*log(1-y_val));

% err = mean((r_valid-pred).^2)
