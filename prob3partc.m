clc
clear all;

L = .01;
R = 3.38;
K = .029;
J = 2e-4;
B = .5e-5;

w = logspace(-3,4);

%X1 = ((j.*w+100).*(j.*w+200))./((j.*w+10).*(j.*w+1000).*(j.*w+10000)); % Blue
X1 = K ./ (((J*L)*j.*w.^2).*(((J*R)+(B*L))*j.*w).*((K*K)+(B*R)));
subplot(2,1,1)
semilogx(w,20*log10(abs(X1)));
title('Magnitude')
ylabel('Magnitude (dB)')
xlabel('Log of Frequency')
set(gca, 'XLim',[0.5 3000])
% ylim([-1 10]);
grid on
subplot(2,1,2)
semilogx(w,angle(X1)*180/pi);
title('Phase')
ylabel('Phase (°)')
xlabel('Log of Frequency')
set(gca, 'XLim',[0.5 3000])
grid on