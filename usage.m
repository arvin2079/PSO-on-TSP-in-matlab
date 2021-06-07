clc;
clear;
close all;

program.citiesNumber = 15;
program.PositionRange = [0 100];

params.MaxIt = 50;
params.nPop  = 20;
params.showPlot = 1;
params.showIters = 1;
% program
% params

out = pso(program, params);
figure;
plot(out.BestCost, 'LineWidth', 2)
% xlabel('iteration');
% ylabel('BestCost');
