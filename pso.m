function out = pso(problem, params)
    %% Problem Definition
    % CITIES NUMBER MUST BE MORE THAN 4 
    CostFunction = @(x, y) TSPcostFunction(x, y); % Cost Function

    citiesNumber = problem.citiesNumber; % Number of TSP cities ( > 4)

    PositionSize = [citiesNumber 2]; % Size of Decision Variables Position Matrix
    ParticleSize = [1 citiesNumber]; % Size of Decision Variables Matrix

    PositionMin = problem.PositionRange(1); % Lower Bound of Variables position 
    PositionMax = problem.PositionRange(2); % Upper Bound of Variables position 

    %% PSO Parameters

    MaxIt=params.MaxIt;      % Maximum Number of Iterations

    nPop=params.nPop;        % Population Size (Swarm Size)

    % PSO Parameters
    alpha = .85; % Personal Learning Coefficient
    beta = .85; % Global Learning Coefficient
    
    showPlot = params.showPlot;
    showIters = params.showIters;

    %% Initialization

    empty_particle.citySequence = [];
    empty_particle.Cost = [];
    empty_particle.Velocity = [];
    empty_particle.Best.citySequence = [];
    empty_particle.Best.Cost = [];

    particle = repmat(empty_particle, nPop, 1);

    GlobalBest.Cost = inf;
    
    % initialize city positions
    cityPositions = unifrnd(PositionMin, PositionMax, PositionSize);

    for i = 1:nPop
  
        % Initialize city sequence
        particle(i).citySequence = randperm(citiesNumber);

        % Initialize Velocity
        particle(i).Velocity = randi(citiesNumber, [2, 3]);

        % Evaluation
        particle(i).Cost = CostFunction(particle(i).citySequence, cityPositions);
        
        % Update Personal Best
        particle(i).Best.citySequence = particle(i).citySequence;
        particle(i).Best.Cost = particle(i).Cost;
        
        % Update Global Best
        if particle(i).Best.Cost < GlobalBest.Cost

            GlobalBest = particle(i).Best;

        end

    end

    out.BestCost = zeros(MaxIt, 1);

    %% PSO Main Loop
    
    for it = 1:MaxIt

        for i = 1:nPop

            % particle(i).Velocity
            PbestMinusCitySequence = subtract(particle(i).Best.citySequence, particle(i).citySequence);
            GbestMinusCitySequence = subtract(GlobalBest.citySequence, particle(i).citySequence);
            
            if ~isempty(PbestMinusCitySequence)
                for k=1:length(PbestMinusCitySequence(1,:))
                    if rand <= alpha
                        particle(i).Velocity = [particle(i).Velocity, PbestMinusCitySequence(:, k)];
                    end
                end
            end
            if ~isempty(GbestMinusCitySequence)
                for k=1:length(GbestMinusCitySequence(1,:))
                    if rand <= beta
                        particle(i).Velocity = [particle(i).Velocity, GbestMinusCitySequence(:, k)];
                    end
                end
            end

            % Update Position
            for k=1:length(particle(i).Velocity(1,:))
                particle(i).citySequence = swap(particle(i).citySequence, particle(i).Velocity(:, k));
            end

            %% obey constarint

            % Evaluation
            particle(i).Cost = CostFunction(particle(i).citySequence, cityPositions);

            % Update Personal Best
            if particle(i).Cost < particle(i).Best.Cost

                particle(i).Best.citySequence = particle(i).citySequence;
                particle(i).Best.Cost = particle(i).Cost;

                % Update Global Best
                if particle(i).Best.Cost < GlobalBest.Cost

                    GlobalBest = particle(i).Best;

                end

            end

        end

        out.BestCost(it) = GlobalBest.Cost;
        
        if showIters
            disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(GlobalBest.Cost)]);
        end
        
        % setting sequence of best city position so far for ploting on
        % cartesian coordination
        if showPlot
            CurrentCityPositionSeq = [];
            for i=1:length(GlobalBest.citySequence)
                CurrentCityPositionSeq = [CurrentCityPositionSeq; cityPositions(GlobalBest.citySequence(i), :)];
            end
            CurrentCityPositionSeq = [CurrentCityPositionSeq; cityPositions(GlobalBest.citySequence(1), :)];

            fontSize = 12;
            x = CurrentCityPositionSeq(:, 1);
            y = CurrentCityPositionSeq(:, 2);
            plot(x, y, 'bo-', 'LineWidth', 1, 'MarkerSize', 4);
            pause(0.1)
            grid on;
            title(['iteration' num2str(it)], 'FontSize', fontSize);
            xlabel('X', 'FontSize', fontSize);
            ylabel('Y', 'FontSize', fontSize);
            % Now plot index numbers along side the markers.
            hold off;
        end
        %%
%         m1 = GlobalBest.Position;
%         [val, ind] = sort(m1, 'descend');
%         path = [ind ind(1)];

%         %clf;
%         cla;
%         hold on
% 
%         for p = 1:(size(path, 2)) - 1
%             line([X(path(p)) X(path(p + 1))], [Y(path(p)) Y(path(p + 1))], 'Color', 'm', 'LineWidth', 2, 'LineStyle', '-')
%             arrow([X(path(p)) Y(path(p))], [X(path(p + 1)) Y(path(p + 1))])
%         end
% 
%         hold on
% 
%         for i2 = 1:nVar
%             plot(X(i2), Y(i2), 'o', 'LineWidth', 1, ...
%                 'MarkerEdgeColor', 'k', ...
%                 'MarkerFaceColor', 'w', ...
%                 'MarkerSize', 8);
%             xlabel('X in m')
%             ylabel('Y in m')
%             text(X(i2) + 2, Y(i2), num2str(i2), 'FontSize', 10);
%             hold on
% 
%             plot(X(path(1)), Y(path(1)), 'o', 'LineWidth', 1, ...
%                 'MarkerEdgeColor', 'k', ...
%                 'MarkerFaceColor', 'g', ...
%                 'MarkerSize', 10);
%             xlabel('X in m')
%             ylabel('Y in m')
% 
%         end
% 
%         pause(0.05);

    end

    out.BestSol = GlobalBest;
    
end



    %% Results

    % figure;
    % %plot(BestCost,'LineWidth',2);
    % semilogy(BestCost,'LineWidth',2);
    % xlabel('Iteration');
    % ylabel('Best Cost');
    % grid on;
