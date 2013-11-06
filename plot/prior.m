t200=[3820.455962
3647.596705
3545.759381
3513.40424
3536.494465];

t1000=[3242.729968
3028.983976
2932.856217
2884.412412
2891.939893];

x=10.^[1 2 3 4 5];

set(0,'DefaultAxesFontName', 'Times');
set(0,'DefaultAxesFontSize', 20);
set(0,'DefaultTextFontname', 'Times');
set(0,'DefaultTextFontSize', 20);


h = plot(x, t200, 'b^--', 'MarkerSize', 10, 'LineWidth', 3);
hold on; plot(x, t1000, 'ro-.', 'MarkerSize', 10, 'LineWidth', 3);
xlim([10 100000]);
%ylim([1550 1580]);
set(gca,'xtick',x);
set(gca, 'xscale', 'log');
legend('k=200','k=1000');
%set(gca, 'xticklabel', {'1'; '2'; '4'; '8'; '16'; '32'; '64'; '128'; '256'; '512'; 'n'});
ylabel('perplexity');   
xlabel('a');
