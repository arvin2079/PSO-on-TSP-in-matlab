clc;
clear;
close all;

program.citiesNumber = 100;
program.PositionRange = [0 40];

params.MaxIt = 50;
params.nPop = 50;
params.showPlot = 1;
params.showIters = 1;
% program
% params

pso(program, params)
