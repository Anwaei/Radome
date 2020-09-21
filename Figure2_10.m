load('Am_radomeloop_0.mat');
load('Am_radomeloop_n001.mat');
load('Am_radomeloop_n003.mat');
load('Am_radomeloop_n005.mat');

figure
plot(Am_0(1,:),Am_0(2,:));
hold on
plot(Am_n001(1,:),Am_n001(2,:),'-.');
hold on
plot(Am_n003(1,:),Am_n003(2,:),'--');
hold on
plot(Am_n005(1,:),Am_n005(2,:),'-..');
xlabel('Time /(s)');
ylabel('Am /(g)');
legend('R=0','R=-0.01','R=-0.03','R=-0.05');
title('寄生回路正反馈时域响应')

load('Am_radomeloop_p001.mat');
load('Am_radomeloop_p003.mat');
load('Am_radomeloop_p005.mat');

figure
plot(Am_0(1,:),Am_0(2,:));
hold on
plot(Am_p001(1,:),Am_p001(2,:),'-.');
hold on
plot(Am_p003(1,:),Am_p003(2,:),'--');
hold on
plot(Am_p005(1,:),Am_p005(2,:),'-..');
xlabel('Time /(s)');
ylabel('Am /(g)');
legend('R=0','R=0.01','R=0.03','R=0.05');
title('寄生回路负反馈时域响应')