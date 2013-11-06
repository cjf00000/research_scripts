%% Data
t200_perp = reshape([6223.306454
4089.370989
3730.203422
3617.893031
4565.401325
3831.871216
3643.404525
3544.982705
4151.665758
3676.378634
3570.332358
3504.441185
3821.000706
3607.560103
3510.307978
3470.777301
3717.109883
3551.057781
3491.241801
3456.799113
3717.819474
3555.428081
3502.607471
3451.548508],4,6);

t200_time = reshape([233.757
345.043
735.102
1192.48
231.974
448.122
794.239
1373.61
231.264
522.519
848.693
1649.38
330.52
606.13
1246.27
2249.91
439.544
973.934
1749.07
3519.35
806.858
1666.23
3170.82
6341.71], 4, 6);

t1000_perp = reshape([4422.224539
3441.902501
3178.749663
3036.284299
3680.025382
3224.214592
3062.777557
2992.787343
3348.583819
3102.318606
2972.544451
2903.506868
3178.21812
3001.584315
2905.240022
2844.417163
3123.243438
2971.216242
2884.171913
2836.976172
3129.090546
2961.4501
2882.71207
2824.642799], 4, 6);

t1000_time = reshape([954.888
1873.38
3707.01
7339.48
1046.95
2026.93
4205.53
7974.8
1242.2
2385.83
4791.03
9328.43
1620.31
3194.2
6346.36
12572.3
2406.46
5214.5
9730.28
19691.6
4842.34
8380.14
16484.6
32999.4], 4, 6);

iter = [100 200 400 800];
subiter = [1 2 4 8 16 32];

lineStyle = {'b-', 'r-', 'g-', 'k-', 'c-', 'm-'};

%% Plot 

set(0,'DefaultAxesFontName', 'Times');
set(0,'DefaultAxesFontSize', 20);
set(0,'DefaultTextFontname', 'Times');
set(0,'DefaultTextFontSize', 20);

for i = 1:length(subiter)
    plot(t200_time(:,i), t200_perp(:,i), lineStyle{i}, 'MarkerSize', 10, 'LineWidth', 3);
    hold on;
end
%xlim([0.8 1300]);
ylim([3400 4000]);
%set(gca,'xtick',x);
set(gca, 'xscale', 'log');
legend('S = 1', 'S = 2', 'S = 4', 'S = 8', 'S = 16', 'S = 32');
%set(gca, 'xticklabel', {'1'; '2'; '4'; '8'; '16'; '32'; '64'; '128'; '256'; '512'; 'n'});
ylabel('perplexity');
xlabel('time/s');
title('K = 200');

figure;

for i = 1:length(subiter)
    plot(t1000_time(:,i), t1000_perp(:,i), lineStyle{i}, 'MarkerSize', 10, 'LineWidth', 3);
    hold on;
end
%xlim([0.8 1300]);
ylim([2700 3500]);
%set(gca,'xtick',x);
set(gca, 'xscale', 'log');
legend('S = 1', 'S = 2', 'S = 4', 'S = 8', 'S = 16', 'S = 32');
%set(gca, 'xticklabel', {'1'; '2'; '4'; '8'; '16'; '32'; '64'; '128'; '256'; '512'; 'n'});
ylabel('perplexity');
xlabel('time/s');
title('K = 1000');

% figure;
% h = errorbar(x, truncated(:, 6), truncated(:, 8), 'b^--', 'MarkerSize', 10, 'LineWidth', 3);
% hold on; errorbar(x, pg(:, 6), pg(:, 8), 'ro-.', 'MarkerSize', 10, 'LineWidth', 3);
% hold on; errorbar(x, gaussian(:, 6), gaussian(:, 8), 'k:', 'MarkerSize', 10, 'LineWidth', 3);
% xlim([0.8 1300]);
% ylim([70 10^5]);
% set(gca,'xtick',x);
% set(gca, 'xscale', 'log');
% set(gca, 'yscale', 'log');
% legend('truncated', 'pg1', 'gaussian');
% set(gca, 'xticklabel', {'1'; '2'; '4'; '8'; '16'; '32'; '64'; '128'; '256'; '512'; 'n'});
% set(gca,'ytick', [10 100 1000 10000 100000]);
% ylabel('time/s');
% xlabel('m');