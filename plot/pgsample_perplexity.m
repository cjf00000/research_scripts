x = 2.^ (0:10);

set(0,'DefaultAxesFontName', 'Times');
set(0,'DefaultAxesFontSize', 20);
set(0,'DefaultTextFontname', 'Times');
set(0,'DefaultTextFontSize', 20);


h = errorbar(x, truncated(:, 3), truncated(:, 5), 'b^--', 'MarkerSize', 10, 'LineWidth', 3);
hold on; errorbar(x, pg(:, 3), pg(:, 5), 'ro-.', 'MarkerSize', 10, 'LineWidth', 3);
hold on; errorbar(x, gaussian(:, 3), gaussian(:, 5), 'k:', 'MarkerSize', 10, 'LineWidth', 3);
xlim([0.8 1300]);
ylim([1550 1580]);
set(gca,'xtick',x);
set(gca, 'xscale', 'log');
legend('truncated', 'pg1', 'gaussian');
set(gca, 'xticklabel', {'1'; '2'; '4'; '8'; '16'; '32'; '64'; '128'; '256'; '512'; 'n'});
ylabel('perplexity');
xlabel('m');

figure;
h = errorbar(x, truncated(:, 6), truncated(:, 8), 'b^--', 'MarkerSize', 10, 'LineWidth', 3);
hold on; errorbar(x, pg(:, 6), pg(:, 8), 'ro-.', 'MarkerSize', 10, 'LineWidth', 3);
hold on; errorbar(x, gaussian(:, 6), gaussian(:, 8), 'k:', 'MarkerSize', 10, 'LineWidth', 3);
xlim([0.8 1300]);
ylim([70 10^5]);
set(gca,'xtick',x);
set(gca, 'xscale', 'log');
set(gca, 'yscale', 'log');
legend('truncated', 'pg1', 'gaussian');
set(gca, 'xticklabel', {'1'; '2'; '4'; '8'; '16'; '32'; '64'; '128'; '256'; '512'; 'n'});
set(gca,'ytick', [10 100 1000 10000 100000]);
ylabel('time/s');
xlabel('m');