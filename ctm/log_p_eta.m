function p = log_p_eta( eta, c, n, zeta, mu, var )
    p = c*eta - n*log(exp(zeta) + exp(eta)) - 0.5*(eta-mu)^2/var;
    %p = -0.5*(eta-mu)^2/var;
end

