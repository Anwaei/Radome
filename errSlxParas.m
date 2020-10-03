clear
syms s
n = 5; N = 4; Ta_Tg = 3; Vc_Vm = 1.5; Tf_Tg = 15;
R = -0.03;
eq_num = N*s/(1-R);
eq_den = (1/n*s+1)^n + N*Vc_Vm*R/(1-R)*(Ta_Tg*s+1);
coeffs_num = [double(fliplr(coeffs(eq_num,s))) 0];
coeffs_den = double(fliplr(coeffs(eq_den,s)));

Tg = 1; Vm = 1; aT = 1; epi = 1; Tf = 1; phiGN = 1;
