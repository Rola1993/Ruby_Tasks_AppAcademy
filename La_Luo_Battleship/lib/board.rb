class Board
  attr_accessor :grid

  # !should use "grid.flatten.none? { |el| el == :s }" instead of nested loop

  def initialize(grid = self.class.default_grid)
    @grid = grid
  end

  def self.default_grid
    return Array.new(10) { Array.new(10) }
  end

  def random
    10.times { place_random_ship }
  end

  def [](position) # to make game.board[[1, 1]] work
    row, col = position
    return @grid[row][col]
  end

  def count
    # better statement: grid.flatten.select { |el| el == :s }.length
    num = 0
    (0...@grid.length).each do |i|
      (0...@grid.length).each do |j|
        num += 1 if @grid[i][j] == :s
      end
    end
    return num
  end

  def empty?(position = [-1,-1])
    if position == [-1,-1]
      (0...@grid.length).each do |i|
        (0...@grid.length).each do |j|
          return false if @grid[i][j] == :s
        end
      end
      return true
    end
    return true if @grid[position.first][position.last] == nil
    false
  end

  def full?
    # better statement: grid.flatten.none?(&:nil?)
    (0...@grid.length).each do |i|
      (0...@grid.length).each do |j|
        return false if @grid[i][j] == nil
      end
    end
    true
  end

  def place_random_ship
    raise "The board is full!" if full?

    while true
      # generates a random number between 0 to @grid.length-1
      ran_pos = [rand(@grid.length), rand(@grid.length)]
      if empty?(ran_pos)
        @grid[ran_pos.first][ran_pos.last] = :s
        break
      end
    end
  end

  def won?
    # better statement: grid.flatten.none? { |el| el == :s }
    (0...@grid.length).each do |i|
      (0...@grid.length).each do |j|
        return false if @grid[i][j] == :s
      end
    end
    true
  end

end
