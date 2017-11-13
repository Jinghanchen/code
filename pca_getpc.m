function res = pca_getpc(data)

% input: original X for training and testing
% output: PCAed X for training and testing, number of PCs that you selected

[m, n] = size(data);
MEAN = repmat(mean(data),m,1);
Xc = data - MEAN;
[U,S,V1] = fsvd_test(Xc,1480, 0, 0, 0);
SCORE = V1'*(Xc)';
res = SCORE';

% set you numpc here, you should acheive 90% reconstruction accuracy
% numpc = ?;

end



% set you numpc here, you should acheive 90% reconstruction accuracy
% numpc = ?;




