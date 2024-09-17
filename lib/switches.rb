class Pattern
  def initialize
    x = rand(3)
    @grid = case x
      when 0 # Square
        [[false, false, false, false, false],
        [false, true, true, true, false],
        [false, true, false, true, false],
        [false, true, true, true, false],
        [false, false, false, false, false]]
      when 1 # X
        [[true, false, false, false, true],
        [false, true, false, true, false],
        [false, false, true, false, false],
        [false, true, false, true, false],
        [true, false, false, false, true]]
      else # Diamond + Center
        [[false, false, true, false, false],
        [false, true, false, true, false],
        [true, false, true, false, true],
        [false, true, false, true, false],
        [false, false, true, false, false]]
      end
  end

  def switch(x,y)

    directions = [[0,0],[1,0],[-1,0],[0,1],[0,-1]]
    directions.each do |dir|
      _x = x+dir[0]
      _y = y+dir[1]
      inBounds =
        _x <= 4 && _x >= 0 &&
        _y <= 4 && _y >= 0
      
      if inBounds
        @grid[_x][_y] = !@grid[_x][_y]
      end
    end
  end

  def won?
    @grid.all? { |x| x.all? == true}
  end

  def visualGrid
    visual = "
        0   1   2   3   4
      ┌───┬───┬───┬───┬───┐"

    @grid.each_with_index do |l, idx|
      visual += "
   #{idx}  │ #{l[0] ? 'x':' '} │ #{l[1] ? 'x':' '} │ #{l[2] ? 'x':' '} │ #{l[3] ? 'x':' '} │ #{l[4] ? 'x':' '} │"
      if idx >= 4
        break
      end
      visual += "
      ├───┼───┼───┼───┼───┤"
    end
    visual += "
      └───┴───┴───┴───┴───┘"
  end
end




module Switches
  def self.run
    won = false
    moves = 0
    pattern = Pattern.new
    while !won
      
      puts pattern.visualGrid
      puts 'Type the coordinates of the light you want to switch e.g. "x,y"'
      
      # Get Coordinates
      properInput = false
      while !properInput
        input = gets
        x = input.split(',')[0].to_i
        y = input.split(',')[1].to_i
        
        properInput = x >= 0 && x <= 4 && y >= 0 && y <= 4
        if properInput
          break
        end
        puts 'Invalid coordinates. ' + x.to_s+','+y.to_s
      end

      pattern.switch(y,x) # fix because visual Grid is rotated 90°

      # win condition
      moves += 1
      won = pattern.won?
    end
    puts pattern.visualGrid
    puts
    puts 'You won!'
    puts 'Used Moves: '+moves.to_s
    puts
  end
end


Switches.run