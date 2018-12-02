% By submitting this assignment, I agree to the following:
%  “Aggies do not lie, cheat, or steal, or tolerate those who do”
%  “I have not given or received any unauthorized aid on this assignment”

% Name: 		YUNG-HSIN TUNG
% Section:		201
% Team:         6
% Assignment:	MATLAB SUDOKU PRELIM
% Date:         18 APRIL 2018

% REQUIREMENTS
    % load a puzzle from a file or give the user the option of entering a puzzle by hand.
    % display the puzzle entered showing the puzzle grid along with the initial puzzle entries.
    % implement the algorithm you developed to attempt to solve the puzzle.  
    % display any new entries found through your algorithm 
    % ahow whether algorithm was successful (solved or stuck?)
    
%-------------------------------------------------------------------------

% INPUT
% make a 9x9 grid
        choice = input('Do you want to input your puzzle as an array [1] or use one from SamplePuzzles2.mat [2]? \nChoose 1 or 2: ');
        if choice == 1
            game = input('Please input your game in a 9x9 array format: ');
        elseif choice == 2
            load('SamplePuzzles2.mat')
            game = input('Please input the game name (variable): ');
        else
            error('Please select a valid option.')
        end
clear choice

% set up puzzle
sudoku(game);

%-------------------------------------------------------------------------

% GAME IN MATRIX FORM
    s = struct;
    % where boxes go 123; 456; 789
        s(1).box = [horzcat( game(1, 1:3), game(2, 1:3), game(3, 1:3) )];
        s(2).box = [horzcat( game(1, 4:6), game(2, 4:6), game(3, 4:6) )];
        s(3).box = [horzcat( game(1, 7:9), game(2, 7:9), game(3, 7:9) )];

        s(4).box = [horzcat( game(4, 1:3), game(5, 1:3), game(6, 1:3) )];
        s(5).box = [horzcat( game(4, 4:6), game(5, 4:6), game(6, 4:6) )];
        s(6).box = [horzcat( game(4, 7:9), game(5, 7:9), game(6, 7:9) )];

        s(7).box = [horzcat( game(7, 1:3), game(8, 1:3), game(9, 1:3) )];
        s(8).box = [horzcat( game(7, 4:6), game(8, 4:6), game(9, 4:6) )];
        s(9).box = [horzcat( game(7, 7:9), game(8, 7:9), game(9, 7:9) )];
    % set up rows and columns arrays
    for i = 1:9
        s(i).row = game(i,:);    
        s(i).col = game(:,i);
    end

%-------------------------------------------------------------------------

% GENERATING POTENTIALS
for a = 1:9
    % compare each box with potents ==> get boxpots
    potents = 1:9;
    k = find(s(a).box);
    present = sort(s(a).box(k));

    for i = 1:length(present)
        for j = 1:length(potents)
            if present(i) == potents(j)
                potents(j) = 0;
            end
        end
    end
    s(a).boxpot = potents;
end

clear a k i j potents present

%-------------------------------------------------------------------------

% IMPLEMENTING ALGORITHM

    nbox = zeros(1,9);
    fullgrid = 0;
    counter = 0;
    

    while fullgrid == 0
        counter = counter + 1;
        % number count per box
        for a = 1:9
            nbox(a) = length(find(s(a).box));
        end

        % is the grid full?
        if sum(nbox) == 81
            fullgrid = 1;
        else
            fullgrid = 0;
        end

        % making 0s and 1s for potential number spots
        for c = 1:9
            realbox = s(c).box;
            realbox = vertcat(realbox(1, 1:3), realbox(1, 4:6), realbox(1, 7:9));
            k = find( realbox > 0);
            tab = ones(3,3);
            for i = 1:length(k)
                tab(k(i)) = 0;
            end

            clear i k

        % make list of possible numbers for realbox
        w = find( s(c).boxpot > 0 );
        s(c).possible = sort(s(c).boxpot(w));
        possible = s(c).possible;
        clear w

        % current box's potential grids
        o = struct;

        % each possible number gets a table of possible places, from "tab"
        for a = possible
            o(a).yayornay = tab;
        end
        clear a

        % test possible numbers
        for a = 1:length(possible)
            for b = 1:3
                switch c
                    case {1 , 2 , 3}
                       currentRow = s(b).row;
                    case {4 , 5 , 6}
                       currentRow = s(b+3).row;
                    case {7 , 8 , 9}
                       currentRow = s(b+6).row;
                end

                switch c
                    case {1 , 4 , 7}
                        currentCol = s(b).col;
                    case {2 , 5 , 8}
                        currentCol = s(b+3).col;
                    case {3 , 6 , 9}
                        currentCol = s(b+6).col;
                end
                currentPots = o(possible(a)).yayornay;
                if ismember(possible(a), currentRow) == 1
                    currentPots(b, :) = 0;
                end
                if ismember(possible(a), currentCol) == 1
                    currentPots(:, b) = 0;
                end
                o(possible(a)).yayornay = currentPots;
                clear currentPots
            end
        end

        clear currentRow currentCol currentPots a b 

        % save potential grids for possible numbers for each box
        for p = possible
            box(c).yayornay(p).pos = o(p).yayornay;
        end

            % check if any solved
            for a = 1:length(possible)
                % current possible number
                PossibleNum = o(possible(a)).yayornay;
                PossibleNum = reshape(PossibleNum.', [], 1)';

                if sum (PossibleNum) == 1
                    theSpot = find( PossibleNum == 1);

                    temp = s(c).box;
                    temp(theSpot) = possible(a);
                    s(c).box = temp;
                    clear temp

                    temp = s(c).boxpot;
                    q = find(temp == possible(a));
                    temp(q) = 0;
                    s(c).boxpot = temp;
                    clear q temp

                    % update rows and columns
                    % for row
                    switch c
                        case {1 , 2 , 3}
                            switch theSpot
                                case {1 , 2 , 3}
                                   r = 1;
                                case {4 , 5 , 6}
                                   r = 2;
                                case {7 , 8 , 9}
                                   r = 3;
                            end
                        case {4 , 5 , 6}
                            switch theSpot
                                case {1 , 2 , 3}
                                   r = 4;
                                case {4 , 5 , 6}
                                   r = 5;
                                case {7 , 8 , 9}
                                   r = 6;
                            end
                       case {7 , 8 , 9}
                            switch theSpot
                                case {1 , 2 , 3}
                                   r = 7;
                                case {4 , 5 , 6}
                                   r = 8;
                                case {7 , 8 , 9}
                                   r = 9;
                            end
                    end

                    % for col
                    switch c
                        case {1 , 4 , 7}
                            switch theSpot
                                case {1 , 4 , 7}
                                   co = 1;
                                case {2 , 5 , 8}
                                   co = 2;
                                case {3 , 6 , 9}
                                   co = 3;
                            end
                        case {2 , 5 , 8}
                            switch theSpot
                                case {1 , 4 , 7}
                                   co = 4;
                                case {2 , 5 , 8}
                                   co = 5;
                                case {3 , 6 , 9}
                                   co = 6;
                            end
                       case {3 , 6 , 9}
                            switch theSpot
                                case {1 , 4 , 7}
                                   co = 7;
                                case {2 , 5 , 8}
                                   co = 8;
                                case {3 , 6 , 9}
                                   co = 9;
                            end
                    end

                    temp = s(r).row;
                    temp(co) = possible(a);
                    s(r).row = temp;
                    clear temp

                    temp = s(co).col;
                    temp(r) = possible(a);
                    s(co).col = temp;
                    clear temp


                    % update other possible #s potential grids
                    for p = possible
                       bee = box(c).yayornay(p).pos;
                       bee(theSpot) = 0;
                       box(c).yayornay(p).pos = bee; 
                       clear bee
                    end
                end  

            end
        end
        
        if counter > 3000
            fprintf('Puzzle could not be solved.\n')
            solution = cat(1, s(1).row, s(2).row, s(3).row, s(4).row, s(5).row, s(6).row, s(7).row, s(8).row, s(9).row);
            zeroNum = numel(find(~solution));
            zeroNum1 = numel(find(~game));
            solved = zeroNum1 - zeroNum;
            fprintf('%i spaces left,\nsolved %i numbers\n', zeroNum, solved)
            clear zeroNum solution zeroNum1 solved
            break
        end
    end

    if fullgrid == 1
        fprintf('Your puzzle has been solved! \n')
    end
%-------------------------------------------------------------------------

% OUTPUT

    solut = cat(1, s(1).row, s(2).row, s(3).row, s(4).row, s(5).row, s(6).row, s(7).row, s(8).row, s(9).row);
    graphThis = solut - game;
    unsudoku(graphThis)

    