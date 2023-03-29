# TSP Implementation With PSO
Implementing one important algorithm of Swarm intelligence called particle swarm optimation or (PSO) on travelling salesman problem in matlab.
 
 ## PSO 
 Here is a short description of PSO algorithm by [wikipedia](https://en.wikipedia.org/wiki/Particle_swarm_optimization).
particle swarm optimization is a computational method that optimizes a problem by iteratively trying to improve a candidate solution with a given measure of quality. It solves a problem by having a population of random solutions, here dubbed particles, and moving these particles around in the search-space according to simple mathematical formula over the particle's position and velocity. Each particle's movement is influenced by its **local best** known position, but is also guided toward the **global best** position in the search-space, which are updated as better positions are found by other particles. This is expected to move the swarm toward the best solutions.
> for more information about the method PSO mentioned and described a bit above you can take a look at [Particle Swarm Optimization](http://ai.unibo.it/sites/ai.unibo.it/files/u11/pso.pdf) by James Kennedy and Russell Eberhart.

## TSP
Also here is a short description of PSO algorithm by [wikipedia](https://en.wikipedia.org/wiki/Travelling_salesman_problem).
The travelling salesman problem (also called the traveling salesperson problem or (TSP) asks the following question: `Given a list of cities and the distances between each pair of cities, what is the shortest possible route that visits each city exactly once and returns to the origin city?` It is an NP-hard problem in combinatorial optimization, important in theoretical computer science and operations research.

## Algorithms Implementation Description
As we all know, PSO has greate performance on a various range of optimization problems with continuous search space. nevertheless in this project we need to follow some general alteration which follow the basic idea of the algorithm to make it suitable and applicabale for discreate variables. this new form of PSO called Integer and Categorical PSO (ICPSO).
> for more information about ICPSO suggest you to read [A New Discrete Particle Swarm Optimization Algorithm](https://www.cs.montana.edu/sheppard/pubs/gecco-2016a.pdf) by Shane Strasser, Rollie Goodman, John Sheppard and Stephyn Butcher.

>also you can check out the [Solving City Routing Issue with Particle Swarm Optimization]() by Sarman K. Hadia, Arjun H. Joshi, Chaitalee K. Patelt and Yogesh P Kostato find better vision on the work we have done here.

## MIT License
Copyright (c) 2021 ArvinSadeghi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
