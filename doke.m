classdef doke
    %Turtle with a pen
    
    properties
        % list of properties
        % (x,y) coordinate specify position
        x
        y
        % heading: E=0, N=90, W=180, S=270
        heading
        % pen status true = on paper, false = not on paper
        pen_on_paper
    end
    
    methods
        % constructor
        function obj = doke()
            % makes new Turtle at origin, head north, pen on paper
            obj.x = 0;
            obj.y = 0;
            obj.heading = 90;
        end

        % rotate
        function obj = rotate_turtle(obj,angle)
            obj.heading = obj.heading + angle;
            
            while obj.heading <=0 || obj.heading > 360
                if obj.heading <= 0
                    obj.heading = obj.heading + 360;
                elseif obj.heading > 360
                    obj.heading = obj.heading - 360;
                end
            end
        end
        
        % move
        function obj = move_turtle(obj, distance, width)
            % find coordinates of new position
            x(1) = obj.x;
            y(1) = obj.y;
            x(2) = distance*cosd(obj.heading) + x(1);
            y(2) = distance*sind(obj.heading) + y(1);
           

                if width > 1
                    pl = line(x,y, 'LineWidth', 2)
                else
                pl = line(x,y)
                end

            
            obj.x = x(2);
            obj.y = y(2);
        end
        
        %
        % draw empty tic tac toe grid
        % -90 right
        % 90 left
        function t=drawGrid(t)
            
            t=move_turtle(t,18,2);
            t=rotate_turtle(t,-90);
            t=move_turtle(t,18,2);
            t=rotate_turtle(t,-90);
            t=move_turtle(t,18,2);
            
            % vertical lines
                t=rotate_turtle(t,-90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,18,2);
                
                t=rotate_turtle(t,90);
                t=move_turtle(t,2,0);
                t=rotate_turtle(t,90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,90);
                t=move_turtle(t,18,2);
                
                t=rotate_turtle(t,-90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,18,2);
            % -----------------------------
                t=rotate_turtle(t,180);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,90);
                t=move_turtle(t,18,2);
            % -----------------------------

                t=rotate_turtle(t,90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,90);
                t=move_turtle(t,18,2);
                
                t=rotate_turtle(t,-90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,18,2);

                t=rotate_turtle(t,90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,-90);
                t=move_turtle(t,18,0);
                t=rotate_turtle(t,90);
                t=move_turtle(t,2,2);
                t=rotate_turtle(t,90);
                t=move_turtle(t,18,2);
                
          set(gca,'xticklabel', [ ])
          set(gca,'yticklabel', [ ])
        end
        
       
            
    end
        
        
        
end
