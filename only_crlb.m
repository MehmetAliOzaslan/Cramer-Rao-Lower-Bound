clear; clc; close all
x1 = [0,0]; x2 = [0,10];
x3 = [10,0]; x4 = [10,10];
X = [x1;x2;x3;x4]'; % matrix for receiver positions
L = size(X,2); % number of receivers
x = [2,-3]'; % source position to be determined (outside)
d = (sqrt(sum((x*ones(1,L)-X).^2,1))).'; %noise-free ranges 
m = 0;
for dB = -10:5:60
    sigma2 = d.^2./10.^(dB/10); 
    m = m + 1;
    CRLB(m) = I(X,sigma2);
end

range_dB = -10:5:60;
plot(range_dB, 10*log10(CRLB),'+');
ylabel('mean square position error (dB)')
xlabel('SNR (dB)')

