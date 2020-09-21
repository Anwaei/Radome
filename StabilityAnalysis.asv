% 寄生回路及制导回路稳定性分析
clear; close all;
%% 寄生回路分析
%% 制导回路分析
syms n K Ta Tg N s
chaeq = ((1/n*s+1)^n + K*(Ta*s+1))*s*Tg + N;
order = 5;
rhTable = rhTableSym(chaeq,order);

rhTable = subs(rhTable,N,4);  % n=5, N=4;
Tg_sets=[5,10,20]; Ta_sets = [2,3,4];
num_Tg = numel(Tg_sets); num_Ta = numel(Ta_sets);

% ----------- 图2.12绘制 -----------
Ks=-1:0.02:3; Ks = Ks(Ks~=0);
num_K = numel(Ks);
Tas = nan(num_Tg,num_K);

for t = 1:num_Tg
    rhTable_t = subs(rhTable, Tg, Tg_sets(t));
    for i = 1:num_K
        Ta_solved_list = zeros(1,3);
        rhTable_k = subs(rhTable_t, K, Ks(i));
        for k = 1:3
            Ta_solved = double(solve(rhTable_k(k+3,1)==0));
            if max(Ta_solved)<=0
                Ta_solved_list(k) = inf;
            else
                Ta_solved_list(k) = min(Ta_solved(Ta_solved>0));
            end
        end
        Tas(t,i) = min(Ta_solved_list);
        % disp(i)
    end
    disp(t)
end
figure(1); hold on; 
xlabel('$$K$$','interpreter','latex'); ylabel('$$\bar{T}_a$$','interpreter','latex'); 
legends = cell(1,3); ylim([0,10]);
for t = 1:num_Tg
    K_plot = Ks; Ta_plot = Tas(t,:);
    plot(K_plot,Ta_plot);
    legends{t} = ['$$\bar{T}_g=' num2str(Tg_sets(t)) '$$'];
end
set(legend(legends),'interpreter','latex');

% ----------- 图2.13绘制 -----------
Ks=-0.4:0.02:1; Ks = Ks(Ks~=0);
num_K = numel(Ks);
Tgs = nan(num_Ta,num_K);

for t = 1:num_Ta
    rhTable_t = subs(rhTable, Ta, Ta_sets(t));
    for i = 1:num_K
        Tg_solved_list = inf(1,2);
        rhTable_k = subs(rhTable_t, K, Ks(i));
        k=1;
        if coeffs(rhTable_k(k+3,1))<=0
            Tg_solved_list(k) = 100;
        else
            Tg_solved_list(k) = 0;
        end
        for k = 2:2
            Tg_solved = double(solve(rhTable_k(k+4,1)==0));
            if max(Tg_solved)<0
                Tg_solved_list(k) = 100;
            else
                Tg_solved_list(k) = min(Tg_solved(Tg_solved>=0));
            end
        end
        Tgs(t,i) = max(Tg_solved_list);
        % disp(i)
        end65yh
    disp(t)
end
figure(2); hold on; 
xlabel('$$K$$','interpreter','latex'); ylabel('$$\bar{T}_g$$','interpreter','latex'); 
legends = cell(1,3); ylim([0,15]);
for t = 1:num_Ta
    K_plot = Ks; Tg_plot = Tgs(t,:);
    plot(K_plot,Tg_plot);
    legends{t} = ['$$\bar{T}_a=' num2str(Ta_sets(t)) '$$'];
end
set(legend(legends),'interpreter','latex');