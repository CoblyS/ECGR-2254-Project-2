clear;

T = 10;
T_s1 = 2;
T_s2 = .2;
T_s3 = .01;

f = 1/T;
f_s1 = 1/T_s1;
f_s2 = 1/T_s2;
f_s3 = 1/T_s3;

n1 = [0:1:(1/(f/f_s1))];
n2 = [0:1:(1/(f/f_s2))];
n3 = [0:1:(1/(f/f_s3))];

t1 = n1*T_s1;
t2 = n2*T_s2;
t3 = n3*T_s3;

x_c1 = sin(2*pi()*f*t1);
x_d1 = sin(2*pi()*(f/f_s1)*n1);

x_c2 = sin(2*pi()*f*t2);
x_d2 = sin(2*pi()*(f/f_s2)*n2);

x_c3 = sin(2*pi()*f*t3);
x_d3 = sin(2*pi()*(f/f_s3)*n3);

figure;
subplot(3,1,1);
plot(t1,x_c1);
title('x_c(t)');
hold on;
xlabel('Time (sec)');
ylabel('Input Voltage (V)');
hold off;
subplot(3,1,2);
stem(t1,x_c1);
title('x_p(t)');
hold on;
xlabel('Time (sec)');
ylabel('Input Voltage (V)');
hold off;
subplot(3,1,3);
stem(n1,x_d1);
title('x_d(n)');
hold on;
xlabel('Samples');
ylabel('Input Voltage (V)');
hold off;

figure;
subplot(3,1,1);
plot(t2,x_c2);
title('x_c(t)');
hold on;
xlabel('Time (sec)');
ylabel('Input Voltage (V)');
hold off;
subplot(3,1,2);
stem(t2,x_c2);
title('x_p(t)');
hold on;
xlabel('Time (sec)');
ylabel('Input Voltage (V)');
hold off;
subplot(3,1,3);
stem(n2,x_d2);
title('x_d(n)');
hold on;
xlabel('Samples');
ylabel('Input Voltage (V)');
hold off;

figure;
subplot(3,1,1);
plot(t3,x_c3);
title('x_c(t)');
hold on;
xlabel('Time (sec)');
ylabel('Input Voltage (V)');
hold off;
subplot(3,1,2);
stem(t3,x_c3);
title('x_p(t)');
hold on;
xlabel('Time (sec)');
ylabel('Input Voltage (V)');
hold off;
subplot(3,1,3);
stem(n3,x_d3);
title('x_d(n)');
hold on;
xlabel('Samples');
ylabel('Input Voltage (V)');
hold off;


f1 = 1000;
f2 = 100;
fs1 = 10e3;
fs2 = 100e3;
omegak1 = (2*pi())/fs1;
omegak2 = (2*pi())/fs2;
ns1 = [0:1:(1/(f1/fs1))];
ns2 = [0:1:(1/(f1/fs2))];
phase1 = 30*(pi()/180);
phase2 = 20*(pi()/180);

xd1 = 4*sin((2*pi()*(f1/fs1)*ns1) + phase1) + 2*cos((2*pi()*(f2/fs1)*ns1) + phase2);
xd2 = 4*sin((2*pi()*(f1/fs2)*ns2) + phase1) + 2*cos((2*pi()*(f2/fs2)*ns2) + phase2);

xd3 = 4*sin((2*pi()*(f1/fs1)*ns1) + phase1);
xd4 = 4*sin((2*pi()*(f1/fs1)*ns1) + phase1 + (2*pi()));

figure
plot(ns1, xd3);
hold on;
plot(ns1, xd4);
hold off;
title('x_d(n) vs x_d_2(n)');
legend('x_d(n)','x_d_2(n)');
ylabel('Input Voltage (V)');
xlabel('w_k (rad/s)');


n = [0:1:39999];

xd5 = 4*sin((2*pi()*(f1/fs1)*n) + phase1) + 2*cos((2*pi()*(f2/fs1)*n) + phase2);

dft(xd5,6500);

function d = dft(din,N_p)
    dx = [din zeros(1,N_p-1000)];
    X = zeros(1,N_p);
    for k = 1:1:N_p
        for L = 1:1:N_p/2
            X(k) = X(k)+(dx(L)*exp((-j)*(2 * pi / N_p)*(L-1)*(k-1)));
        end
    end    
    K = 1:1:N_p;
    wk = 2*pi*K / N_p;
    figure;
    stem(wk,abs(X))
    title('DFT X[k] vs w (rad)')
    ylabel('Input Voltage (V)')
    xlabel('w_k (rad/s)')
    d = X;
    
    freqk = wk/(2*pi());
    
    figure;
    stem(freqk,abs(X))
    title('DFT X[k] vs. Frequency (Hz)')
    ylabel('Input Voltage (V)')
    xlabel('Frequency (Hz)')
    
end


