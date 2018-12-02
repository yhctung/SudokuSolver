function [ ] = sudoku(game)
    % GAME = 9x9 matrix
    t = doke();
    t = drawGrid(t);  
    c = 17:-2:1;
    k = 1:2:17;
    
    for i = 1:9
        for j = 1:9
            % 1, 1
            current = game(i,j);
            switch current
                case 1
                    text(k(j),c(i), '1')
                case 2
                    text(k(j),c(i), '2')
                case 3
                    text(k(j),c(i), '3')
                case 4
                    text(k(j),c(i), '4')
                case 5
                    text(k(j),c(i), '5')
                case 6
                    text(k(j),c(i), '6')
                case 7
                    text(k(j),c(i), '7')
                case 8
                    text(k(j),c(i), '8')
                case 9
                    text(k(j),c(i), '9')
            end  
        end
    end
    
   
    
end

                