class Board
  attr_accessor :grid

  def initialize(grid=[[nil,nil,nil],
                       [nil,nil,nil],
                       [nil,nil,nil]])
      @grid = grid
  end

  def place_mark(position, mark)
    row = position[0]
    col = position[1]
    if empty?(position)
      @grid[row][col] = mark
    else
      raise "This position isn't empty!"
    end
  end

  def empty?(position)
    return true if @grid[position.first][position.last] == nil
    false
  end

  def winner
    winner = nil

    # check rows
    num_o, num_x = 0, 0
    (0...@grid.length).each do |r|
      (0...@grid[0].length).each do |c|
          if @grid[r][c] == :O
            num_o += 1
          end
          if @grid[r][c] == :X
            num_x += 1
          end
      end
      winner = :O if num_o == @grid.length
      winner = :X if num_x == @grid.length
      num_o, num_x = 0, 0
    end

    # check columns
    num_o, num_x = 0, 0
    (0...@grid.length).each do |r|
      (0...@grid[0].length).each do |c|
          if @grid[c][r] == :O
            num_o += 1
          end
          if @grid[c][r] == :X
            num_x += 1
          end
      end
      winner = :O if num_o == @grid.length
      winner = :X if num_x == @grid.length
      num_o, num_x = 0, 0
    end

    # check left diagonal
    num_o, num_x = 0, 0
    (0...@grid.length).each do |i|
      if @grid[i][i] == :O
        num_o += 1
      elsif @grid[i][i] == :X
        num_x += 1
      end
    end
    winner = :O if num_o == @grid.length
    winner = :X if num_x == @grid.length

    # check right diagonal
    num_o, num_x = 0, 0
    (0...@grid.length).each do |i|
      if @grid[i][@grid.length-1-i] == :O
        num_o += 1
      elsif @grid[i][@grid.length-1-i] == :X
        num_x += 1
      end
    end
    winner = :O if num_o == @grid.length
    winner = :X if num_x == @grid.length

    return winner
  end

  def over?
    win = winner
    return true if win != nil
    (0...@grid.length).each do |r|
      (0...@grid[0].length).each do |c|
        return false if @grid[r][c] == nil
      end
    end
    return true
  end

end
