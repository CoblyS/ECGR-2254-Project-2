clear
clc
fs = 8192;
n = (0:1:999);
f1 = [697 770 852 941];
f2 = [1209 1336 1477];

d1 = sin(2*pi*(f1(1)/fs)*n)+sin(2*pi*(f2(1)/fs)*n);
d2 = sin(2*pi*(f1(1)/fs)*n)+sin(2*pi*(f2(2)/fs)*n);
d3 = sin(2*pi*(f1(1)/fs)*n)+sin(2*pi*(f2(3)/fs)*n);
d4 = sin(2*pi*(f1(2)/fs)*n)+sin(2*pi*(f2(1)/fs)*n);
d5 = sin(2*pi*(f1(2)/fs)*n)+sin(2*pi*(f2(2)/fs)*n);
d6 = sin(2*pi*(f1(2)/fs)*n)+sin(2*pi*(f2(3)/fs)*n);
d7 = sin(2*pi*(f1(3)/fs)*n)+sin(2*pi*(f2(1)/fs)*n);
d8 = sin(2*pi*(f1(3)/fs)*n)+sin(2*pi*(f2(2)/fs)*n);
d9 = sin(2*pi*(f1(3)/fs)*n)+sin(2*pi*(f2(3)/fs)*n);
dstar = sin(2*pi*(f1(4)/fs)*n)+sin(2*pi*(f2(1)/fs)*n);
d0 = sin(2*pi*(f1(4)/fs)*n)+sin(2*pi*(f2(2)/fs)*n);
dhash = sin(2*pi*(f1(4)/fs)*n)+sin(2*pi*(f2(3)/fs)*n);

x = zeros(1,100);
y = [d8 x d6 x d7 x d5 x d3 x d0 x d9];

load('touch.mat')
Ns = 2048;
 dft1 = dft(d1,Ns);
% dft2 = dft(d2,Ns);
% dft3 = dft(d3,Ns);
% dft4 = dft(d4,Ns);
% dft5 = dft(d5,Ns);
% dft6 = dft(d6,Ns);
% dft7 = dft(d7,Ns);
% dft8 = dft(d8,Ns);
% dft9 = dft(d9,Ns);
% dft0 = dft(d0,Ns);

solv = zeros(7,1000);
for a = 1:1:7
    offset = 1000*a+1;
    for b = offset-1000:1:offset-1
        solv(a,mod(b,1000)+1) = x1(b+1);
    end
end
x11 = zeros(1,1000);
x11 = solv(1,1:1:1000);
dft(x11,2048);

x12 = zeros(1,1000);
x12 = solv(1,1:1:1000);
dft(x12,2048);


function d = dft(din,N_p)
    dx = [din zeros(1,N_p-1000)];
    X = zeros(1,N_p);
    for k = 1:1:N_p
        for i = 1:1:N_p
            X(k) = X(k)+(dx(i)*exp((-j)*(2 * pi / N_p)*(i-1)*(k-1)));
        end
    end    
    K = 1:1:N_p;
    WK = 2*pi*K / N_p;
    figure;
    stem(WK,abs(X))
    title('DFT Graph')
    d = X;
end

