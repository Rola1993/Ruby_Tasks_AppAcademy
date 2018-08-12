class ComputerPlayer
  attr_accessor :board, :mark, :name

  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    potential_moves = []

    (0...@board.grid.length).each do |r|
      (0...@board.grid.length).each do |c|
        potential_moves.push([r,c]) if @board.empty?([r,c])
      end
    end

    potential_moves.each do |move|
      return move if win?(move)
    end

    return move.sample
  end

  def win?(move)
    @board.place_mark(move, @mark)

    if @mark == @board.winner
      @board.grid[move.first][move.last] = nil
      return true
    else
      @board.grid[move.first][move.last] = nil
      return false
    end
  end

end
