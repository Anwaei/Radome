%   The Ta-K stability region

%   F(s)=(s/n+1)^n + K*(Ta*s+1).

clear
%% when n = 3, F(s)=(1/27)s^3+(1/3)s^2+(1+K*Ta)s+(K+1).

Ta=[0.1:0.01:12.0]; K=[-1:0.01:3];

x=[]; y=[];
k=1;

n=length(K); m=length(Ta);

for i=1:n % K

 for j=1:m % Ta

  q=[1/27 1/3 1+K(i)*Ta(j) K(i)+1];

  p=roots(q);

  if max(real(p)) > 0, x(k)=K(i); y(k)=Ta(j); k=k+1; break; end


 end
 
end

%% when n = 4, F(s)=(1/256)s^4+(1/16)s^3+(6/16)s^2+(1+K*Ta)s+(K+1).

Ta=[0.1:0.01:12.0]; K=[-1:0.01:3];

x2=[]; y2=[];
k=1;

n=length(K); m=length(Ta);

for i=1:n % K

 for j=1:m % Ta

  q=[1/256 1/16 6/16 1+K(i)*Ta(j) K(i)+1];

  p=roots(q);

  if max(real(p)) > 0, x2(k)=K(i); y2(k)=Ta(j); k=k+1; break; end

 end

end

%% when n = 5, F(s)=(1/3125)s^5+(1/125)s^4+(2/25)s^3+(2/5)s^2+(1+K*Ta)s+(K+1).

Ta=[0.1:0.01:12.0]; K=[-1:0.01:3];

x3=[]; y3=[];
k=1;

n=length(K); m=length(Ta);

for i=1:n % K

 for j=1:m % Ta

  q=[1/3125 1/125 2/25 2/5 1+K(i)*Ta(j) K(i)+1];

  p=roots(q);

  if max(real(p)) > 0, x3(k)=K(i); y3(k)=Ta(j); k=k+1; break; end

 end

%    if j==m
%   x3 = x3(1:end-1);
%   y3 = y3(1:end-1);
%    end
   
end

figure
plot(x,y,'-.')
hold on
plot(x2,y2,'--')
hold on
plot(x3,y3)
grid on
xlabel('K')
ylabel('Ta')
legend('n=3','n=4','n=5')
xlim([-1,3])
ylim([0,10])
