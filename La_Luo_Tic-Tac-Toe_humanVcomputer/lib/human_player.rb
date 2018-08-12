class HumanPlayer
  attr_accessor :name, :mark

  def initialize(name)
    @name = name
  end

  def display(board)
    (0...board.grid.length).each do |r|
      (0...board.grid.length).each do |c|
        puts board.grid[r][c].to_s + ' '
      end
       puts "/n"
    end
  end

  def get_move
    puts "Where to place a move? Type in the form of 'row, col':"
    move = gets.chomp
    move = move.split(',').map(&:to_i)
    return move
  end

end
