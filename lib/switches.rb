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
      when 2 # Diamond + Center
        [[false, false, true, false, false],
        [false, true, false, true, false],
        [true, false, true, false, true],
        [false, true, false, true, false],
        [false, false, true, false, false]]
      else
        puts 'why?'
      end
  end

  def check(x,y)
    grid[x][y]
  end

  def switch(x,y)
    grid[x][y] = !grid[x][y]
    if y+1 <= 4 # bottom
      grid[x][y+1] = !grid[x][y+1]
    end
    if y-1 >= 0 # top
      grid[x][y-1] = !grid[x][y-1]
    end
    if x-1 >= 0 # left
      grid[x-1][y] = !grid[x-1][y]
    end
    if x+1 <= 4 # right
      grid[x+1][y] = !grid[x+1][y]
    end
  end

  def grid
    @grid
  end

  def visualGrid
    visual = "
      0   1   2   3   4
    ┌───┬───┬───┬───┬───┐
  0 │ #{grid[0][0] ? 'x':' '} │ #{grid[1][0] ? 'x':' '} │ #{grid[2][0] ? 'x':' '} │ #{grid[3][0] ? 'x':' '} │ #{grid[4][0] ? 'x':' '} │
    ├───┼───┼───┼───┼───┤
  1 │ #{grid[0][1] ? 'x':' '} │ #{grid[1][1] ? 'x':' '} │ #{grid[2][1] ? 'x':' '} │ #{grid[3][1] ? 'x':' '} │ #{grid[4][1] ? 'x':' '} │
    ├───┼───┼───┼───┼───┤
  2 │ #{grid[0][2] ? 'x':' '} │ #{grid[1][2] ? 'x':' '} │ #{grid[2][2] ? 'x':' '} │ #{grid[3][2] ? 'x':' '} │ #{grid[4][2] ? 'x':' '} │
    ├───┼───┼───┼───┼───┤
  3 │ #{grid[0][3] ? 'x':' '} │ #{grid[1][3] ? 'x':' '} │ #{grid[2][3] ? 'x':' '} │ #{grid[3][3] ? 'x':' '} │ #{grid[4][3] ? 'x':' '} │
    ├───┼───┼───┼───┼───┤
  4 │ #{grid[0][4] ? 'x':' '} │ #{grid[1][4] ? 'x':' '} │ #{grid[2][4] ? 'x':' '} │ #{grid[3][4] ? 'x':' '} │ #{grid[4][4] ? 'x':' '} │
    └───┴───┴───┴───┴───┘"
  end

  def winningPattern # Development method to test win condition
    @grid = Array.new(5){Array.new(5, true)}
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

      pattern.switch(x,y)

      # win condition
      moves += 1
      won = pattern.grid.all? { |x| x.all? == true}
    end
    puts pattern.visualGrid
    puts
    puts 'You won!'
    puts 'Used Moves: '+moves.to_s
    puts
  end
end


Switches.run