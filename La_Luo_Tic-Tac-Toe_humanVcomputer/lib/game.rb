require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :player_one, :player_two, :board, :current_player, :winner

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @player_one.mark = :X
    @player_two.mark = :O
    @current_player = @player_one
    @board = Board.new
  end

  def play_turn
    board.place_mark(@current_player.get_move, @current_player.mark)
    switch_players!
    @current_player.display
  end

  def switch_players!
    @current_player = @current_player == @player_one? @player_two: @player_one
  end

  def play

    while true
      play_turn
      if @current_player.mark == @board.winner
        puts "#{@current_player.name} won!"
        break
      end
    end

  end

end

if $PROGRAM_NAME == __FILE__

  print "Enter your name: "
  name = gets.chomp.strip
  human = HumanPlayer.new(name)
  computer = ComputerPlayer.new('Computer')

  new_game = Game.new(human, computer)
  new_game.play
end
