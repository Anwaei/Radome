% ---------------------------------------
% 天线罩寄生回路对制导系统稳定性的影响 2.4.1
% ---------------------------------------

clear
syms n K Ta Tg N s
chaeq = ((1/n*s+1)^n + K*(Ta*s+1))*s*Tg + N;

n=5; N=4;
chaeq_n = ((1/n*s+1)^n + K*(Ta*s+1))*s*Tg + N;
coefficients = fliplr(coeffs(chaeq_n, s));

% Test for different Tg
Tg_sets=[5,10,20];
num_Tg = numel(Tg_sets);
K_sets=-1:0.01:3; Ta_sets=0:0.05:10.0;
num_K = numel(K_sets); num_Ta = numel(Ta_sets);
Ks = nan(num_Tg,num_K); Tas = nan(num_Tg,num_K);

for t = 1:num_Tg
    eq = coefficients;
    eq_t = subs(eq, Tg, Tg_sets(t));
    for i = 1:num_K
        eq_k = subs(eq_t, K, K_sets(i));
        for j = 1:num_Ta
%             eq = coefficients;
%             eq = subs(eq, Tg, Tg_sets(t));
%             eq = subs(eq, K, K_sets(i));1
%             eq = subs(eq, Ta, Ta_sets(j));
            eq_a = subs(eq_k, Ta, Ta_sets(j));
            if K_sets(i)>0 && Ta_sets(j)<0.1
                continue
            end
            poles = roots(eq_a);
            if max(real(poles))>0
                Ks(t,i) = K_sets(i);
                Tas(t,i) = Ta_sets(j);
                break
            end
        end
        disp(i)
    end
end

% Plot
figure; hold on; xlabel('$$K$$','interpreter','latex'); ylabel('$$T_a$$','interpreter','latex'); ylim([0,10]);
for t = 1:num_Tg
    K_plot = Ks(t,:); Ta_plot = Tas(t,:);
    K_plot(isnan(K_plot)) = [];
    Ta_plot(isnan(Ta_plot)) = [];
    k1_plot = -1:0.0001:-0.05;
    ta1_plot = interp1(K_plot, Ta_plot, k1_plot);
    k2_plot = 0.1:0.0001:3;
    ta2_plot = interp1(K_plot, Ta_plot, k2_plot);
    k_plot = [k1_plot, k2_plot];
    ta_plot = [ta1_plot, ta2_plot];
%     plot(K_plot,Ta_plot,'.');
    plot(k_plot,ta_plot,'.');
%     legend('Tg=%d',Tg_sets(t));
end
            