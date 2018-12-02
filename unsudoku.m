function [ ] = unsudoku(solutions)
   % GAME = 9x9 matrix
    t = doke(); 
    c = 17:-2:1;
    k = 1:2:17;
    
    for i = 1:9
        for j = 1:9
            % 1, 1
            current = solutions(i,j);
            switch current
                case 1
                    text(k(j),c(i), '1', 'Color', 'green')
                case 2
                    text(k(j),c(i), '2', 'Color', 'green')
                case 3
                    text(k(j),c(i), '3', 'Color', 'green')
                case 4
                    text(k(j),c(i), '4', 'Color', 'green')
                case 5
                    text(k(j),c(i), '5', 'Color', 'green')
                case 6
                    text(k(j),c(i), '6', 'Color', 'green')
                case 7
                    text(k(j),c(i), '7', 'Color', 'green')
                case 8
                    text(k(j),c(i), '8', 'Color', 'green')
                case 9
                    text(k(j),c(i), '9', 'Color', 'green')
            end  
        end
    end

end