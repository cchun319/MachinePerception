function g = gau2(sigma, len)

n = -(len-1)/2: (len-1)/2;
g = zeros(len,len);
for i = 1 : len
    for j = 1: len
        g(i,j) = exp(-0.5 * [n(i), n(j)] * inv(sigma) * [n(i);n(j)])...
            / (2* pi * sqrt(det(sigma)));
    end
end

g = g / sum(g(:));

end