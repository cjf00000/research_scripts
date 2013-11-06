pg_perp=[2013.111261
1861.368329
1795.602937
1733.227776
1682.16528
1650.861259
1628.915893
1605.933732
1601.94072
1575.527927];
pg_time=[77.0727
82.2488
84.5037
88.849
88.2175
93.9716
99.398
98.9478
100.786
106.238];
mimno_perp=[2077.218466
1896.410872
1816.955045
1751.651423
1707.293375
1678.001749
1641.180436
1607.47542
1592.262965
1576.583662];
mimno_time=[80.3902
95.3302
94.934
104.065
106.79
113.999
120.775
126.913
131.938
143.072];

x=10:10:100;

set(0,'DefaultAxesFontName', 'Times');
set(0,'DefaultAxesFontSize', 20);
set(0,'DefaultTextFontname', 'Times');
set(0,'DefaultTextFontSize', 20);


h = plot(x, pg_perp, 'r^--', 'MarkerSize', 10, 'LineWidth', 3);
hold on; plot(x, mimno_perp, 'bo-.', 'MarkerSize', 10, 'LineWidth', 3);
%xlim([10 100000]);
%ylim([1550 1580]);
set(gca,'xtick',x);
%set(gca, 'xscale', 'log');
legend('PG', 'U');
%set(gca, 'xticklabel', {'1'; '2'; '4'; '8'; '16'; '32'; '64'; '128'; '256'; '512'; 'n'});
ylabel('perplexity');   
xlabel('K');

figure;
h = plot(x, pg_time, 'r^--', 'MarkerSize', 10, 'LineWidth', 3);
hold on; plot(x, mimno_time, 'bo-.', 'MarkerSize', 10, 'LineWidth', 3);
%xlim([10 100000]);
%ylim([1550 1580]);
set(gca,'xtick',x);
%set(gca, 'xscale', 'log');
legend('PG', 'U');
%set(gca, 'xticklabel', {'1'; '2'; '4'; '8'; '16'; '32'; '64'; '128'; '256'; '512'; 'n'});
ylabel('time/s');   
xlabel('K');
