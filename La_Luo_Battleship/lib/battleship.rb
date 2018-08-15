require_relative "board"
require_relative "player"

class BattleshipGame
  attr_reader :board, :player

  def initialize(player, board)
    @board = board
    @player = player
  end

  def display
    (0...@board.grid.length).each do |r|
      (0...@board.grid.length).each do |c|
        if @board.grid[r][c] != :x
          print '~' + '|'
        else
          print @board.grid[r][c].to_s + '|'
        end
      end
        print "\n"
    end
  end

  def attack(position)
    if @board.grid[position.first][position.last] == :s
      puts "You hit a ship!"
    end
    @board.grid[position.first][position.last] = :x
  end

  def count
    @board.count
  end

  def game_over?
    @board.won?
  end

  def play_turn
    display
    move = @player.get_play
    attack(move)
  end

  def play

    while true
      play_turn
      if game_over?
        puts "You won!"
        break
      end
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "Please input your name:"
  new_player = HumanPlayer.new(gets.chomp)
  new_board = Board.new()
  new_board.random
  new_game = BattleshipGame.new(new_player, new_board)
  new_game.play
end
