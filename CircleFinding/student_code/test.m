close all;
clear;
n = linspace(-50,50,101);
sigma = 10;
gau = exp(-n.^2/(2*sigma^2))/ sqrt(2* pi * sigma^2);

figure;
plot(n, gau)
gau_fft = fftshift(fft(gau,511));
figure;
plot([-255:255], abs(gau_fft));

w = 0.8;
gabor = gau .* cos(w*n);
figure
plot(n, gabor)
gabor_fft = fftshift(fft(gabor,511));
figure;
plot([-255:255], abs(gabor_fft));