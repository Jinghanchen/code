function res = number_of_pc(data)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
cov_matrix = cov(data);
latent = eigs(cov_matrix, 5780);
figure, plot(cumsum(latent)/sum(latent));
end

