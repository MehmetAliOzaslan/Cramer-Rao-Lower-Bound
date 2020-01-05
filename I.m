function CRLB = I(X,sigma2)
x = [2,-3]'; L = size(X,2);
p1 = 0; p2 = 0; p3 = 0;
d = (sqrt(sum((x*ones(1,L) - X).^2,1))).';
for i = 1:L
    p1 = p1 + (((x(1) - X(1,i)).^2)./(sigma2(i).*d(i).^2));
    p2 = p2 + (((x(1) - X(1,i)) + (x(2) - X(2,i))./(sigma2(i).*d(i).^2)));
    p3 = p3 + (((x(2) - X(2,i)).^2)./(sigma2(i).*d(i).^2));
end
matrix = [p1 p2; p2 p3];
CRLB = inv(matrix(1,1)) + inv(matrix(2,2));
end