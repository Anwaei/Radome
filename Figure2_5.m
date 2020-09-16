%   The Ta-K stability region

%   F£¨s£©=(s/n+1)^n + K*(Ta*s+1).

clear
%% when n = 3, F£¨s£©=(1/27)s^3+(1/3)s^2+(1+K*Ta)s+(K+1).

Ta=[0:0.01:10.0]; K=[-1:0.001:3];

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

%% when n = 4, F£¨s£©=(1/81)s^4+(4/27)s^3+(2/3)s^2+(4/3+K*Ta)s+(K+1).

Ta=[0:0.01:10.0]; K=[-1:0.001:3];

x2=[]; y2=[];
k=1;

n=length(K); m=length(Ta);

for i=1:n % K

 for j=1:m % Ta

  q=[1/81 4/27 2/3 4/3+K(i)*Ta(j) K(i)+1];

  p=roots(q);

  if max(real(p)) > 0, x2(k)=K(i); y2(k)=Ta(j); k=k+1; break; end

 end

end

%% when n = 5, F£¨s£©=(1/243)s^5+(13/81)s^4+(10/27)s^3+(10/9)s^2+(5/3+K*Ta)s+(K+1).

Ta=[0:0.01:10.0]; K=[-1:0.001:3];

x3=[]; y3=[];
k=1;

n=length(K); m=length(Ta);

for i=1:n % K

 for j=1:m % Ta

  q=[1/243 13/81 10/27 10/9 5/3+K(i)*Ta(j) K(i)+1];

  p=roots(q);

  if max(real(p)) > 0, x3(k)=K(i); y3(k)=Ta(j); k=k+1; break; end

 end

%    if j==m
%   x3 = x3(1:end-1);
%   y3 = y3(1:end-1);
%    end
   
end

figure
plot(x,y,'.')
hold on
plot(x2,y2,'.')
hold on
plot(x3,y3,'.')
grid on
xlabel('K')
ylabel('Ta')
legend('n=3','n=4','n=5')
