function res = pca_getpc(data)

% input: original X for training and testing
% output: PCAed X for training and testing, number of PCs that you selected

[m, n] = size(data);
MEAN = repmat(mean(data),m,1);
Xc = data - MEAN;
[U,S,V1] = svds(Xc);
SCORE = V1'*(Xc)';
x_nrom = sumsqr(data-MEAN);
res = zeros(n,1);
for k = 1:n
    x_hat_c = SCORE(:,1:k)*V1(:,1:k)';
    x_hat_norm = sumsqr(x_hat_c);
    frac = x_hat_norm/x_nrom;
    res(k) = frac;
end




% set you numpc here, you should acheive 90% reconstruction accuracy
% numpc = ?;

end


